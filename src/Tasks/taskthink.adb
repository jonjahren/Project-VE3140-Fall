With Ada.Real_Time; use Ada.Real_Time;
with Ultrasonic; use Ultrasonic;
With Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body TaskThink is

  task body think is
      myClock : Time;
      computation_time : Time_Span;
      giveUp : Integer := 0;
   begin
      loop
         myClock := Clock;
        
         --make a decision (could be wrapped nicely in a procedure)
          if Brain.GetMeasurementSensor1 > Distance_cm(15) then            
            MotorDriver.SetDirection (Forward); --our decision what to do based on the sensor values 
            --Put_Line("Forward value" & Brain.GetMeasurementSensor1'Image);
            --Put_Line("Right  value" & Brain.GetMeasurementSensor3'Image);
            --Put_Line("Left value" & Brain.GetMeasurementSensor2'Image);

         elsif Brain.GetMeasurementSensor2 > Distance_cm(15) and giveUp < 10 then -- When distance on front is less than 15cm AND right is over 15cm
            --Put_Line("Forward value" & Brain.GetMeasurementSensor1'Image);
            --Put_Line("Right  value" & Brain.GetMeasurementSensor3'Image);
             --Put_Line("Left value" & Brain.GetMeasurementSensor2'Image); 
             delay(0.1);
            MotorDriver.SetDirection (Left);
            --giveUp ::= giveUp + 1;
            
         elsif Brain.GetMeasurementSensor3> Distance_cm(15) and giveUp < 10  then -- When distance front is less than 15cm AND left is over 15cm
            --Put_Line("Forward value" & Brain.GetMeasurementSensor1'Image);
            --Put_Line("Right  value" & Brain.GetMeasurementSensor3'Image);
            --Put_Line("Left value" & Brain.GetMeasurementSensor2'Image);            
           delay(0.1);
            MotorDriver.SetDirection (Right);
            --giveUp ::= giveUp + 1;
            
         else
            MotorDriver.SetDirection (Stop);  -- If all else fails, stop car
         end if;
         
         computation_time := Clock - myClock;
         Put_Line(To_Duration (computation_time)'Image);
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
