with System;
with Ada.Real_Time;
use Ada.Real_Time;
with Ada.Real_Time.Timing_Events;
use Ada.Real_Time;
with Text_IO;
with reactor_p;
use reactor_p;
package Compuerta_p is
   protected type Compuerta (r: access reactor) is
      pragma Interrupt_Priority (System.Interrupt_Priority'Last);
      procedure comprobar_puerta (dato: out boolean);
      procedure abrir;
      procedure cerrar;
      procedure Timer(event : in out Ada.Real_Time.Timing_Events.Timing_Event);
   private
      entradaPeriodo:Ada.Real_Time.Time_Span:=Ada.Real_Time.Milliseconds(1000);
      entradaJitterControl:Ada.Real_Time.Timing_Events.Timing_Event;
      nextTime:Ada.Real_Time.Time;
      puertaAbierta:boolean:=False;
   end Compuerta;
end Compuerta_p;
