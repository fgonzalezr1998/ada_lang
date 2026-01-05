with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Fact is
   function Is_Positive(N : in Integer) return Boolean is
   begin
      return (N >= 0);
   end Is_Positive;

   procedure Read_Num(N : out Integer) is
   begin
      Ada.Text_IO.Put("Introduzca un Numero Positivo: ");
      Ada.Integer_Text_IO.Get(N);
   end Read_Num;

   procedure Impr_Fact(N : in Integer) is
      Fact : Integer := N;
   begin
      if (Fact > 1) then
         for I in reverse 1 .. (N - 1) loop
            Fact := (Fact * I);
         end loop;
      else
         Fact := 1;
      end if;

      Ada.Text_IO.Put_Line(Integer'Image(N) & "! =" & Integer'Image(Fact));
   end Impr_Fact;

   N : Integer;
   Num_Correcto : Boolean := False;
begin
   loop
      Read_Num(N);
      if (Is_Positive(N)) then
         Num_Correcto := True;
         Impr_Fact(N);
      else
         Ada.Text_IO.Put_Line("Numero Incorrecto");
      end if;

      exit when Num_Correcto;
   end loop;
end Fact;