with Ada.Strings.Unbounded;
package Utils is
   package ASU renames Ada.Strings.Unbounded;   use ASU;

   function Is_Str (Str: Unbounded_String) return Boolean;

end Utils;