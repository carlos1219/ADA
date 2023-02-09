package body muestreo_p is
   protected body muestreo is
      --procedimiento para iniciar el muestreo del reactor
      procedure iniciar is
      begin
         datoDisponible:=False;
         --debe de tardar 2 segundos en realizar la primera lectura para que de tiempo al incremento
         nextTime:=Clock + entradaPeriodo;
         --cuando se completan los 2 segundos, vamos a la manejadora
         Ada.Real_Time.Timing_Events.Set_Handler(entradaJitterControl, nextTime, Timer'Access);
      end iniciar;

      --procedimiento para leer el dato
      entry leer(dato:out Integer)
        when datoDisponible is
      begin
         --obtiene la temperatura y pone a falso la condicion de entrada
         dato:=r.muestreo;
         datoDisponible:=False;
      end leer;

      --NOTA: Se podría hacer sin el timer haciendo un delay until en main
      --manejadora del tiempo
      procedure Timer (event : in out Ada.Real_Time.Timing_Events.Timing_Event)
      is
      begin
         --activa la condicion de entrada a leer
         datoDisponible:=True;
         --cada 2 segundos, activará dicha condicion para que el muestreo tenga dicho periodo
         nextTime:= nextTime + entradaPeriodo;
         Ada.Real_Time.Timing_Events.Set_Handler(entradaJitterControl, nextTime, Timer'Access);
      end Timer;

   end muestreo;
end muestreo_p;
