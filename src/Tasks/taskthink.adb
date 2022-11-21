With Ada.Real_Time; use Ada.Real_Time;
with Ultrasonic; use Ultrasonic;
With Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body TaskThink is

  task body think is
      myClock : Time;
      computation_time : Time_Span;
   begin
      loop
         myClock := Clock;
        
         --make a decision (could be wrapped nicely in a procedure)
         -- GetMeasurementSensor2 is left sensor
         -- GetMeasurementSensor3 is RIght Sensor
         -- GetMeasurementSensor4 is supposed to be rear sensor but it is not wired 
         
         if Brain.GetMeasurementSensor1 > Distance_cm(15) then            
            MotorDriver.SetDirection (Forward); --our decision what to do based on the sensor values 
         elsif Brain.GetMeasurementSensor1 < Distance_cm(15) and Brain.GetMeasurementSensor3 > Distance_cm(15) then -- When distance on front is less than 15cm AND right is over 15cm
            MotorDriver.SetDirection (Left);
         elsif Brain.GetMeasurementSensor3 > Distance_cm(15) and Brain.GetMeasurementSensor1 < Distance_cm(15) then -- When distance front is less than 15cm AND left is over 15cm
            MotorDriver.SetDirection (Right);
         else
            MotorDriver.SetDirection (Stop);  -- If all else fails, stop car
         end if;
         
         computation_time := Clock - myClock;
         Put_Line(To_Duration (computation_time)'Image);
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
