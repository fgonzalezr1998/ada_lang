with Ada.Text_IO;    use Ada.Text_IO;

package body Utils is
   A_MAYUS_ASCII_POS : constant Character := 'A';
   Z_MAYUS_ASCII_POS : constant Character := 'Z';
   A_LOWER_ASCII_POS : constant Character := 'a';
   Z_LOWER_ASCII_POS : constant Character := 'z';
   ZERO_ASCII_POS    : constant Character := '0';
   NINE_ASCII_POS    : constant Character := '9';
   NIF_LENGTH        : constant Natural   := 9;

   function Is_Char (C : Character) return Boolean is
      function Is_Upper_Char (C : Character) return Boolean is
      begin
         return Character'Pos (C) >= Character'Pos (A_MAYUS_ASCII_POS)
                  and Character'Pos (C) <= Character'Pos (Z_MAYUS_ASCII_POS);
      end Is_Upper_Char;

      function Is_Lower_Char (C : Character) return Boolean is
      begin
         return Character'Pos (C) >= Character'Pos (A_LOWER_ASCII_POS)
                  and Character'Pos (C) <= Character'Pos (Z_LOWER_ASCII_POS);
      end Is_Lower_Char;
   begin
      return Is_Lower_Char (C) or Is_Upper_Char (C);
   end Is_Char;

   function Is_Str (Str : Unbounded_String) return Boolean is
      Char_IsOk : Boolean;
      C : Character;
      I : Natural := 1;
   begin
      loop
         C := Element (Str, I);
         Char_IsOk := Is_Char (C);

         exit when not Char_IsOk
                  or I = Length (Str);
         I := I + 1;
      end loop;

      return Char_IsOk;
   end Is_Str;

   function Is_NIF (Str : Unbounded_String) return Boolean is
      NIF_IsOk : Boolean;
      I : Natural := 1;
      C : Character;
   begin
      --  Check Length
      if Length (Str) = NIF_LENGTH then
         --  Check the 8 numberic digits
         loop
            C := Element (Str, I);
            NIF_IsOk := Character'Pos (C) >= Character'Pos (ZERO_ASCII_POS)
                     and Character'Pos (C) <= Character'Pos (NINE_ASCII_POS);

            exit when I = (NIF_LENGTH - 1)
                     or not NIF_IsOk;
            I := I + 1;
         end loop;
      else
         NIF_IsOk := False;
      end if;

      --  Check the last digit (Char)
      if (NIF_IsOk) then
         C := Element (Str, NIF_LENGTH);
         NIF_IsOk := Is_Char (C);
      end if;

      return NIF_IsOk;
   end Is_NIF;

   function Get_Float (Str : Unbounded_String; F : out Float) return Boolean is
   begin
      F := Float'Value (To_String (Str));
      Put_Line (Float'Image (F));
      return True;
      exception
         when Constraint_Error =>
            return False;
   end Get_Float;

end Utils;