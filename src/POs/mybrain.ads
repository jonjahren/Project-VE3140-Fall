with Ultrasonic; use Ultrasonic;
package MyBrain is

   protected Brain is
      function GetMeasurementSensor1 return Distance_cm; -- concurrent read operations are now possible
      function GetMeasurementSensor2 return Distance_cm; -- concurrent read operations are now possible
      function GetMeasurementSensor3 return Distance_cm; -- concurrent read operations are now possible 
      function GetMeasurementSensor4 return Distance_cm; -- concurrent read operations are now possible
      
      procedure SetMeasurementSensor1 (V : Distance_cm); -- but concurrent read/write are not!
      procedure SetMeasurementSensor 2(V : Distance_cm); -- but concurrent read/write are not!
      procedure SetMeasurementSensor3(V : Distance_cm); -- but concurrent read/write are not!
      procedure SetMeasurementSensor4 (V : Distance_cm); -- but concurrent read/write are not!

   private
         MeasurementSensor1 : Distance_cm := 0;
         MeasurementSensor2 : Distance_cm := 0;
         MeasurementSensor3 : Distance_cm :=0;
         MeasurementSensor4: Distance_cm := 0;
   end Brain;

end MyBrain;
