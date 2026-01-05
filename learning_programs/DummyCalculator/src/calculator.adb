package body Calculator is
   function Add(Op1, Op2: in Float) return Float is
   begin
      return Op1 + Op2;
   end Add;

   function Subs(Op1, Op2 : in Float) return Float is
   begin
      return Op1 - Op2;
   end Subs;

   function Prod(Op1, Op2 : in Float) return Float is
   begin
      return Op1 * Op2;
   end Prod;

   function Divide(Op1, Op2 : In Float) return Float is
   begin
      return Op1 / Op2;
   end Divide;
end Calculator;