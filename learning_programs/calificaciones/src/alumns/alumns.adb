with Ada.Text_IO;       use Ada.Text_IO;

package body Alumns is
   type AlumnNodeT;
   type AlumnNodePtr is access AlumnNodeT;
   type AlumnNodeT is record
      Alumn    : AlumnType;
      Next     : AlumnNodePtr;
   end record;

   type AlumsListT is record
      First    : AlumnNodePtr := null;
      N_Alumns : Natural := 0;
   end record;

   Alumns_L : AlumsListT;

   procedure Create_Node (Al : AlumnType; Node : out AlumnNodePtr) is
   begin
      Node := new AlumnNodeT;

      Node.Alumn := Al;
      Node.Next := null;
   end Create_Node;

   function Last_NodePtr return AlumnNodePtr is
      Node_Ptr : AlumnNodePtr;
   begin
      Node_Ptr := Alumns_L.First;
      while Node_Ptr.Next /= null loop
         Node_Ptr := Node_Ptr.Next;
      end loop;

      return Node_Ptr;
   end Last_NodePtr;

   procedure Push_Alumn (Al : AlumnType) is
      Node_Ptr : AlumnNodePtr;
      Last_Node_Ptr : AlumnNodePtr;
   begin
      Create_Node (Al, Node_Ptr);

      if Alumns_L.First = null then
         Alumns_L.First := Node_Ptr;
      else
         Last_Node_Ptr := Last_NodePtr;
         Last_Node_Ptr.Next := Node_Ptr;
      end if;

      Alumns_L.N_Alumns := Alumns_L.N_Alumns + 1;
   end Push_Alumn;

   procedure Print_List is
      Node_Ptr : AlumnNodePtr;
   begin
      Node_Ptr := Alumns_L.First;
      
      while Node_Ptr /= null loop
         Put_Line (ASU.To_String (Node_Ptr.Alumn.Name) & " "
                  & ASU.To_String (Node_Ptr.Alumn.Surname));
         Node_Ptr := Node_Ptr.Next;
      end loop;
   end Print_List;
end Alumns;