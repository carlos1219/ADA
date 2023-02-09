pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E069 : Short_Integer; pragma Import (Ada, E069, "system__os_lib_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__exceptions_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "ada__containers_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "ada__io_exceptions_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__strings_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings__maps_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings__maps__constants_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "interfaces__c_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exceptions_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__object_reader_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__dwarf_lines_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E037 : Short_Integer; pragma Import (Ada, E037, "system__traceback__symbolic_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "ada__numerics_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "ada__strings__utf_encoding_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__tags_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "ada__strings__text_buffers_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "interfaces__c__strings_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "ada__streams_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "system__file_control_block_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__finalization_root_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ada__finalization_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "system__file_io_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "system__storage_pools_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "system__finalization_masters_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "system__storage_pools__subpools_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__task_info_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "ada__calendar__delays_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "ada__calendar__time_zones_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "ada__real_time_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "ada__text_io_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "system__random_seed_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "system__tasking__initialization_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "system__tasking__protected_objects_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "system__tasking__protected_objects__entries_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "system__tasking__queuing_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "system__tasking__stages_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "ada__real_time__timing_events_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "system__tasking__async_delays_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "reactor_p_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "compuerta_p_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "muestreo_p_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__real_time__timing_events__finalize_body");
      begin
         E139 := E139 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__real_time__timing_events__finalize_spec");
      begin
         F2;
      end;
      E201 := E201 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F3;
      end;
      E211 := E211 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__text_io__finalize_spec");
      begin
         F4;
      end;
      E174 := E174 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__storage_pools__subpools__finalize_spec");
      begin
         F5;
      end;
      E168 := E168 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__finalization_masters__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__file_io__finalize_body");
      begin
         E215 := E215 - 1;
         F7;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           True, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           True, False, False, True, True, True, True, False, 
           False, False, False, True, False, False, True, True, 
           False, True, True, False, True, True, True, True, 
           False, False, False, False, False, True, True, True, 
           True, False, True, False, True, True, False, True, 
           False, True, True, False, False, True, False, True, 
           False, False, True, True, False, False, True, False, 
           True, True, True, False, False, True, False, True, 
           True, True, False, True, True, False, True, True, 
           True, True, False, False, False, False, False, False, 
           False, False, True, True, True, True, True, True, 
           False),
         Count => (0, 0, 0, 1, 2, 1, 3, 1, 3, 0),
         Unknown => (False, False, False, False, False, False, True, True, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Containers'Elab_Spec;
      E038 := E038 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E065 := E065 + 1;
      Ada.Strings'Elab_Spec;
      E050 := E050 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E052 := E052 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E056 := E056 + 1;
      Interfaces.C'Elab_Spec;
      E075 := E075 + 1;
      System.Exceptions'Elab_Spec;
      E026 := E026 + 1;
      System.Object_Reader'Elab_Spec;
      E077 := E077 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E045 := E045 + 1;
      System.Os_Lib'Elab_Body;
      E069 := E069 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E037 := E037 + 1;
      E008 := E008 + 1;
      Ada.Numerics'Elab_Spec;
      E109 := E109 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E148 := E148 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E154 := E154 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      Ada.Strings.Text_Buffers'Elab_Body;
      E146 := E146 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E117 := E117 + 1;
      Ada.Streams'Elab_Spec;
      E144 := E144 + 1;
      System.File_Control_Block'Elab_Spec;
      E216 := E216 + 1;
      System.Finalization_Root'Elab_Spec;
      System.Finalization_Root'Elab_Body;
      E164 := E164 + 1;
      Ada.Finalization'Elab_Spec;
      E142 := E142 + 1;
      System.File_Io'Elab_Body;
      E215 := E215 + 1;
      System.Storage_Pools'Elab_Spec;
      E170 := E170 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E168 := E168 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Body;
      E174 := E174 + 1;
      System.Task_Info'Elab_Spec;
      E127 := E127 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E006 := E006 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E101 := E101 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E105 := E105 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E111 := E111 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E211 := E211 + 1;
      System.Random_Seed'Elab_Body;
      E229 := E229 + 1;
      System.Tasking.Initialization'Elab_Body;
      E189 := E189 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E199 := E199 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E201 := E201 + 1;
      System.Tasking.Queuing'Elab_Body;
      E197 := E197 + 1;
      System.Tasking.Stages'Elab_Body;
      E185 := E185 + 1;
      Ada.Real_Time.Timing_Events'Elab_Spec;
      Ada.Real_Time.Timing_Events'Elab_Body;
      E139 := E139 + 1;
      System.Tasking.Async_Delays'Elab_Body;
      E231 := E231 + 1;
      E220 := E220 + 1;
      E218 := E218 + 1;
      E223 := E223 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\34654\Desktop\MIGUEL 2022\Universidad\3er curso\Programacion avanzada\ada\practicafinalada\obj\reactor_p.o
   --   C:\Users\34654\Desktop\MIGUEL 2022\Universidad\3er curso\Programacion avanzada\ada\practicafinalada\obj\compuerta_p.o
   --   C:\Users\34654\Desktop\MIGUEL 2022\Universidad\3er curso\Programacion avanzada\ada\practicafinalada\obj\muestreo_p.o
   --   C:\Users\34654\Desktop\MIGUEL 2022\Universidad\3er curso\Programacion avanzada\ada\practicafinalada\obj\main.o
   --   -LC:\Users\34654\Desktop\MIGUEL 2022\Universidad\3er curso\Programacion avanzada\ada\practicafinalada\obj\
   --   -LC:\Users\34654\Desktop\MIGUEL 2022\Universidad\3er curso\Programacion avanzada\ada\practicafinalada\obj\
   --   -LC:/gnat/2021/lib/gcc/x86_64-w64-mingw32/10.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
