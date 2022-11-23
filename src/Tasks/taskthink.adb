With Ada.Real_Time; use Ada.Real_Time;
with Ultrasonic; use Ultrasonic;
With Ada.Text_IO; use Ada.Text_IO;

package body TaskThink is

  task body think is
      myClock : Time;
      computation_time : Time_Span;
      emergencyStop : Integer := 0;
   begin
      loop
         myClock := Clock;
        
         --make a decision (could be wrapped nicely in a procedure)
         if Brain.GetMeasurementSensor1 > Distance_cm(15) then
            emergencyStop := 0; -- Hack to reset stop counter
            
            MotorDriver.SetDirection (Forward); --our decision what to do based on the sensor values

         elsif Brain.GetMeasurementSensor2 > Distance_cm(15)  then 
            emergencyStop := 0; -- Hack to reset stop counter
            MotorDriver.SetDirection (Left);            
         
         elsif Brain.GetMeasurementSensor3 > Distance_cm(15)  then
            emergencyStop := 0; -- Hack to reset stop counter
            MotorDriver.SetDirection (Right);
            -- This is for checking if there are obstacles on each side it will rotate until it finds an opening
            -- If no opening is found it will stop
            -- And if a new way to drive is found, the stop counter is returned to 0
            else
            emergencyStop := emergencyStop + 1;  -- Every time it starts the rotation cycle it increments this counter
            if emergencyStop >= 150 then
               MotorDriver.SetDirection(Stop);
            else
               MotorDriver.SetDirection (rotRight); 
             end if;
         end if;
         
         computation_time := Clock - myClock;
         Put_Line(To_Duration (computation_time)'Image);
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
