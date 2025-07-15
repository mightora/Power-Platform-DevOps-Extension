# Power Automate Flow: CoEBYODL-WhenEnvironmentdataflowrefreshiscomplete

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 00224822FE28
**Source File:** CoEBYODL-WhenEnvironmentdataflowrefreshiscomplete-E7FEBA73-341E-ED11-B83E-00224822FE28.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CoEBYODL-WhenEnvironmentdataflowrefreshiscomplete
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 3
- **Parameters:** 6

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CoEBYODL-WhenEnvironmentdataflowrefreshiscomplete

start
:Trigger: When_a_dataflow_refresh_completes (OpenApiConnection);\n:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate_2 (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate_2 (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
 }
:Environment_dataflow_complete_processing (Scope);
 if (condition) then (yes)
  :Update_if_environment_uses_PCF_from_organization_table (Scope);
   if (condition) then (yes)
    :List_environments (OpenApiConnection);
    :Apply_to_each (Foreach);
     if (condition) then (yes)
      :If_has_CDS (If);
       if (condition) then (yes)
        :update_pcf_state (Scope);
         if (condition) then (yes)
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         endif
         partition "update_pcf_state" {
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         }
        :Mark_PCF_State_Unknown (OpenApiConnection);
        :See_if_access_to_envt (OpenApiConnection);
       endif
       else (no)
        :Mark_PCF_State_Unknown__Unsupported_Envt_Type (OpenApiConnection);
       endif
     endif
     repeat
      :If_has_CDS (If);
       if (condition) then (yes)
        :update_pcf_state (Scope);
         if (condition) then (yes)
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         endif
         partition "update_pcf_state" {
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         }
        :Mark_PCF_State_Unknown (OpenApiConnection);
        :See_if_access_to_envt (OpenApiConnection);
       endif
       else (no)
        :Mark_PCF_State_Unknown__Unsupported_Envt_Type (OpenApiConnection);
       endif
     repeat while (more items)
   endif
   partition "Update_if_environment_uses_PCF_from_organization_table" {
    :List_environments (OpenApiConnection);
    :Apply_to_each (Foreach);
     if (condition) then (yes)
      :If_has_CDS (If);
       if (condition) then (yes)
        :update_pcf_state (Scope);
         if (condition) then (yes)
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         endif
         partition "update_pcf_state" {
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         }
        :Mark_PCF_State_Unknown (OpenApiConnection);
        :See_if_access_to_envt (OpenApiConnection);
       endif
       else (no)
        :Mark_PCF_State_Unknown__Unsupported_Envt_Type (OpenApiConnection);
       endif
     endif
     repeat
      :If_has_CDS (If);
       if (condition) then (yes)
        :update_pcf_state (Scope);
         if (condition) then (yes)
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         endif
         partition "update_pcf_state" {
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         }
        :Mark_PCF_State_Unknown (OpenApiConnection);
        :See_if_access_to_envt (OpenApiConnection);
       endif
       else (no)
        :Mark_PCF_State_Unknown__Unsupported_Envt_Type (OpenApiConnection);
       endif
     repeat while (more items)
   }
  :Refresh_next_dataflows (Scope);
   if (condition) then (yes)
    :Refresh_Power_Automate_dataflow (OpenApiConnection);
    :Refresh_Canvas_Apps_dataflow (OpenApiConnection);
    :Refresh_Model_Apps_dataflow (OpenApiConnection);
   endif
   partition "Refresh_next_dataflows" {
    :Refresh_Power_Automate_dataflow (OpenApiConnection);
    :Refresh_Canvas_Apps_dataflow (OpenApiConnection);
    :Refresh_Model_Apps_dataflow (OpenApiConnection);
   }
  :Catch_failure (Scope);
   partition "Catch_failure" {
   }
 endif
 partition "Environment_dataflow_complete_processing" {
  :Update_if_environment_uses_PCF_from_organization_table (Scope);
   if (condition) then (yes)
    :List_environments (OpenApiConnection);
    :Apply_to_each (Foreach);
     if (condition) then (yes)
      :If_has_CDS (If);
       if (condition) then (yes)
        :update_pcf_state (Scope);
         if (condition) then (yes)
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         endif
         partition "update_pcf_state" {
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         }
        :Mark_PCF_State_Unknown (OpenApiConnection);
        :See_if_access_to_envt (OpenApiConnection);
       endif
       else (no)
        :Mark_PCF_State_Unknown__Unsupported_Envt_Type (OpenApiConnection);
       endif
     endif
     repeat
      :If_has_CDS (If);
       if (condition) then (yes)
        :update_pcf_state (Scope);
         if (condition) then (yes)
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         endif
         partition "update_pcf_state" {
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         }
        :Mark_PCF_State_Unknown (OpenApiConnection);
        :See_if_access_to_envt (OpenApiConnection);
       endif
       else (no)
        :Mark_PCF_State_Unknown__Unsupported_Envt_Type (OpenApiConnection);
       endif
     repeat while (more items)
   endif
   partition "Update_if_environment_uses_PCF_from_organization_table" {
    :List_environments (OpenApiConnection);
    :Apply_to_each (Foreach);
     if (condition) then (yes)
      :If_has_CDS (If);
       if (condition) then (yes)
        :update_pcf_state (Scope);
         if (condition) then (yes)
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         endif
         partition "update_pcf_state" {
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         }
        :Mark_PCF_State_Unknown (OpenApiConnection);
        :See_if_access_to_envt (OpenApiConnection);
       endif
       else (no)
        :Mark_PCF_State_Unknown__Unsupported_Envt_Type (OpenApiConnection);
       endif
     endif
     repeat
      :If_has_CDS (If);
       if (condition) then (yes)
        :update_pcf_state (Scope);
         if (condition) then (yes)
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         endif
         partition "update_pcf_state" {
          :Parse_organization (ParseJson);
          :Update_a_row (OpenApiConnection);
         }
        :Mark_PCF_State_Unknown (OpenApiConnection);
        :See_if_access_to_envt (OpenApiConnection);
       endif
       else (no)
        :Mark_PCF_State_Unknown__Unsupported_Envt_Type (OpenApiConnection);
       endif
     repeat while (more items)
   }
  :Refresh_next_dataflows (Scope);
   if (condition) then (yes)
    :Refresh_Power_Automate_dataflow (OpenApiConnection);
    :Refresh_Canvas_Apps_dataflow (OpenApiConnection);
    :Refresh_Model_Apps_dataflow (OpenApiConnection);
   endif
   partition "Refresh_next_dataflows" {
    :Refresh_Power_Automate_dataflow (OpenApiConnection);
    :Refresh_Canvas_Apps_dataflow (OpenApiConnection);
    :Refresh_Model_Apps_dataflow (OpenApiConnection);
   }
  :Catch_failure (Scope);
   partition "Catch_failure" {
   }
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_dataflows_1 | shared_dataflows | admin_CoEBYODLPowerQuery | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Current Environment (admin_CurrentEnvironment) | String | f5ca48ca-0d9c-e680-98c3-6e0123eaac01-31c688f59-westus | Current Environment ID. |
| Flow Dataflow ID (admin_FlowDataflowID) | String | abc | LEAVE BLANK ON IMPORT. Dataflow ID of the CoE BYODL Makers dataflow. |
| App Dataflow ID (admin_AppDataflowID) | String | - | LEAVE BLANK ON IMPORT. Dataflow ID of the CoE BYODL Apps dataflow. |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Model App Dataflow ID (admin_ModelAppDataflowID) | String | - | LEAVE BLANK ON IMPORT. Dataflow ID of the dataflow that processes model driven apps. Used for BYODL only. |
| Environment Dataflow ID (admin_EnvironmentDataflowID) | String | - | LEAVE BLANK ON IMPORT. Dataflow ID of the CoE BYODL Environments dataflow. |

## Triggers

### When_a_dataflow_refresh_completes
- **Type:** OpenApiConnection
- **Recurrence:** Frequency: Minute, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Environment_dataflow_complete_processing | Scope | Operation ID: 08f3cfab-5e61-48f5-b822-189dbe545228 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
