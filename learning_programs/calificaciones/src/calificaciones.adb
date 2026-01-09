with Ada.Strings;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.Strings.Maps;        use Ada.Strings.Maps;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;

with Alumns;                  use Alumns;
with Utils;

procedure Calificaciones is
   package ASU renames Ada.Strings.Unbounded;   use ASU;

   INPUT_FILENAME : constant String    := "calificaciones.txt";
   MAX_LINE_LEN   : constant Integer   := 128;
   MAX_TOKENS     : constant Integer   := 4;
   MAX_TOKEN_LEN  : constant Integer   := MAX_LINE_LEN / MAX_TOKENS;

   procedure Load_Marks is
      Whitespace : constant Character_Set := To_Set (' ');

      type TokensArr is array (1 .. MAX_TOKENS) of Unbounded_String;

      function Alumn (Tokens : TokensArr; Al : out AlumnType) return Boolean is
      begin
         return Utils.Is_Str (Tokens (1));
      end Alumn;

      function Line_2_Alumn (Line : String; Al : out AlumnType) return Boolean is
         I : Natural := 1;
         F : Positive;
         L : Natural;
         Tokens : TokensArr;
         Token_Index : Natural := 1;
      begin
         while I in Line'Range loop
            Ada.Strings.Fixed.Find_Token (
               Source => Line,
               Set => Whitespace,
               From => I,
               Test => Ada.Strings.Outside,
               First => F,
               Last => L);
            exit when (L = 0) or (Token_Index > MAX_TOKENS);

            if (L - F) > MAX_TOKEN_LEN then
               L := F + MAX_TOKEN_LEN;
            end if;
            Put_Line ("Word " & Line (F .. L) & ": from" & Positive'Image (F) & " to" & Natural'Image (L));
            --  Tokens (Token_Index) := TokenType (Line (F .. L));
            Tokens (Token_Index) := To_Unbounded_String (Line (F .. L));
            I := L + 1;
            Token_Index := Token_Index + 1;
         end loop;

         if Token_Index = (MAX_TOKENS + 1) then
            return Alumn (Tokens, Al);
         else
            return False;
         end if;
      end Line_2_Alumn;

      function Read_Alumn (F : File_Type; Al : out AlumnType) return Boolean is
         Line  : String (1 .. MAX_LINE_LEN);
         Len   : Natural;
      begin
         Get_Line (F, Line, Len);
         return Line_2_Alumn (Line (1 .. Len), Al);
      end Read_Alumn;

      F     : File_Type;
      Al    : AlumnType;
   begin
      Open (F, In_File, INPUT_FILENAME);

      while not End_Of_File (F) loop
         if Read_Alumn (F, Al) then
            --  Save Alumn in linked list
            Put_Line ("Alumno Leido");
         else
            Put_Line ("alumno Incorrecto");
         end if;
      end loop;

      Close (F);
   end Load_Marks;

begin
   Load_Marks;
   Ada.Text_IO.Put_Line ("Hello World");
   exception
      when Ada.IO_Exceptions.Name_Error =>
         Ada.Text_IO.Put_Line ("[ERROR] Input file doesn't exist!");
end Calificaciones;
