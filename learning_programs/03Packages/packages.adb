with Ada.Text_IO;       use Ada.Text_IO;
with Week;

procedure Packages is
begin
   Put_Line(Week.Sun & " is the day number" & Integer'Image(Week.Day_2_Index(Week.Sun)));
end Packages;