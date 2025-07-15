# Power Automate Flow: CLEANUPHELPER-EnvironmentCapacity

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A341FFF
**Source File:** CLEANUPHELPER-EnvironmentCapacity-E08BADC8-D7B6-EE11-A569-000D3A341FFF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUPHELPER-EnvironmentCapacity
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 2
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUPHELPER-EnvironmentCapacity

start
:Trigger: manual (Request);\n:Error_Handling (Scope);
 if (condition) then (yes)
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__fail (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :EnvtDisplayName (Compose);
 endif
 partition "Error_Handling" {
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__fail (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :EnvtDisplayName (Compose);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow__pass (Response);
  :Get_ID_Pass (OpenApiConnection);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow__pass (Response);
  :Get_ID_Pass (OpenApiConnection);
 }
:Inventory_Environment_Capacities (Scope);
 if (condition) then (yes)
  :List_capacity_for_Environment (OpenApiConnection);
  :Apply_to_each_capacity (Foreach);
   if (condition) then (yes)
    :Filter_out_FinOps (If);
     if (condition) then (yes)
      :Check_if_Capacity_Type_already_exists_for_this_environment (Query);
      :If_Capacity_Type_exists_update_else_add_new (If);
       if (condition) then (yes)
        :Add_new_capacity (OpenApiConnection);
       endif
       else (no)
        :Update_capacity (OpenApiConnection);
       endif
     endif
     else (no)
     endif
   endif
   repeat
    :Filter_out_FinOps (If);
     if (condition) then (yes)
      :Check_if_Capacity_Type_already_exists_for_this_environment (Query);
      :If_Capacity_Type_exists_update_else_add_new (If);
       if (condition) then (yes)
        :Add_new_capacity (OpenApiConnection);
       endif
       else (no)
        :Update_capacity (OpenApiConnection);
       endif
     endif
     else (no)
     endif
   repeat while (more items)
  :Set_approved_capacity_for_Developer_and_Teams_environments (Compose);
  :List_addons_for_Environment (OpenApiConnection);
  :Apply_to_each_addon (Foreach);
   if (condition) then (yes)
    :Check_if_Addon_Type_already_exists_for_this_environment (Query);
    :If_Addon_Type_exists_update_else_add_new (If);
     if (condition) then (yes)
      :Add_a_new_row (OpenApiConnection);
     endif
     else (no)
      :Update_a_row (OpenApiConnection);
     endif
   endif
   repeat
    :Check_if_Addon_Type_already_exists_for_this_environment (Query);
    :If_Addon_Type_exists_update_else_add_new (If);
     if (condition) then (yes)
      :Add_a_new_row (OpenApiConnection);
     endif
     else (no)
      :Update_a_row (OpenApiConnection);
     endif
   repeat while (more items)
  :Parse_Capacity (ParseJson);
  :Parse_Addons (ParseJson);
 endif
 partition "Inventory_Environment_Capacities" {
  :List_capacity_for_Environment (OpenApiConnection);
  :Apply_to_each_capacity (Foreach);
   if (condition) then (yes)
    :Filter_out_FinOps (If);
     if (condition) then (yes)
      :Check_if_Capacity_Type_already_exists_for_this_environment (Query);
      :If_Capacity_Type_exists_update_else_add_new (If);
       if (condition) then (yes)
        :Add_new_capacity (OpenApiConnection);
       endif
       else (no)
        :Update_capacity (OpenApiConnection);
       endif
     endif
     else (no)
     endif
   endif
   repeat
    :Filter_out_FinOps (If);
     if (condition) then (yes)
      :Check_if_Capacity_Type_already_exists_for_this_environment (Query);
      :If_Capacity_Type_exists_update_else_add_new (If);
       if (condition) then (yes)
        :Add_new_capacity (OpenApiConnection);
       endif
       else (no)
        :Update_capacity (OpenApiConnection);
       endif
     endif
     else (no)
     endif
   repeat while (more items)
  :Set_approved_capacity_for_Developer_and_Teams_environments (Compose);
  :List_addons_for_Environment (OpenApiConnection);
  :Apply_to_each_addon (Foreach);
   if (condition) then (yes)
    :Check_if_Addon_Type_already_exists_for_this_environment (Query);
    :If_Addon_Type_exists_update_else_add_new (If);
     if (condition) then (yes)
      :Add_a_new_row (OpenApiConnection);
     endif
     else (no)
      :Update_a_row (OpenApiConnection);
     endif
   endif
   repeat
    :Check_if_Addon_Type_already_exists_for_this_environment (Query);
    :If_Addon_Type_exists_update_else_add_new (If);
     if (condition) then (yes)
      :Add_a_new_row (OpenApiConnection);
     endif
     else (no)
      :Update_a_row (OpenApiConnection);
     endif
   repeat while (more items)
  :Parse_Capacity (ParseJson);
  :Parse_Addons (ParseJson);
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Inventory_Environment_Capacities | Scope | Operation ID: 1abd8810-3b90-46e7-b61a-e8f327112911 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
