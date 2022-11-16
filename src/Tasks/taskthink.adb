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
         if Brain.GetMeasurementSensor1 > Distance_cm(15) then            
            MotorDriver.SetDirection (Forward); --our decision what to do based on the sensor values        
         else
            MotorDriver.SetDirection (Stop); 
         end if;
         
         computation_time := Clock - myClock;
         Put_Line(To_Duration (computation_time)'Image);
         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;


end TaskThink;
