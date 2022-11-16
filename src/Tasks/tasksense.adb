With Ada.Real_Time; use Ada.Real_Time;
With Ultrasonic; use Ultrasonic;
With Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body TaskSense is

    task body sense is
      myClock : Time;
      Distance : Distance_cm := 0;
      --computation_time : Time_Span;
      
   begin
      Ultrasonic.Setup(0,3);
      loop
         myClock := Clock; --important to get current time such that the period is exactly 200ms.
                           --you need to make sure that the instruction NEVER takes more than this period. 
                           --make sure to measure how long the task needs, see Tasking_Calculate_Execution_Time example in the repository.
                           --What if for some known or unknown reason the execution time becomes larger?
                           --When Worst Case Execution Time (WCET) is overrun so higher than your set period, see : https://www.sigada.org/ada_letters/dec2003/07_Puente_final.pdf
                           --In this template we put the responsiblity on the designer/developer.
         --delay (0.024); --simulate a sensor eg the ultrasonic sensors needs at least 24ms for 400cm range.
         Distance := Read;
         Put_Line ("Read" & Distance'Image);
         
         Brain.SetMeasurementSensor1 (Distance); -- random value, hook up a sensor here!
         Brain.SetMeasurementSensor2 (1);
         
         --computation_time := Clock - myClock;
         --Put_Line(To_Duration (computation_time)'Image); 
            
         delay until myClock + Milliseconds(100); --random period
      end loop;
   end sense;

end TaskSense;
