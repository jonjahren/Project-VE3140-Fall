package body MyMotorDriver is
   --  functions cannot modify the data
   --  procedures can modify the data


   protected body MotorDriver is
      procedure SetDirection (V : Directions) is
      begin
         DriveDirection := V;
      end SetDirection;

      function GetDirection return Directions is
      begin
         return DriveDirection;
      end GetDirection;

      procedure SetMotorPins (V : MotorControllerPins) is
      begin
         Pins := V;
      end SetMotorPins;

      function GetMotorPins return MotorControllerPins is
      begin
         return Pins;
      end GetMotorPins;
      
   end MotorDriver;

end MyMotorDriver;
