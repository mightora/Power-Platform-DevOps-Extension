# Power Automate Flow: SetupWizardGetUserGraphPermissions

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 6045BD039C1F
**Source File:** SetupWizardGetUserGraphPermissions-A6A934E2-D88F-EF11-AC21-6045BD039C1F.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** SetupWizardGetUserGraphPermissions
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1
- **Connections:** 4
- **Parameters:** 0

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: SetupWizardGetUserGraphPermissions

start
:Trigger: manual (Request);\n:Get_User_Graph_Permissions (Scope);
 if (condition) then (yes)
  :Respond_to_a_PowerApp_or_flow (Response);
  :Get_Graph_API_URL (Scope);
   if (condition) then (yes)
    :Set_to_current_or_default__GraphURL (If);
     if (condition) then (yes)
      :Set_GraphURL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_GraphURL__DefaultValue (SetVariable);
     endif
    :ListCurrentsGraphURL (OpenApiConnection);
    :Get_ID_from_GraphURL (Compose);
    :ListDefnsGraphURL (OpenApiConnection);
    :If_GraphURL_still_empty_set_as_commercial (If);
     if (condition) then (yes)
      :Set_GraphURL_to_commercial_url (SetVariable);
     endif
   endif
   partition "Get_Graph_API_URL" {
    :Set_to_current_or_default__GraphURL (If);
     if (condition) then (yes)
      :Set_GraphURL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_GraphURL__DefaultValue (SetVariable);
     endif
    :ListCurrentsGraphURL (OpenApiConnection);
    :Get_ID_from_GraphURL (Compose);
    :ListDefnsGraphURL (OpenApiConnection);
    :If_GraphURL_still_empty_set_as_commercial (If);
     if (condition) then (yes)
      :Set_GraphURL_to_commercial_url (SetVariable);
     endif
   }
  :ApplicationReadAll (Scope);
   if (condition) then (yes)
    :Get_Service_Principles (OpenApiConnection);
    :Set_hasApplicationReadAll_to_false (SetVariable);
   endif
   partition "ApplicationReadAll" {
    :Get_Service_Principles (OpenApiConnection);
    :Set_hasApplicationReadAll_to_false (SetVariable);
   }
  :OrganizationReadAll (Scope);
   if (condition) then (yes)
    :Get_Organization (OpenApiConnection);
    :Set_hasOrganizationReadAll_to_false (SetVariable);
   endif
   partition "OrganizationReadAll" {
    :Get_Organization (OpenApiConnection);
    :Set_hasOrganizationReadAll_to_false (SetVariable);
   }
  :GroupReadAll (Scope);
   if (condition) then (yes)
    :Set_hasGroupReadAll_to_false (SetVariable);
    :List_groups (OpenApiConnection);
    :Get_GroupReadAll (OpenApiConnection);
    :first_group_id (Compose);
   endif
   partition "GroupReadAll" {
    :Set_hasGroupReadAll_to_false (SetVariable);
    :List_groups (OpenApiConnection);
    :Get_GroupReadAll (OpenApiConnection);
    :first_group_id (Compose);
   }
  :UserReadAll (Scope);
   if (condition) then (yes)
    :Get_User_Read_All (OpenApiConnection);
    :Set_hasUserReadAll_to_false (SetVariable);
   endif
   partition "UserReadAll" {
    :Get_User_Read_All (OpenApiConnection);
    :Set_hasUserReadAll_to_false (SetVariable);
   }
 endif
 partition "Get_User_Graph_Permissions" {
  :Respond_to_a_PowerApp_or_flow (Response);
  :Get_Graph_API_URL (Scope);
   if (condition) then (yes)
    :Set_to_current_or_default__GraphURL (If);
     if (condition) then (yes)
      :Set_GraphURL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_GraphURL__DefaultValue (SetVariable);
     endif
    :ListCurrentsGraphURL (OpenApiConnection);
    :Get_ID_from_GraphURL (Compose);
    :ListDefnsGraphURL (OpenApiConnection);
    :If_GraphURL_still_empty_set_as_commercial (If);
     if (condition) then (yes)
      :Set_GraphURL_to_commercial_url (SetVariable);
     endif
   endif
   partition "Get_Graph_API_URL" {
    :Set_to_current_or_default__GraphURL (If);
     if (condition) then (yes)
      :Set_GraphURL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_GraphURL__DefaultValue (SetVariable);
     endif
    :ListCurrentsGraphURL (OpenApiConnection);
    :Get_ID_from_GraphURL (Compose);
    :ListDefnsGraphURL (OpenApiConnection);
    :If_GraphURL_still_empty_set_as_commercial (If);
     if (condition) then (yes)
      :Set_GraphURL_to_commercial_url (SetVariable);
     endif
   }
  :ApplicationReadAll (Scope);
   if (condition) then (yes)
    :Get_Service_Principles (OpenApiConnection);
    :Set_hasApplicationReadAll_to_false (SetVariable);
   endif
   partition "ApplicationReadAll" {
    :Get_Service_Principles (OpenApiConnection);
    :Set_hasApplicationReadAll_to_false (SetVariable);
   }
  :OrganizationReadAll (Scope);
   if (condition) then (yes)
    :Get_Organization (OpenApiConnection);
    :Set_hasOrganizationReadAll_to_false (SetVariable);
   endif
   partition "OrganizationReadAll" {
    :Get_Organization (OpenApiConnection);
    :Set_hasOrganizationReadAll_to_false (SetVariable);
   }
  :GroupReadAll (Scope);
   if (condition) then (yes)
    :Set_hasGroupReadAll_to_false (SetVariable);
    :List_groups (OpenApiConnection);
    :Get_GroupReadAll (OpenApiConnection);
    :first_group_id (Compose);
   endif
   partition "GroupReadAll" {
    :Set_hasGroupReadAll_to_false (SetVariable);
    :List_groups (OpenApiConnection);
    :Get_GroupReadAll (OpenApiConnection);
    :first_group_id (Compose);
   }
  :UserReadAll (Scope);
   if (condition) then (yes)
    :Get_User_Read_All (OpenApiConnection);
    :Set_hasUserReadAll_to_false (SetVariable);
   endif
   partition "UserReadAll" {
    :Get_User_Read_All (OpenApiConnection);
    :Set_hasUserReadAll_to_false (SetVariable);
   }
 }
:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
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
:Initialize_GraphURL (InitializeVariable);
:Initialize_hasApplicationReadAll (InitializeVariable);
:Initialize_hasGroupReadAll (InitializeVariable);
:Initialize_hasOrganizationReadAll (InitializeVariable);
:Initialize_hasUserReadAll (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseForApps | embedded |
| shared_webcontents | shared_webcontents | admin_CoECoreHTTPWithAzureAD | invoker |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_office365groups | shared_office365groups | admin_CoECoreO365Groups | invoker |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Get_User_Graph_Permissions | Scope | Operation ID: 060ffa9c-e085-4a43-921e-fa08e6a12121 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_GraphURL | InitializeVariable | Operation ID: 01644a3b-1f0c-494b-9b5d-d11044ec7c31 |
| Initialize_hasApplicationReadAll | InitializeVariable | Operation ID: 01644a3b-1f0c-494b-9b5d-d11044ec7c31 |
| Initialize_hasGroupReadAll | InitializeVariable | Operation ID: 01644a3b-1f0c-494b-9b5d-d11044ec7c31 |
| Initialize_hasOrganizationReadAll | InitializeVariable | Operation ID: 01644a3b-1f0c-494b-9b5d-d11044ec7c31 |
| Initialize_hasUserReadAll | InitializeVariable | Operation ID: 01644a3b-1f0c-494b-9b5d-d11044ec7c31 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
