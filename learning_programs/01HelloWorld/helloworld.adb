with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;

procedure HelloWorld is

   function Is_Positive(I : Integer) return Boolean is
   begin
      return (I > 0);
   end Is_Positive;

   N : Integer;
begin
   Put("Introduce an integer number: ");

   Ada.Integer_Text_IO.Get(N);

   if Is_Positive(N) then
      Put_Line("Positive");
   else
      Put_Line("Negative");
   end if;

   for I in 1 .. 5 loop
      Ada.Text_IO.Put_Line("I'm the loop number [" & Integer'Image(I) & " ]");
   end loop;
end HelloWorld;