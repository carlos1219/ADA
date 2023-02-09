package body Compuerta_p is
   protected body Compuerta is
      --comprobar si la compuerta esta abierta
      procedure comprobar_puerta (dato:out boolean) is
      begin
         dato:=PuertaAbierta;
      end comprobar_puerta;

      --empezar a refrigerar
      procedure abrir is
      begin
         puertaAbierta:=True;
         --realizamos de primeras un enfriamiento para que sea instantaneo
         r.enfriamiento_t;
         nextTime:=Clock+entradaPeriodo;
         Ada.Real_Time.Timing_Events.Set_Handler(entradaJitterControl, nextTime, Timer'Access);
      end abrir;

      --parar de refrigerar
      procedure cerrar is
      begin
         puertaAbierta:=False;
         --ponemos el manejador a null para que finalice
         Ada.Real_Time.Timing_Events.Set_Handler(entradaJitterControl, nextTime, null);
      end cerrar;

      --timer
      procedure Timer (event : in out Ada.Real_Time.Timing_Events.Timing_Event)
      is
      begin
         r.enfriamiento_t;
         nextTime:= nextTime + entradaPeriodo;
         Ada.Real_Time.Timing_Events.Set_Handler(entradaJitterControl, nextTime, Timer'Access);
      end Timer;

   end Compuerta;
end Compuerta_p;
