with STM32.Board;  -- HAL for board-specific features (like LEDs)
with STM32.GPIO;   -- HAL for General-Purpose Input/Output pins

procedure Hello_World is
begin
   --  Initialize the board's hardware, including the pins connected to LEDs

   STM32.Board.Initialize_LEDs;

   loop
      --  Toggle the state of all configured LEDs (On -> Off, Off -> On)

      STM32.GPIO.Toggle (STM32.Board.All_LEDs)

      --  The "delay" statement is an Ada language feature supported by our
      --  light-tasking runtime. It provides a precise, non-busy wait.

      delay 0.2; -- Wait for 500 milliseconds
   end loop;
end Hello_World;
