package body MyBrain is
      --  procedures can modify the data
      --  functions cannot modify the data
     
    protected body Brain is
      procedure SetMeasurementSensor1 (V : Distance_cm) is
      begin
         MeasurementSensor1 := V;
      end SetMeasurementSensor1;

      function GetMeasurementSensor1 return Distance_cm is
      begin
         return MeasurementSensor1;
      end GetMeasurementSensor1;
      
      
      procedure SetMeasurementSensor2 (V : Distance_cm) is
      begin
         MeasurementSensor2 := V;
      end SetMeasurementSensor2;

      function GetMeasurementSensor2 return Distance_cm is
      begin
         return MeasurementSensor2;
      end GetMeasurementSensor2;
      
      procedure SetMeasurementSensor3 (V : Distance_cm) is
      begin
         MeasurementSensor3 := V;
      end SetMeasurementSensor3;

      function GetMeasurementSensor3 return Distance_cm is
      begin
         return MeasurementSensor3;
      end GetMeasurementSensor3;
      
      procedure SetMeasurementSensor4 (V : Distance_cm) is
      begin
         MeasurementSensor4 := V;
      end SetMeasurementSensor4;

      function GetMeasurementSensor4 return Distance_cm is
      begin
         return MeasurementSensor4;
      end GetMeasurementSensor4;
   end Brain;

end MyBrain;
