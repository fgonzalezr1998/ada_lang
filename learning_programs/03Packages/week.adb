package body Week is

   function Day_2_Index(Day : in String) return Integer is
      Ind : Integer;
   begin
      if Day = Sun then
         Ind := 0;
      elsif Day = Mon then
         Ind := 1;
      elsif Day = Tue then
         Ind := 2;
      elsif Day = Wed then
         Ind := 3;
      elsif Day = Thu then
         Ind := 4;
      elsif Day = Fri then
         Ind := 5;
      elsif Day = Sat then
         Ind := 6;
      else
         Ind := -1;
      end if;

      return Ind;
   end;

end Week;