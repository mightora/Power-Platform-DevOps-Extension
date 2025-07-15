# Power Automate Flow: HELPER-RemoveUserfromSecurityRole

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A3411D9
**Source File:** HELPER-RemoveUserfromSecurityRole-8201B901-ADC9-EE11-9079-000D3A3411D9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** HELPER-RemoveUserfromSecurityRole
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: HELPER-RemoveUserfromSecurityRole

start
:Trigger: manual (Request);\n:Remove_User_from_Security_Role (Scope);
 if (condition) then (yes)
  :Envt (Scope);
   if (condition) then (yes)
    :Get_Environment (OpenApiConnection);
   endif
   partition "Envt" {
    :Get_Environment (OpenApiConnection);
   }
  :User (Scope);
   if (condition) then (yes)
    :Get_User (OpenApiConnection);
    :User_OData_Link (Compose);
    :User_Name_without_Special_Characters (Compose);
    :Find_UserID (OpenApiConnection);
   endif
   partition "User" {
    :Get_User (OpenApiConnection);
    :User_OData_Link (Compose);
    :User_Name_without_Special_Characters (Compose);
    :Find_UserID (OpenApiConnection);
   }
  :SR (Scope);
   if (condition) then (yes)
    :If_has_TID (If);
     if (condition) then (yes)
      :Find_SR_by_TID (OpenApiConnection);
      :SR_ID_by_TID (Compose);
     endif
     else (no)
      :Find_SR_by_Name (OpenApiConnection);
      :SR_ID_by_Name (Compose);
     endif
    :SR_ID (Compose);
    :Get_SR_to_validate_ID_correct (OpenApiConnection);
   endif
   partition "SR" {
    :If_has_TID (If);
     if (condition) then (yes)
      :Find_SR_by_TID (OpenApiConnection);
      :SR_ID_by_TID (Compose);
     endif
     else (no)
      :Find_SR_by_Name (OpenApiConnection);
      :SR_ID_by_Name (Compose);
     endif
    :SR_ID (Compose);
    :Get_SR_to_validate_ID_correct (OpenApiConnection);
   }
  :BU (Scope);
   if (condition) then (yes)
    :BU_ID (Compose);
    :BU_Name_without_Special_Characters (Compose);
    :Find_BU (OpenApiConnection);
   endif
   partition "BU" {
    :BU_ID (Compose);
    :BU_Name_without_Special_Characters (Compose);
    :Find_BU (OpenApiConnection);
   }
  :Unrelate_user_from_role (OpenApiConnection);
 endif
 partition "Remove_User_from_Security_Role" {
  :Envt (Scope);
   if (condition) then (yes)
    :Get_Environment (OpenApiConnection);
   endif
   partition "Envt" {
    :Get_Environment (OpenApiConnection);
   }
  :User (Scope);
   if (condition) then (yes)
    :Get_User (OpenApiConnection);
    :User_OData_Link (Compose);
    :User_Name_without_Special_Characters (Compose);
    :Find_UserID (OpenApiConnection);
   endif
   partition "User" {
    :Get_User (OpenApiConnection);
    :User_OData_Link (Compose);
    :User_Name_without_Special_Characters (Compose);
    :Find_UserID (OpenApiConnection);
   }
  :SR (Scope);
   if (condition) then (yes)
    :If_has_TID (If);
     if (condition) then (yes)
      :Find_SR_by_TID (OpenApiConnection);
      :SR_ID_by_TID (Compose);
     endif
     else (no)
      :Find_SR_by_Name (OpenApiConnection);
      :SR_ID_by_Name (Compose);
     endif
    :SR_ID (Compose);
    :Get_SR_to_validate_ID_correct (OpenApiConnection);
   endif
   partition "SR" {
    :If_has_TID (If);
     if (condition) then (yes)
      :Find_SR_by_TID (OpenApiConnection);
      :SR_ID_by_TID (Compose);
     endif
     else (no)
      :Find_SR_by_Name (OpenApiConnection);
      :SR_ID_by_Name (Compose);
     endif
    :SR_ID (Compose);
    :Get_SR_to_validate_ID_correct (OpenApiConnection);
   }
  :BU (Scope);
   if (condition) then (yes)
    :BU_ID (Compose);
    :BU_Name_without_Special_Characters (Compose);
    :Find_BU (OpenApiConnection);
   endif
   partition "BU" {
    :BU_ID (Compose);
    :BU_Name_without_Special_Characters (Compose);
    :Find_BU (OpenApiConnection);
   }
  :Unrelate_user_from_role (OpenApiConnection);
 }
:Error_Handling (Scope);
 if (condition) then (yes)
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__failed (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__failed (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
  :Get_ID_Pass (OpenApiConnection);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
  :Get_ID_Pass (OpenApiConnection);
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

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
| Remove_User_from_Security_Role | Scope | Operation ID: 78f002ff-a197-4855-9bf6-c25e056a86fa |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
