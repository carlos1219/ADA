--Práctica obligatoria ADA
--Miguel Gonzalez Herranz
--Carlos Leon Arjona
with Ada.Numerics;
with Text_IO;
with Ada.Text_IO;
with Ada.Real_Time;
with Ada.Real_Time.Timing_Events;
with System;
with reactor_p;
use reactor_p;
with muestreo_p;
use muestreo_p;
with compuerta_p;
use compuerta_p;
with Ada.Calendar;
use Ada.Calendar;
with Ada.Calendar.Formatting;
with Ada.Real_Time;
use Ada.Real_Time;
with Ada.Numerics.Discrete_Random;
procedure Main is
   --creamos un array de reactores
   type reactores is array(1..3) of aliased reactor;
   type temperaturas is array(1..3) of aliased Integer;

   task type aumentar_temp(listaR: access reactores);
   task body aumentar_temp is
      subtype aleatorioReactor is Integer range 1..3;
      package Aleatorio is new Ada.Numerics.Discrete_Random(aleatorioReactor);
      seed : Aleatorio.Generator;
      numero_reactor: Integer;
      --Variables para el intervalo entre incrementos
      intervalo:Ada.Real_Time.Time_Span:=Ada.Real_Time.Milliseconds(2000);
      --Acumulador de tiempo real
      sig: Ada.Real_Time.Time;
   begin
      --ajustamos la variable de delay until
      sig:= Ada.Real_Time.Clock + intervalo;
      loop
         Aleatorio.reset(seed);
         numero_reactor:=Aleatorio.Random(seed);
         Text_IO.Put_Line("ATENCIÓN!! Incremento de tª en el reactor nº" &numero_reactor'Img);
         listaR(numero_reactor)'access.incremento_t;
         delay until sig;
         --volvemos a ajustar el delay until
         sig:= sig + intervalo;
      end loop;
   end aumentar_temp;


   task type control_muestreo(numero: Integer) is
      entry aviso_muestreo;
   end control_muestreo;
   task body control_muestreo is
   begin
      loop
         select
            accept aviso_muestreo do
               null;
            end aviso_muestreo;
         or delay 3.0;
            Text_IO.Put_Line("ALERTA REACTOR Nº" & numero'Img&" :Error de muestreo");
         end select;
      end loop;
   end control_muestreo;



   task type CoordinadoraReactor (r: access reactor; numero: Integer);
   task body  CoordinadoraReactor is
      muestreo: muestreo_p.muestreo(r);
      controlCompuerta: compuerta_p.compuerta(r);
      control: control_muestreo(numero);
      puertaAbierta: boolean;
      temperatura:Integer;
   begin
      muestreo.iniciar;
      loop
         controlCompuerta.comprobar_puerta(puertaAbierta);
         muestreo.leer(temperatura);
         Text_IO.Put_Line("REACTOR Nº" &numero'Img& ": Tª=" &temperatura'Img);
         if puertaAbierta then
            if temperatura >=1500 then
               if temperatura >=1750 then
                  --La mantenemos abierta y decimos que la temperatura es extrema
                  Text_IO.Put_Line("REACTOR Nº" &numero'Img & " [MANTENER COMPUERTA ABIERTA]: La temperatura sigue siendo extremadamente alta");
               else
                  --no hacemos nada
                  Text_IO.Put_Line("REACTOR Nº" &numero'Img & " [MANTENER COMPUERTA ABIERTA]: La temperatura sigue siendo alta");
               end if;
            else
               --cerramos la compuerta y controlamos que no tarde más de 1 decima de segundo
               select
                  delay 0.1;
               then abort
                  controlCompuerta.cerrar;
               end select;
               Text_IO.Put_Line("REACTOR Nº" &numero'Img & " [CERRAR COMPUERTA]: La temperatura ahora es segura");
            end if;
         else
            if temperatura >= 1500 then
               --controla que la compuerta tarda como maximo una decima de segundo en abrirse
               select
                  delay 0.1;
               then abort
                  controlCompuerta.abrir;
               end select;

               if temperatura >= 1750 then
                  --Abrimos la compuerta y decimos que la temperatura es extrema
                  Text_IO.Put_Line("REACTOR Nº" &numero'Img & " [ABRIR COMPUERTA]: La temperatura es extremadamente alta");
               else
                  --Abrimos la compuerta
                  Text_IO.Put_Line("REACTOR Nº"  &numero'Img & " [ABRIR COMPUERTA]: La temperatura es superior a 1500º");
               end if;
            else
               Text_IO.Put_Line("REACTOR Nº" &numero'Img & " [MANTENER COMPUERTA CERRADA]: La temperatura es segura");
            end if;
         end if;
         control.aviso_muestreo;
      end loop;
   end CoordinadoraReactor;


   procedure inicio is
      arrayReactores: aliased reactores;
      aumento: aumentar_temp(arrayReactores'access);
      t1: CoordinadoraReactor(arrayReactores(1)'access,1);
      t2: CoordinadoraReactor(arrayReactores(2)'access,2);
      t3: CoordinadoraReactor(arrayReactores(3)'access,3);
   begin
      null;
   end inicio;


begin
   inicio;
   null;
end Main;
