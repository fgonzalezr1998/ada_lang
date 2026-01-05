with Ada.Text_IO;                use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.IO_Exceptions;

with Calculator;

procedure Dummy_Calculator is
   -- BEGIN Package Renaming
   package Int_IO renames Ada.Integer_Text_IO;
   package Float_IO renames Ada.Float_Text_IO;
   -- END Package Renaming

   -- BEGIN Constants
   MIN_OPT : constant Integer := 1;
   MAX_OPT : constant Integer := 5;
   -- END constants

   -- BEGIN Type Definitions
   type OperationType is new Integer range MIN_OPT .. MAX_OPT;
   type OperandsType is array(0..1) of Float;
   -- END Type Definitions

   -- BEGIN Exceptions
   Invalid_Operand : exception;
   -- END Exceptions

   procedure Print_Menu is
   begin
      Put_Line ("===== Menu =====");
      Put_Line ("Choose an option:");
      Put_Line ("1. Sumar");
      Put_Line ("2. Restar");
      Put_Line ("3. Multiplicar");
      Put_Line ("4. Dividir");
      Put_Line ("5. Salir");
   end Print_Menu;

   procedure Read_Operation(Operation : out OperationType) is
      Input : Integer := 0;
   begin
      loop
         Put ("Introduzca Opcion: ");
         begin
            Int_IO.Get(Input);

            exception
               when E : Ada.IO_Exceptions.Data_Error =>
                  Skip_Line;
                  Put_Line ("Por favor, introduzca un numero");
         end;
         if ((Input < MIN_OPT) or (Input > MAX_OPT)) then
            Put_Line ("Por favor, introduzca una opcion valida");
            Input := 0;
         end if;

         exit when Input /= 0;
      end loop;
      Operation := OperationType(Input);
   end Read_Operation;

   procedure Read_Operands(Operands : out OperandsType) is
      function Operand return Float is
         Op : Float;
         Op_Ok : Boolean := False;
      begin
         while (not Op_Ok) loop
            Op_Ok := True;
            begin
               Float_IO.Get(Op);
               exception
                  when E : Ada.IO_Exceptions.Data_Error =>
                     Skip_Line;
                     Put_Line ("Por favor, introduzca un numero");
                     Op_Ok := False;
            end;
         end loop;

         return Op;
      end Operand;
      Operand1, Operand2 : Float;
   begin
      Put("Operando 1: ");
      Operand1 := Operand;
      Put("Operando 2: ");
      Operand2 := Operand;

      Operands(0) := Operand1;
      Operands(1) := Operand2;

   end Read_Operands;

   procedure Apply_Operation(Operation : in OperationType; Operands : OperandsType) is
      Result : Float;
   begin
      case Operation is
         when OperationType(MIN_OPT) =>
            Result := Calculator.Add(Operands(0), Operands(1));
         when OperationType(2) =>
            Result := Calculator.Subs(Operands(0), Operands(1));
         when OperationType(3) =>
            Result := Calculator.Prod(Operands(0), Operands(1));
         when OperationType(MAX_OPT - 1) =>
            Result := Calculator.Divide(Operands(0), Operands(1));
         when others =>
            raise Invalid_Operand;
      end case;

      Put("Resultado:");
      Float_IO.Put(Result, Fore => 5, Aft => 3, Exp => 0);
   end Apply_Operation;

   Operation : OperationType;
   Operands : OperandsType;
begin

   loop
      Print_Menu;
      Read_Operation(Operation);
      if (Operation /= OperationType(MAX_OPT)) then
         Read_Operands(Operands);
         Apply_Operation(Operation, Operands);
      end if;

      exit when Operation = OperationType(MAX_OPT);
   end loop;

   exception
      when E : Invalid_Operand =>
      Put_Line ("Critical Error --> Invalid Operand");

end Dummy_Calculator;