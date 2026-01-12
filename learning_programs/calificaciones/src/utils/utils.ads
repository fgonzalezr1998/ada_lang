with Ada.Strings.Unbounded;
package Utils is
   package ASU renames Ada.Strings.Unbounded;   use ASU;

   function Is_Str (Str : Unbounded_String) return Boolean;
   function Is_NIF (Str : Unbounded_String) return Boolean;
   function Get_Float (Str : Unbounded_String; F : out Float) return Boolean;
end Utils;