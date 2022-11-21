package body MyBrain is

     
    protected body Brain is
      --  procedures can modify the data
      procedure SetMeasurementSensor1 (V : Distance_cm) is
      begin
         MeasurementSensor1 := V;
      end SetMeasurementSensor1;

      --  functions cannot modify the data
      function GetMeasurementSensor1 return Distance_cm is
      begin
         return MeasurementSensor1;
      end GetMeasurementSensor1;
      
      --  procedures can modify the data
      procedure SetMeasurementSensor2 (V : Distance_cm) is
      begin
         MeasurementSensor2 := V;
      end SetMeasurementSensor2;

      --  functions cannot modify the data
      function GetMeasurementSensor2 return Distance_cm is
      begin
         return MeasurementSensor2;
      end GetMeasurementSensor2;
      
       --  procedures can modify the data
      procedure SetMeasurementSensor3 (V : Distance_cm) is
      begin
         MeasurementSensor3 := V;
      end SetMeasurementSensor3;

      --  functions cannot modify the data
      function GetMeasurementSensor3 return Distance_cm is
      begin
         return MeasurementSensor3;
      end GetMeasurementSensor3;
      
       --  procedures can modify the data
      procedure SetMeasurementSensor4 (V : Distance_cm) is
      begin
         MeasurementSensor4 := V;
      end SetMeasurementSensor4;

      --  functions cannot modify the data
      function GetMeasurementSensor4 return Distance_cm is
      begin
         return MeasurementSensor4;
      end GetMeasurementSensor4;
   end Brain;

end MyBrain;
