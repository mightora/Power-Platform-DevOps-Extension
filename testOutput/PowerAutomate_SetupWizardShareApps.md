# Power Automate Flow: SetupWizardShareApps

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 6045BD07536E
**Source File:** SetupWizardShareApps-1FF39C14-FE60-ED11-9561-6045BD07536E.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** SetupWizardShareApps
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1
- **Connections:** 5
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: SetupWizardShareApps

start
:Trigger: When_a_row_is_added,_modified_or_deleted (OpenApiConnectionWebhook);\n:Initialize_UserGroup (InitializeVariable);
:Initialize_MakerGroup (InitializeVariable);
:Initialize_AdminGroup (InitializeVariable);
:Share_Apps_Scope (Scope);
 if (condition) then (yes)
  :Compose (Compose);
  :Parse_JSON (ParseJson);
  :List_CoE_apps (OpenApiConnection);
  :List_Security_Roles (OpenApiConnection);
  :Power_Platform_Admin_SR (Query);
  :Power_Platform_Maker_SR (Query);
  :Power_Platform_User_SR (Query);
  :Get_Power_Platform_Admin_SR (Compose);
  :Get_Power_Platform_Maker_SR (Compose);
  :Get_Power_Platform_User_SR (Compose);
  :Set_env_var_PowerPlatformUserGroupID (Scope);
   if (condition) then (yes)
    :ListDefnsPowerPlatformUserGroupID (OpenApiConnection);
    :Get_ID_from_PowerPlatformUserGroupID (Compose);
    :ListCurrentsPowerPlatformUserGroupID (OpenApiConnection);
    :PowerPlatformUserGroupID__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_PowerPlatformUserGroupID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_PowerPlatformUserGroupID__DefaultValue (SetVariable);
     endif
   endif
   partition "Set_env_var_PowerPlatformUserGroupID" {
    :ListDefnsPowerPlatformUserGroupID (OpenApiConnection);
    :Get_ID_from_PowerPlatformUserGroupID (Compose);
    :ListCurrentsPowerPlatformUserGroupID (OpenApiConnection);
    :PowerPlatformUserGroupID__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_PowerPlatformUserGroupID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_PowerPlatformUserGroupID__DefaultValue (SetVariable);
     endif
   }
  :Set_env_var_PowerPlatformMakeSecurityGroup (Scope);
   if (condition) then (yes)
    :ListDefnsPowerPlatformMakeSecurityGroup (OpenApiConnection);
    :Get_ID_from_PowerPlatformMakeSecurityGroup (Compose);
    :ListCurrentsPowerPlatformMakeSecurityGroup (OpenApiConnection);
    :PowerPlatformMakeSecurityGroup__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_PowerPlatformMakeSecurityGroup__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_PowerPlatformMakeSecurityGroup__DefaultValue (SetVariable);
     endif
   endif
   partition "Set_env_var_PowerPlatformMakeSecurityGroup" {
    :ListDefnsPowerPlatformMakeSecurityGroup (OpenApiConnection);
    :Get_ID_from_PowerPlatformMakeSecurityGroup (Compose);
    :ListCurrentsPowerPlatformMakeSecurityGroup (OpenApiConnection);
    :PowerPlatformMakeSecurityGroup__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_PowerPlatformMakeSecurityGroup__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_PowerPlatformMakeSecurityGroup__DefaultValue (SetVariable);
     endif
   }
  :Set_env_var_AdminMail (Scope);
   if (condition) then (yes)
    :ListDefnsAdminMail (OpenApiConnection);
    :Get_ID_from_AdminMail (Compose);
    :ListCurrentsAdminMail (OpenApiConnection);
    :AdminMail__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_AdminMail__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AdminMail__DefaultValue (SetVariable);
     endif
    :AdminMail__if_not_null_get_id_from_mail (If);
     if (condition) then (yes)
      :AdminMail__Get_Group_for_ID (OpenApiConnection);
      :AdminMail__If_group_found (If);
       if (condition) then (yes)
        :AdminMail__Set_to_Group_ID (SetVariable);
       endif
       else (no)
        :AdminMail__Get_User_for_ID (OpenApiConnection);
        :AdminMail__If_user_found (If);
         if (condition) then (yes)
          :AdminMail__Set_to_User_ID (SetVariable);
         endif
         else (no)
          :AdminMail__Set_to_null (SetVariable);
         endif
        :AdminMail__Neither_User_Nor_Group (SetVariable);
       endif
     endif
   endif
   partition "Set_env_var_AdminMail" {
    :ListDefnsAdminMail (OpenApiConnection);
    :Get_ID_from_AdminMail (Compose);
    :ListCurrentsAdminMail (OpenApiConnection);
    :AdminMail__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_AdminMail__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AdminMail__DefaultValue (SetVariable);
     endif
    :AdminMail__if_not_null_get_id_from_mail (If);
     if (condition) then (yes)
      :AdminMail__Get_Group_for_ID (OpenApiConnection);
      :AdminMail__If_group_found (If);
       if (condition) then (yes)
        :AdminMail__Set_to_Group_ID (SetVariable);
       endif
       else (no)
        :AdminMail__Get_User_for_ID (OpenApiConnection);
        :AdminMail__If_user_found (If);
         if (condition) then (yes)
          :AdminMail__Set_to_User_ID (SetVariable);
         endif
         else (no)
          :AdminMail__Set_to_null (SetVariable);
         endif
        :AdminMail__Neither_User_Nor_Group (SetVariable);
       endif
     endif
   }
  :Apply_to_each (Foreach);
   if (condition) then (yes)
    :Switch_persona (Switch);
   endif
   repeat
    :Switch_persona (Switch);
   repeat while (more items)
  :Get_Admin_Security_Role_odata (OpenApiConnection);
  :Get_Maker_Security_Role_odata (OpenApiConnection);
  :Get_User_Security_Role_odata (OpenApiConnection);
 endif
 partition "Share_Apps_Scope" {
  :Compose (Compose);
  :Parse_JSON (ParseJson);
  :List_CoE_apps (OpenApiConnection);
  :List_Security_Roles (OpenApiConnection);
  :Power_Platform_Admin_SR (Query);
  :Power_Platform_Maker_SR (Query);
  :Power_Platform_User_SR (Query);
  :Get_Power_Platform_Admin_SR (Compose);
  :Get_Power_Platform_Maker_SR (Compose);
  :Get_Power_Platform_User_SR (Compose);
  :Set_env_var_PowerPlatformUserGroupID (Scope);
   if (condition) then (yes)
    :ListDefnsPowerPlatformUserGroupID (OpenApiConnection);
    :Get_ID_from_PowerPlatformUserGroupID (Compose);
    :ListCurrentsPowerPlatformUserGroupID (OpenApiConnection);
    :PowerPlatformUserGroupID__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_PowerPlatformUserGroupID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_PowerPlatformUserGroupID__DefaultValue (SetVariable);
     endif
   endif
   partition "Set_env_var_PowerPlatformUserGroupID" {
    :ListDefnsPowerPlatformUserGroupID (OpenApiConnection);
    :Get_ID_from_PowerPlatformUserGroupID (Compose);
    :ListCurrentsPowerPlatformUserGroupID (OpenApiConnection);
    :PowerPlatformUserGroupID__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_PowerPlatformUserGroupID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_PowerPlatformUserGroupID__DefaultValue (SetVariable);
     endif
   }
  :Set_env_var_PowerPlatformMakeSecurityGroup (Scope);
   if (condition) then (yes)
    :ListDefnsPowerPlatformMakeSecurityGroup (OpenApiConnection);
    :Get_ID_from_PowerPlatformMakeSecurityGroup (Compose);
    :ListCurrentsPowerPlatformMakeSecurityGroup (OpenApiConnection);
    :PowerPlatformMakeSecurityGroup__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_PowerPlatformMakeSecurityGroup__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_PowerPlatformMakeSecurityGroup__DefaultValue (SetVariable);
     endif
   endif
   partition "Set_env_var_PowerPlatformMakeSecurityGroup" {
    :ListDefnsPowerPlatformMakeSecurityGroup (OpenApiConnection);
    :Get_ID_from_PowerPlatformMakeSecurityGroup (Compose);
    :ListCurrentsPowerPlatformMakeSecurityGroup (OpenApiConnection);
    :PowerPlatformMakeSecurityGroup__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_PowerPlatformMakeSecurityGroup__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_PowerPlatformMakeSecurityGroup__DefaultValue (SetVariable);
     endif
   }
  :Set_env_var_AdminMail (Scope);
   if (condition) then (yes)
    :ListDefnsAdminMail (OpenApiConnection);
    :Get_ID_from_AdminMail (Compose);
    :ListCurrentsAdminMail (OpenApiConnection);
    :AdminMail__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_AdminMail__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AdminMail__DefaultValue (SetVariable);
     endif
    :AdminMail__if_not_null_get_id_from_mail (If);
     if (condition) then (yes)
      :AdminMail__Get_Group_for_ID (OpenApiConnection);
      :AdminMail__If_group_found (If);
       if (condition) then (yes)
        :AdminMail__Set_to_Group_ID (SetVariable);
       endif
       else (no)
        :AdminMail__Get_User_for_ID (OpenApiConnection);
        :AdminMail__If_user_found (If);
         if (condition) then (yes)
          :AdminMail__Set_to_User_ID (SetVariable);
         endif
         else (no)
          :AdminMail__Set_to_null (SetVariable);
         endif
        :AdminMail__Neither_User_Nor_Group (SetVariable);
       endif
     endif
   endif
   partition "Set_env_var_AdminMail" {
    :ListDefnsAdminMail (OpenApiConnection);
    :Get_ID_from_AdminMail (Compose);
    :ListCurrentsAdminMail (OpenApiConnection);
    :AdminMail__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_AdminMail__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AdminMail__DefaultValue (SetVariable);
     endif
    :AdminMail__if_not_null_get_id_from_mail (If);
     if (condition) then (yes)
      :AdminMail__Get_Group_for_ID (OpenApiConnection);
      :AdminMail__If_group_found (If);
       if (condition) then (yes)
        :AdminMail__Set_to_Group_ID (SetVariable);
       endif
       else (no)
        :AdminMail__Get_User_for_ID (OpenApiConnection);
        :AdminMail__If_user_found (If);
         if (condition) then (yes)
          :AdminMail__Set_to_User_ID (SetVariable);
         endif
         else (no)
          :AdminMail__Set_to_null (SetVariable);
         endif
        :AdminMail__Neither_User_Nor_Group (SetVariable);
       endif
     endif
   }
  :Apply_to_each (Foreach);
   if (condition) then (yes)
    :Switch_persona (Switch);
   endif
   repeat
    :Switch_persona (Switch);
   repeat while (more items)
  :Get_Admin_Security_Role_odata (OpenApiConnection);
  :Get_Maker_Security_Role_odata (OpenApiConnection);
  :Get_User_Security_Role_odata (OpenApiConnection);
 }
:Initialize_varResult (InitializeVariable);
:Set_varResult_fail__scope_catch (SetVariable);
:if_flow_passed_or_failed (If);
 if (condition) then (yes)
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
 endif
 else (no)
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
 endif
:Compose_2 (Compose);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_office365groups_1 | shared_office365groups | admin_CoECoreO365Groups | embedded |
| shared_office365users_1 | shared_office365users | admin_CoECoreO365Users | embedded |
| shared_powerappsforadmins | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### When_a_row_is_added,_modified_or_deleted
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_UserGroup | InitializeVariable | Operation ID: f1122c63-7951-414b-93ec-177ef53eba7d |
| Initialize_MakerGroup | InitializeVariable | Operation ID: f1122c63-7951-414b-93ec-177ef53eba7d |
| Initialize_AdminGroup | InitializeVariable | Operation ID: f1122c63-7951-414b-93ec-177ef53eba7d |
| Share_Apps_Scope | Scope | Operation ID: 72de7d4b-b577-4ec1-b32b-16251e691c9b |
| Initialize_varResult | InitializeVariable | Operation ID: 2bfb5c3b-b504-427c-b886-34d72c35bc61 |
| Set_varResult_fail_-_scope_catch | SetVariable | Operation ID: 3abbec4f-d987-4749-89a0-d3c1d0c3e512 |
| if_flow_passed_or_failed | If | Operation ID: 358bbb38-def8-4843-9d92-4ea489574644 |
| Compose_2 | Compose | Operation ID: d5c71c93-7c0c-4063-846b-2d7c1ebbba2b |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
