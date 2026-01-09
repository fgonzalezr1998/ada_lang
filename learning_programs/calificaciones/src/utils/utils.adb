package body Utils is
   A_MAYUS_ASCII_POS : constant Character := 'A';
   Z_MAYUS_ASCII_POS : constant Character := 'Z';
   A_LOWER_ASCII_POS : constant Character := 'a';
   Z_LOWER_ASCII_POS : constant Character := 'z';

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

   function Is_Str (Str : Unbounded_String) return Boolean is
      Char_IsOk : Boolean := True;
      C : Character;
      I : Natural := 1;
   begin
      loop
         C := Element (Str, I);
         if not Is_Upper_Char (C)
            and not Is_Lower_Char (C)
         then
            Char_IsOk := False;
         end if;

         exit when not Char_IsOk
               or I = Length (Str);
         I := I + 1;
      end loop;

      return Char_IsOk;
   end Is_Str;

end Utils;