# Power Automate Flow: AdminSyncTemplatev4BYODLAppProperties

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 0022480819D7
**Source File:** AdminSyncTemplatev4BYODLAppProperties-575E9880-B3B6-ED11-83FE-0022480819D7.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4BYODLAppProperties
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 3
- **Parameters:** 3

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4BYODLAppProperties

start
:Trigger: manual (Request);\n:Error_Handling (Scope);
 if (condition) then (yes)
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
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
:Respond_to_a_PowerApp_or_flow (Response);
:Check_if_Inventory_in_sync_flow_architecture_terminate_if_true (If);
 if (condition) then (yes)
  :Terminate_for_environments_marked_deleted (Terminate);
 endif
:Get_extra_app_properties_for_this_envt (Scope);
 if (condition) then (yes)
  :Get_Basics (Scope);
   if (condition) then (yes)
    :CurrentAppInventory (OpenApiConnection);
    :Ensure_Envt_Inventoried (Scope);
     if (condition) then (yes)
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Ensure_Envt_Inventoried" {
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
    :Get_Apps_as_Admin (OpenApiConnection);
    :Inventory_AppIDs (Select);
    :Actual_Already_Inventoried (Query);
   endif
   partition "Get_Basics" {
    :CurrentAppInventory (OpenApiConnection);
    :Ensure_Envt_Inventoried (Scope);
     if (condition) then (yes)
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Ensure_Envt_Inventoried" {
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
    :Get_Apps_as_Admin (OpenApiConnection);
    :Inventory_AppIDs (Select);
    :Actual_Already_Inventoried (Query);
   }
  :Get_List_of_Apps_to_Update_and_Insert (Scope);
   if (condition) then (yes)
    :raw (Compose);
    :Complete_List_AppsToInventory (Compose);
    :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
     if (condition) then (yes)
      :AppsToInventory__ManualRequest (OpenApiConnection);
      :Add_manual_requests_to_array (Foreach);
       if (condition) then (yes)
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       endif
       repeat
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       repeat while (more items)
     endif
     partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
      :AppsToInventory__ManualRequest (OpenApiConnection);
      :Add_manual_requests_to_array (Foreach);
       if (condition) then (yes)
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       endif
       repeat
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       repeat while (more items)
     }
    :Look_for_ones_with_updates (Scope);
     if (condition) then (yes)
      :Get_Inventory__Updates (Scope);
       if (condition) then (yes)
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       endif
       partition "Get_Inventory__Updates" {
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       }
      :Get_Actual__Updates (Scope);
       if (condition) then (yes)
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       endif
       partition "Get_Actual__Updates" {
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       }
      :Add_Updates_to_appsToInventory (Scope);
       if (condition) then (yes)
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_Updates_to_appsToInventory" {
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_ones_with_updates" {
      :Get_Inventory__Updates (Scope);
       if (condition) then (yes)
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       endif
       partition "Get_Inventory__Updates" {
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       }
      :Get_Actual__Updates (Scope);
       if (condition) then (yes)
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       endif
       partition "Get_Actual__Updates" {
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       }
      :Add_Updates_to_appsToInventory (Scope);
       if (condition) then (yes)
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_Updates_to_appsToInventory" {
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       }
     }
   endif
   partition "Get_List_of_Apps_to_Update_and_Insert" {
    :raw (Compose);
    :Complete_List_AppsToInventory (Compose);
    :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
     if (condition) then (yes)
      :AppsToInventory__ManualRequest (OpenApiConnection);
      :Add_manual_requests_to_array (Foreach);
       if (condition) then (yes)
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       endif
       repeat
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       repeat while (more items)
     endif
     partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
      :AppsToInventory__ManualRequest (OpenApiConnection);
      :Add_manual_requests_to_array (Foreach);
       if (condition) then (yes)
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       endif
       repeat
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       repeat while (more items)
     }
    :Look_for_ones_with_updates (Scope);
     if (condition) then (yes)
      :Get_Inventory__Updates (Scope);
       if (condition) then (yes)
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       endif
       partition "Get_Inventory__Updates" {
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       }
      :Get_Actual__Updates (Scope);
       if (condition) then (yes)
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       endif
       partition "Get_Actual__Updates" {
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       }
      :Add_Updates_to_appsToInventory (Scope);
       if (condition) then (yes)
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_Updates_to_appsToInventory" {
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_ones_with_updates" {
      :Get_Inventory__Updates (Scope);
       if (condition) then (yes)
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       endif
       partition "Get_Inventory__Updates" {
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       }
      :Get_Actual__Updates (Scope);
       if (condition) then (yes)
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       endif
       partition "Get_Actual__Updates" {
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       }
      :Add_Updates_to_appsToInventory (Scope);
       if (condition) then (yes)
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_Updates_to_appsToInventory" {
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       }
     }
   }
  :Update_all_targetted_apps (Foreach);
   if (condition) then (yes)
    :Run_a_Child_Flow (Workflow);
   endif
   repeat
    :Run_a_Child_Flow (Workflow);
   repeat while (more items)
 endif
 partition "Get_extra_app_properties_for_this_envt" {
  :Get_Basics (Scope);
   if (condition) then (yes)
    :CurrentAppInventory (OpenApiConnection);
    :Ensure_Envt_Inventoried (Scope);
     if (condition) then (yes)
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Ensure_Envt_Inventoried" {
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
    :Get_Apps_as_Admin (OpenApiConnection);
    :Inventory_AppIDs (Select);
    :Actual_Already_Inventoried (Query);
   endif
   partition "Get_Basics" {
    :CurrentAppInventory (OpenApiConnection);
    :Ensure_Envt_Inventoried (Scope);
     if (condition) then (yes)
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Ensure_Envt_Inventoried" {
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
    :Get_Apps_as_Admin (OpenApiConnection);
    :Inventory_AppIDs (Select);
    :Actual_Already_Inventoried (Query);
   }
  :Get_List_of_Apps_to_Update_and_Insert (Scope);
   if (condition) then (yes)
    :raw (Compose);
    :Complete_List_AppsToInventory (Compose);
    :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
     if (condition) then (yes)
      :AppsToInventory__ManualRequest (OpenApiConnection);
      :Add_manual_requests_to_array (Foreach);
       if (condition) then (yes)
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       endif
       repeat
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       repeat while (more items)
     endif
     partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
      :AppsToInventory__ManualRequest (OpenApiConnection);
      :Add_manual_requests_to_array (Foreach);
       if (condition) then (yes)
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       endif
       repeat
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       repeat while (more items)
     }
    :Look_for_ones_with_updates (Scope);
     if (condition) then (yes)
      :Get_Inventory__Updates (Scope);
       if (condition) then (yes)
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       endif
       partition "Get_Inventory__Updates" {
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       }
      :Get_Actual__Updates (Scope);
       if (condition) then (yes)
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       endif
       partition "Get_Actual__Updates" {
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       }
      :Add_Updates_to_appsToInventory (Scope);
       if (condition) then (yes)
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_Updates_to_appsToInventory" {
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_ones_with_updates" {
      :Get_Inventory__Updates (Scope);
       if (condition) then (yes)
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       endif
       partition "Get_Inventory__Updates" {
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       }
      :Get_Actual__Updates (Scope);
       if (condition) then (yes)
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       endif
       partition "Get_Actual__Updates" {
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       }
      :Add_Updates_to_appsToInventory (Scope);
       if (condition) then (yes)
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_Updates_to_appsToInventory" {
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       }
     }
   endif
   partition "Get_List_of_Apps_to_Update_and_Insert" {
    :raw (Compose);
    :Complete_List_AppsToInventory (Compose);
    :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
     if (condition) then (yes)
      :AppsToInventory__ManualRequest (OpenApiConnection);
      :Add_manual_requests_to_array (Foreach);
       if (condition) then (yes)
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       endif
       repeat
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       repeat while (more items)
     endif
     partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
      :AppsToInventory__ManualRequest (OpenApiConnection);
      :Add_manual_requests_to_array (Foreach);
       if (condition) then (yes)
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       endif
       repeat
        :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
       repeat while (more items)
     }
    :Look_for_ones_with_updates (Scope);
     if (condition) then (yes)
      :Get_Inventory__Updates (Scope);
       if (condition) then (yes)
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       endif
       partition "Get_Inventory__Updates" {
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       }
      :Get_Actual__Updates (Scope);
       if (condition) then (yes)
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       endif
       partition "Get_Actual__Updates" {
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       }
      :Add_Updates_to_appsToInventory (Scope);
       if (condition) then (yes)
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_Updates_to_appsToInventory" {
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_ones_with_updates" {
      :Get_Inventory__Updates (Scope);
       if (condition) then (yes)
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       endif
       partition "Get_Inventory__Updates" {
        :Select_Inventory__Updates (Select);
        :Parse_Inventory__Updates (ParseJson);
       }
      :Get_Actual__Updates (Scope);
       if (condition) then (yes)
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       endif
       partition "Get_Actual__Updates" {
        :Select_Actual__Updates (Select);
        :Parse_Actual__Updates (ParseJson);
       }
      :Add_Updates_to_appsToInventory (Scope);
       if (condition) then (yes)
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_Updates_to_appsToInventory" {
        :UpdatesToInventory (Query);
        :Add_Updates_to_array (Foreach);
         if (condition) then (yes)
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         endif
         repeat
          :Append_Updates_to_appsToInventory (AppendToArrayVariable);
         repeat while (more items)
       }
     }
   }
  :Update_all_targetted_apps (Foreach);
   if (condition) then (yes)
    :Run_a_Child_Flow (Workflow);
   endif
   repeat
    :Run_a_Child_Flow (Workflow);
   repeat while (more items)
 }
:Initialize_appsToInventory (InitializeVariable);
:Delay_Inventory (If);
 if (condition) then (yes)
  :Delay_1_to_300_minutes (Wait);
 endif

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_powerappsforadmins_1 | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Inventory and Telemetry in Azure Data Storage account (admin_InventoryandTelemetryinAzureDataStorageaccount) | Bool | - | Inventory - Have you set up data export in PPAC and is your inventory and telemetry in an Azure Data Storage folder (also referred to as Bring your own Datalake, self-serve analytics feature). Default no |
| DelayInventory (admin_DelayInventory) | Bool | True | Inventory - If Yes, will run a delay step to assist with the Dataverse health. Only turn to No for debugging.  |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Respond_to_a_PowerApp_or_flow | Response | Operation ID: 888a4ba5-9b3a-4fb4-aa45-19c8ff849d81 |
| Check_if_Inventory_in_sync_flow_architecture,_terminate_if_true | If | Operation ID: 0bf354ac-4265-4bbe-9fed-996958d038bd |
| Get_extra_app_properties_for_this_envt | Scope | Operation ID: a61d4c0c-2a4d-4e5d-8cf5-b3d0a9ddf4aa |
| Initialize_appsToInventory | InitializeVariable | Operation ID: e62ec4d2-a0ec-4fa6-952c-316178fd25d7 |
| Delay_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
