with Ada.Strings.Unbounded;

package Alumns is
   package ASU renames Ada.Strings.Unbounded;

   type AlumnType is record
      Name     : ASU.Unbounded_String;
      Surname  : ASU.Unbounded_String;
      NIF      : ASU.Unbounded_String;
      Mark     : Float;
   end record;

   procedure Push_Alumn (Al : AlumnType);
   procedure Print_List;
end Alumns;