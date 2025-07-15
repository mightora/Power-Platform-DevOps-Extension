# Power Automate Flow: CommandCenterAppInitiallyPopulateBookmarks

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A8C225C
**Source File:** CommandCenterAppInitiallyPopulateBookmarks-81EA7AC4-910A-EC11-B6E6-000D3A8C225C.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CommandCenterAppInitiallyPopulateBookmarks
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 4
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CommandCenterAppInitiallyPopulateBookmarks

start
:Trigger: When_a_row_is_added,_modified_or_deleted (OpenApiConnectionWebhook);\n:populate_bookmarks (Scope);
 if (condition) then (yes)
  :Parse_JSON (ParseJson);
  :Get_the_Canvas_Apps (Scope);
   if (condition) then (yes)
    :Get_Apps_as_Admin (OpenApiConnection);
    :Apply_to_each_app_in_this_environment (Foreach);
     if (condition) then (yes)
      :Check_if_CoE_app (If);
       if (condition) then (yes)
        :See_if_canvas_app_already_collected (OpenApiConnection);
        :Add_canvas_if_new (If);
         if (condition) then (yes)
          :Add_canvas (OpenApiConnection);
         endif
         else (no)
          :Update_Canvas_Link (OpenApiConnection);
         endif
       endif
      :Catch__App_Deleted__product_caching_issue (Compose);
      :Get_URI_without_Hint (Compose);
      :Get_Logical_Name (Compose);
      :Compose_2 (Compose);
     endif
     repeat
      :Check_if_CoE_app (If);
       if (condition) then (yes)
        :See_if_canvas_app_already_collected (OpenApiConnection);
        :Add_canvas_if_new (If);
         if (condition) then (yes)
          :Add_canvas (OpenApiConnection);
         endif
         else (no)
          :Update_Canvas_Link (OpenApiConnection);
         endif
       endif
      :Catch__App_Deleted__product_caching_issue (Compose);
      :Get_URI_without_Hint (Compose);
      :Get_Logical_Name (Compose);
      :Compose_2 (Compose);
     repeat while (more items)
    :Filter_array (Query);
   endif
   partition "Get_the_Canvas_Apps" {
    :Get_Apps_as_Admin (OpenApiConnection);
    :Apply_to_each_app_in_this_environment (Foreach);
     if (condition) then (yes)
      :Check_if_CoE_app (If);
       if (condition) then (yes)
        :See_if_canvas_app_already_collected (OpenApiConnection);
        :Add_canvas_if_new (If);
         if (condition) then (yes)
          :Add_canvas (OpenApiConnection);
         endif
         else (no)
          :Update_Canvas_Link (OpenApiConnection);
         endif
       endif
      :Catch__App_Deleted__product_caching_issue (Compose);
      :Get_URI_without_Hint (Compose);
      :Get_Logical_Name (Compose);
      :Compose_2 (Compose);
     endif
     repeat
      :Check_if_CoE_app (If);
       if (condition) then (yes)
        :See_if_canvas_app_already_collected (OpenApiConnection);
        :Add_canvas_if_new (If);
         if (condition) then (yes)
          :Add_canvas (OpenApiConnection);
         endif
         else (no)
          :Update_Canvas_Link (OpenApiConnection);
         endif
       endif
      :Catch__App_Deleted__product_caching_issue (Compose);
      :Get_URI_without_Hint (Compose);
      :Get_Logical_Name (Compose);
      :Compose_2 (Compose);
     repeat while (more items)
    :Filter_array (Query);
   }
  :Get_the_Model_Driven_Apps (Scope);
   if (condition) then (yes)
    :Get_Model_Driven_Apps (OpenApiConnection);
    :Apply_to_each_model_driven_app_in_this_environment (Foreach);
     if (condition) then (yes)
      :Check_if_CoE_model_driven_app (If);
       if (condition) then (yes)
        :Add_model_driven_app_if_new (If);
         if (condition) then (yes)
          :Add_Model_Driven_App (OpenApiConnection);
         endif
         else (no)
          :Update_MDA_Link (OpenApiConnection);
         endif
        :Compose (Compose);
        :Compose_URL (Compose);
        :See_if_model_driven_app_already_collected (OpenApiConnection);
       endif
     endif
     repeat
      :Check_if_CoE_model_driven_app (If);
       if (condition) then (yes)
        :Add_model_driven_app_if_new (If);
         if (condition) then (yes)
          :Add_Model_Driven_App (OpenApiConnection);
         endif
         else (no)
          :Update_MDA_Link (OpenApiConnection);
         endif
        :Compose (Compose);
        :Compose_URL (Compose);
        :See_if_model_driven_app_already_collected (OpenApiConnection);
       endif
     repeat while (more items)
   endif
   partition "Get_the_Model_Driven_Apps" {
    :Get_Model_Driven_Apps (OpenApiConnection);
    :Apply_to_each_model_driven_app_in_this_environment (Foreach);
     if (condition) then (yes)
      :Check_if_CoE_model_driven_app (If);
       if (condition) then (yes)
        :Add_model_driven_app_if_new (If);
         if (condition) then (yes)
          :Add_Model_Driven_App (OpenApiConnection);
         endif
         else (no)
          :Update_MDA_Link (OpenApiConnection);
         endif
        :Compose (Compose);
        :Compose_URL (Compose);
        :See_if_model_driven_app_already_collected (OpenApiConnection);
       endif
     endif
     repeat
      :Check_if_CoE_model_driven_app (If);
       if (condition) then (yes)
        :Add_model_driven_app_if_new (If);
         if (condition) then (yes)
          :Add_Model_Driven_App (OpenApiConnection);
         endif
         else (no)
          :Update_MDA_Link (OpenApiConnection);
         endif
        :Compose (Compose);
        :Compose_URL (Compose);
        :See_if_model_driven_app_already_collected (OpenApiConnection);
       endif
     repeat while (more items)
   }
  :Hide_non_user_apps (Scope);
   if (condition) then (yes)
    :Get_PBI_Embedded_apps_ (OpenApiConnection);
    :Hide_PBI_Embedded_apps (Foreach);
     if (condition) then (yes)
      :Hide_PBI_Embedded_app (OpenApiConnection);
     endif
     repeat
      :Hide_PBI_Embedded_app (OpenApiConnection);
     repeat while (more items)
    :Get_PowerPlatformAdminView_DefaultCommandLibrary (OpenApiConnection);
    :Hide_PowerPlatformAdminView_DefaultCommandLibrary (Foreach);
     if (condition) then (yes)
      :Update_a_row (OpenApiConnection);
     endif
     repeat
      :Update_a_row (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Hide_non_user_apps" {
    :Get_PBI_Embedded_apps_ (OpenApiConnection);
    :Hide_PBI_Embedded_apps (Foreach);
     if (condition) then (yes)
      :Hide_PBI_Embedded_app (OpenApiConnection);
     endif
     repeat
      :Hide_PBI_Embedded_app (OpenApiConnection);
     repeat while (more items)
    :Get_PowerPlatformAdminView_DefaultCommandLibrary (OpenApiConnection);
    :Hide_PowerPlatformAdminView_DefaultCommandLibrary (Foreach);
     if (condition) then (yes)
      :Update_a_row (OpenApiConnection);
     endif
     repeat
      :Update_a_row (OpenApiConnection);
     repeat while (more items)
   }
  :Respond_to_a_PowerApp_or_flow (Response);
  :catch_timeout (Compose);
 endif
 partition "populate_bookmarks" {
  :Parse_JSON (ParseJson);
  :Get_the_Canvas_Apps (Scope);
   if (condition) then (yes)
    :Get_Apps_as_Admin (OpenApiConnection);
    :Apply_to_each_app_in_this_environment (Foreach);
     if (condition) then (yes)
      :Check_if_CoE_app (If);
       if (condition) then (yes)
        :See_if_canvas_app_already_collected (OpenApiConnection);
        :Add_canvas_if_new (If);
         if (condition) then (yes)
          :Add_canvas (OpenApiConnection);
         endif
         else (no)
          :Update_Canvas_Link (OpenApiConnection);
         endif
       endif
      :Catch__App_Deleted__product_caching_issue (Compose);
      :Get_URI_without_Hint (Compose);
      :Get_Logical_Name (Compose);
      :Compose_2 (Compose);
     endif
     repeat
      :Check_if_CoE_app (If);
       if (condition) then (yes)
        :See_if_canvas_app_already_collected (OpenApiConnection);
        :Add_canvas_if_new (If);
         if (condition) then (yes)
          :Add_canvas (OpenApiConnection);
         endif
         else (no)
          :Update_Canvas_Link (OpenApiConnection);
         endif
       endif
      :Catch__App_Deleted__product_caching_issue (Compose);
      :Get_URI_without_Hint (Compose);
      :Get_Logical_Name (Compose);
      :Compose_2 (Compose);
     repeat while (more items)
    :Filter_array (Query);
   endif
   partition "Get_the_Canvas_Apps" {
    :Get_Apps_as_Admin (OpenApiConnection);
    :Apply_to_each_app_in_this_environment (Foreach);
     if (condition) then (yes)
      :Check_if_CoE_app (If);
       if (condition) then (yes)
        :See_if_canvas_app_already_collected (OpenApiConnection);
        :Add_canvas_if_new (If);
         if (condition) then (yes)
          :Add_canvas (OpenApiConnection);
         endif
         else (no)
          :Update_Canvas_Link (OpenApiConnection);
         endif
       endif
      :Catch__App_Deleted__product_caching_issue (Compose);
      :Get_URI_without_Hint (Compose);
      :Get_Logical_Name (Compose);
      :Compose_2 (Compose);
     endif
     repeat
      :Check_if_CoE_app (If);
       if (condition) then (yes)
        :See_if_canvas_app_already_collected (OpenApiConnection);
        :Add_canvas_if_new (If);
         if (condition) then (yes)
          :Add_canvas (OpenApiConnection);
         endif
         else (no)
          :Update_Canvas_Link (OpenApiConnection);
         endif
       endif
      :Catch__App_Deleted__product_caching_issue (Compose);
      :Get_URI_without_Hint (Compose);
      :Get_Logical_Name (Compose);
      :Compose_2 (Compose);
     repeat while (more items)
    :Filter_array (Query);
   }
  :Get_the_Model_Driven_Apps (Scope);
   if (condition) then (yes)
    :Get_Model_Driven_Apps (OpenApiConnection);
    :Apply_to_each_model_driven_app_in_this_environment (Foreach);
     if (condition) then (yes)
      :Check_if_CoE_model_driven_app (If);
       if (condition) then (yes)
        :Add_model_driven_app_if_new (If);
         if (condition) then (yes)
          :Add_Model_Driven_App (OpenApiConnection);
         endif
         else (no)
          :Update_MDA_Link (OpenApiConnection);
         endif
        :Compose (Compose);
        :Compose_URL (Compose);
        :See_if_model_driven_app_already_collected (OpenApiConnection);
       endif
     endif
     repeat
      :Check_if_CoE_model_driven_app (If);
       if (condition) then (yes)
        :Add_model_driven_app_if_new (If);
         if (condition) then (yes)
          :Add_Model_Driven_App (OpenApiConnection);
         endif
         else (no)
          :Update_MDA_Link (OpenApiConnection);
         endif
        :Compose (Compose);
        :Compose_URL (Compose);
        :See_if_model_driven_app_already_collected (OpenApiConnection);
       endif
     repeat while (more items)
   endif
   partition "Get_the_Model_Driven_Apps" {
    :Get_Model_Driven_Apps (OpenApiConnection);
    :Apply_to_each_model_driven_app_in_this_environment (Foreach);
     if (condition) then (yes)
      :Check_if_CoE_model_driven_app (If);
       if (condition) then (yes)
        :Add_model_driven_app_if_new (If);
         if (condition) then (yes)
          :Add_Model_Driven_App (OpenApiConnection);
         endif
         else (no)
          :Update_MDA_Link (OpenApiConnection);
         endif
        :Compose (Compose);
        :Compose_URL (Compose);
        :See_if_model_driven_app_already_collected (OpenApiConnection);
       endif
     endif
     repeat
      :Check_if_CoE_model_driven_app (If);
       if (condition) then (yes)
        :Add_model_driven_app_if_new (If);
         if (condition) then (yes)
          :Add_Model_Driven_App (OpenApiConnection);
         endif
         else (no)
          :Update_MDA_Link (OpenApiConnection);
         endif
        :Compose (Compose);
        :Compose_URL (Compose);
        :See_if_model_driven_app_already_collected (OpenApiConnection);
       endif
     repeat while (more items)
   }
  :Hide_non_user_apps (Scope);
   if (condition) then (yes)
    :Get_PBI_Embedded_apps_ (OpenApiConnection);
    :Hide_PBI_Embedded_apps (Foreach);
     if (condition) then (yes)
      :Hide_PBI_Embedded_app (OpenApiConnection);
     endif
     repeat
      :Hide_PBI_Embedded_app (OpenApiConnection);
     repeat while (more items)
    :Get_PowerPlatformAdminView_DefaultCommandLibrary (OpenApiConnection);
    :Hide_PowerPlatformAdminView_DefaultCommandLibrary (Foreach);
     if (condition) then (yes)
      :Update_a_row (OpenApiConnection);
     endif
     repeat
      :Update_a_row (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Hide_non_user_apps" {
    :Get_PBI_Embedded_apps_ (OpenApiConnection);
    :Hide_PBI_Embedded_apps (Foreach);
     if (condition) then (yes)
      :Hide_PBI_Embedded_app (OpenApiConnection);
     endif
     repeat
      :Hide_PBI_Embedded_app (OpenApiConnection);
     repeat while (more items)
    :Get_PowerPlatformAdminView_DefaultCommandLibrary (OpenApiConnection);
    :Hide_PowerPlatformAdminView_DefaultCommandLibrary (Foreach);
     if (condition) then (yes)
      :Update_a_row (OpenApiConnection);
     endif
     repeat
      :Update_a_row (OpenApiConnection);
     repeat while (more items)
   }
  :Respond_to_a_PowerApp_or_flow (Response);
  :catch_timeout (Compose);
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

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_powerappsforadmins_1 | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverseForApps | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |

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
| populate_bookmarks | Scope | Operation ID: 8a685e49-0242-4452-a02c-d48b6f1e24bd |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
