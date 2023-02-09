with System;
with Ada.Real_Time;
use Ada.Real_Time;
with Ada.Real_Time.Timing_Events;
use Ada.Real_Time;
with Text_IO;
with reactor_p;
use reactor_p;
package muestreo_p is
   protected type muestreo (r: access reactor) is
      pragma Interrupt_Priority (System.Interrupt_Priority'Last);
      procedure iniciar;
      entry leer(dato : out Integer);
      procedure Timer(event : in out Ada.Real_Time.Timing_Events.Timing_Event);
   private
      datoDisponible:boolean:=false;
      dato:Integer;
      entradaPeriodo:Ada.Real_Time.Time_Span:=Ada.Real_Time.Milliseconds(2000);
      entradaJitterControl:Ada.Real_Time.Timing_Events.Timing_Event;
      nextTime:Ada.Real_Time.Time;
   end muestreo;
end muestreo_p;
