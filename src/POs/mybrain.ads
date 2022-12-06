with Ultrasonic; use Ultrasonic;
package MyBrain is
   
   -- Protected objects are used to avoid deadlocks in the code
   
   protected Brain is
      
      -- concurrent read operations are now possible
      function GetMeasurementSensor1 return Distance_cm; 
      function GetMeasurementSensor2 return Distance_cm;
      function GetMeasurementSensor3 return Distance_cm; 
      function GetMeasurementSensor4 return Distance_cm;
      
      -- Concurrent write not currently possible
      
      procedure SetMeasurementSensor1 (V : Distance_cm);
      procedure SetMeasurementSensor2 (V : Distance_cm);
      procedure SetMeasurementSensor3 (V : Distance_cm);
      procedure SetMeasurementSensor4 (V : Distance_cm);

   private
         MeasurementSensor1 : Distance_cm := 0;
         MeasurementSensor2 : Distance_cm := 0;
         MeasurementSensor3 : Distance_cm :=0;
         MeasurementSensor4: Distance_cm := 0;
   end Brain;

end MyBrain;
