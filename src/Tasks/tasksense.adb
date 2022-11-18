With Ada.Real_Time; use Ada.Real_Time;
With Ultrasonic; use Ultrasonic;
With Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body TaskSense is

    task body sense is
      myClock : Time;
      DistanceFront: Distance_cm := 0;
      DistanceRight: Distance_cm := 0;
      DistanceLeft: Distance_cm := 0;
      DistanceBack: Distance_cm := 0;
      computation_time : Time_Span; 
      
   begin
      --Ultrasonic.Setup(0,3); 
      loop
         
          --important to get current time such that the period is exactly 200ms.
          --you need to make sure that the instruction NEVER takes more than this period. 
          --make sure to measure how long the task needs, see Tasking_Calculate_Execution_Time example in the repository.
          --What if for some known or unknown reason the execution time becomes larger?
          --When Worst Case Execution Time (WCET) is overrun so higher than your set period, see : https://www.sigada.org/ada_letters/dec2003/07_Puente_final.pdf
          --In this template we put the responsiblity on the designer/developer.
          
         
            myClock := Clock; 
                           
            Ultrasonic.Setup(0,3); -- This is moved in the main loop to easier facilitate additional sensor readouts and the 0,3 values are our front sensor
             --delay(0.1);
            DistanceFront := Read;
            Put_Line ("Read" & DistanceFront'Image);
         
            Brain.SetMeasurementSensor1 (DistanceFront); -- value from front sensor sent into the measurement function
         
            --1,4 is left ultrasonic sensor
            Ultrasonic.Setup(1,4);
            DistanceLeft := Read;
            Put_Line("Read" & DistanceLeft'Image);
            Brain.SetMeasurementSensor2 (DistanceLeft);
         
            --1,5 is right ultrasonic sensor
           Ultrasonic.Setup(1,5);
            DistanceRight := Read;
            Put_Line("Read" & DistanceRight'Image);
            Brain.SetMeasurementSensor3(DistanceRight);
         
            -- 0,2 is our back sensor
            Ultrasonic.Setup(0,2);
            DistanceBack := Read;
            Put_Line("Read" & DistanceBack'Image);
            Brain.SetMeasurementSensor4(DistanceBack);
         
         
            computation_time := Clock - myClock; -- Calculating computation time
            Put_Line(To_Duration (computation_time)'Image); 
            
         delay until myClock + Milliseconds(100); --random period <- We tried changing this, but this only resulted in random lockups in the code
            end loop;
   end sense;

end TaskSense;
