package reactor_p is
   protected type reactor is
      function muestreo return Integer;
      procedure incremento_t;
      procedure enfriamiento_t;
   private
      temperatura:Integer:=1450;
   end reactor;
end reactor_p;
