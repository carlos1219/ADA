package body reactor_p is
   protected body reactor is
      function muestreo return Integer is
      begin
         return temperatura;
      end muestreo;

      procedure incremento_t is
      begin
         temperatura:= temperatura + 150;
      end incremento_t;

      procedure enfriamiento_t is
      begin
         temperatura:=temperatura - 50;
      end enfriamiento_t;

   end reactor;
end reactor_p;
