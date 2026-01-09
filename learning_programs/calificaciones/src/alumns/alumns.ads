with Ada.Strings.Unbounded;

package Alumns is
   package ASU renames Ada.Strings.Unbounded;
   type NIFType is record
      Num   : Natural;
      Char  : Character;
   end record;

   type AlumnType is record
      Name     : ASU.Unbounded_String;
      Surname  : ASU.Unbounded_String;
      NIF      : NIFType;
   end record;
   procedure Dummy;
end Alumns;