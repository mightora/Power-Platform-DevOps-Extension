# Power Automate Flow: AdminSyncTemplatev3ConfigureEmails

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 00224829B4C1
**Source File:** AdminSyncTemplatev3ConfigureEmails-0CA18FDB-AC43-EC11-8C62-00224829B4C1.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev3ConfigureEmails
- **Triggers:** 1
- **Actions:** 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev3ConfigureEmails

start
:Trigger: manual (Request);\n:CoE_Mails (InitializeVariable);
:Initialize_singleMailUpdatePassed_to_true (InitializeVariable);
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
:Configure_All_or_One_Email (Scope);
 if (condition) then (yes)
  :fake_all_solutions_installed (Compose);
  :Parse_JSON (ParseJson);
  :see_if_all_or_one_mail (If);
   if (condition) then (yes)
    :CleanUp_Deleted_Mails (Scope);
     if (condition) then (yes)
      :Get_past_time (Expression);
      :List_mails_not_updated_recently (OpenApiConnection);
      :Delete_mails_not_updated_recently (Foreach);
       if (condition) then (yes)
        :Delete_mail_not_updated_recently (OpenApiConnection);
       endif
       repeat
        :Delete_mail_not_updated_recently (OpenApiConnection);
       repeat while (more items)
     endif
     partition "CleanUp_Deleted_Mails" {
      :Get_past_time (Expression);
      :List_mails_not_updated_recently (OpenApiConnection);
      :Delete_mails_not_updated_recently (Foreach);
       if (condition) then (yes)
        :Delete_mail_not_updated_recently (OpenApiConnection);
       endif
       repeat
        :Delete_mail_not_updated_recently (OpenApiConnection);
       repeat while (more items)
     }
    :Update_Mails (Scope);
     if (condition) then (yes)
      :Apply_to_each_Mail (Foreach);
       if (condition) then (yes)
        :if_soln_installed (If);
         if (condition) then (yes)
          :add (Compose);
          :See_if_mail_already_exists (OpenApiConnection);
          :Add_or_Update_Mail (If);
           if (condition) then (yes)
            :Update_a_row (OpenApiConnection);
           endif
           else (no)
            :Add_a_new_row (OpenApiConnection);
           endif
         endif
         else (no)
          :Solution_Not_Installed (Compose);
         endif
       endif
       repeat
        :if_soln_installed (If);
         if (condition) then (yes)
          :add (Compose);
          :See_if_mail_already_exists (OpenApiConnection);
          :Add_or_Update_Mail (If);
           if (condition) then (yes)
            :Update_a_row (OpenApiConnection);
           endif
           else (no)
            :Add_a_new_row (OpenApiConnection);
           endif
         endif
         else (no)
          :Solution_Not_Installed (Compose);
         endif
       repeat while (more items)
     endif
     partition "Update_Mails" {
      :Apply_to_each_Mail (Foreach);
       if (condition) then (yes)
        :if_soln_installed (If);
         if (condition) then (yes)
          :add (Compose);
          :See_if_mail_already_exists (OpenApiConnection);
          :Add_or_Update_Mail (If);
           if (condition) then (yes)
            :Update_a_row (OpenApiConnection);
           endif
           else (no)
            :Add_a_new_row (OpenApiConnection);
           endif
         endif
         else (no)
          :Solution_Not_Installed (Compose);
         endif
       endif
       repeat
        :if_soln_installed (If);
         if (condition) then (yes)
          :add (Compose);
          :See_if_mail_already_exists (OpenApiConnection);
          :Add_or_Update_Mail (If);
           if (condition) then (yes)
            :Update_a_row (OpenApiConnection);
           endif
           else (no)
            :Add_a_new_row (OpenApiConnection);
           endif
         endif
         else (no)
          :Solution_Not_Installed (Compose);
         endif
       repeat while (more items)
     }
    :Respond_to_a_PowerApp_or_flow__long_run (Response);
    :Get_Installed_Solutions (Scope);
     if (condition) then (yes)
      :List_rows (OpenApiConnection);
      :Filter_to_Core (Query);
      :hasCore (Compose);
      :Filter_to_Gov (Query);
      :Filter_to_IB (Query);
      :Filter_to_Nurture (Query);
      :Filter_to_Test_Soln (Query);
      :hasGov (Compose);
      :hasIB (Compose);
      :hasNurture (Compose);
      :hasTest (Compose);
     endif
     partition "Get_Installed_Solutions" {
      :List_rows (OpenApiConnection);
      :Filter_to_Core (Query);
      :hasCore (Compose);
      :Filter_to_Gov (Query);
      :Filter_to_IB (Query);
      :Filter_to_Nurture (Query);
      :Filter_to_Test_Soln (Query);
      :hasGov (Compose);
      :hasIB (Compose);
      :hasNurture (Compose);
      :hasTest (Compose);
     }
   endif
   else (no)
    :Respond_to_a_PowerApp_or_flow (Response);
    :reset_this_mail (Scope);
     if (condition) then (yes)
      :Filter_to_this_mail (Query);
      :Reset_this_mail_to_default (Foreach);
       if (condition) then (yes)
        :Get_mail_to_reset (OpenApiConnection);
        :Reset_Subject_and_or_Body (If);
         if (condition) then (yes)
          :Update_subject_or_body (OpenApiConnection);
         endif
         else (no)
          :something_went_wrong_add_it_instead (OpenApiConnection);
         endif
       endif
       repeat
        :Get_mail_to_reset (OpenApiConnection);
        :Reset_Subject_and_or_Body (If);
         if (condition) then (yes)
          :Update_subject_or_body (OpenApiConnection);
         endif
         else (no)
          :something_went_wrong_add_it_instead (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "reset_this_mail" {
      :Filter_to_this_mail (Query);
      :Reset_this_mail_to_default (Foreach);
       if (condition) then (yes)
        :Get_mail_to_reset (OpenApiConnection);
        :Reset_Subject_and_or_Body (If);
         if (condition) then (yes)
          :Update_subject_or_body (OpenApiConnection);
         endif
         else (no)
          :something_went_wrong_add_it_instead (OpenApiConnection);
         endif
       endif
       repeat
        :Get_mail_to_reset (OpenApiConnection);
        :Reset_Subject_and_or_Body (If);
         if (condition) then (yes)
          :Update_subject_or_body (OpenApiConnection);
         endif
         else (no)
          :something_went_wrong_add_it_instead (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Set_singleMailUpdatePassed_to_false (SetVariable);
   endif
 endif
 partition "Configure_All_or_One_Email" {
  :fake_all_solutions_installed (Compose);
  :Parse_JSON (ParseJson);
  :see_if_all_or_one_mail (If);
   if (condition) then (yes)
    :CleanUp_Deleted_Mails (Scope);
     if (condition) then (yes)
      :Get_past_time (Expression);
      :List_mails_not_updated_recently (OpenApiConnection);
      :Delete_mails_not_updated_recently (Foreach);
       if (condition) then (yes)
        :Delete_mail_not_updated_recently (OpenApiConnection);
       endif
       repeat
        :Delete_mail_not_updated_recently (OpenApiConnection);
       repeat while (more items)
     endif
     partition "CleanUp_Deleted_Mails" {
      :Get_past_time (Expression);
      :List_mails_not_updated_recently (OpenApiConnection);
      :Delete_mails_not_updated_recently (Foreach);
       if (condition) then (yes)
        :Delete_mail_not_updated_recently (OpenApiConnection);
       endif
       repeat
        :Delete_mail_not_updated_recently (OpenApiConnection);
       repeat while (more items)
     }
    :Update_Mails (Scope);
     if (condition) then (yes)
      :Apply_to_each_Mail (Foreach);
       if (condition) then (yes)
        :if_soln_installed (If);
         if (condition) then (yes)
          :add (Compose);
          :See_if_mail_already_exists (OpenApiConnection);
          :Add_or_Update_Mail (If);
           if (condition) then (yes)
            :Update_a_row (OpenApiConnection);
           endif
           else (no)
            :Add_a_new_row (OpenApiConnection);
           endif
         endif
         else (no)
          :Solution_Not_Installed (Compose);
         endif
       endif
       repeat
        :if_soln_installed (If);
         if (condition) then (yes)
          :add (Compose);
          :See_if_mail_already_exists (OpenApiConnection);
          :Add_or_Update_Mail (If);
           if (condition) then (yes)
            :Update_a_row (OpenApiConnection);
           endif
           else (no)
            :Add_a_new_row (OpenApiConnection);
           endif
         endif
         else (no)
          :Solution_Not_Installed (Compose);
         endif
       repeat while (more items)
     endif
     partition "Update_Mails" {
      :Apply_to_each_Mail (Foreach);
       if (condition) then (yes)
        :if_soln_installed (If);
         if (condition) then (yes)
          :add (Compose);
          :See_if_mail_already_exists (OpenApiConnection);
          :Add_or_Update_Mail (If);
           if (condition) then (yes)
            :Update_a_row (OpenApiConnection);
           endif
           else (no)
            :Add_a_new_row (OpenApiConnection);
           endif
         endif
         else (no)
          :Solution_Not_Installed (Compose);
         endif
       endif
       repeat
        :if_soln_installed (If);
         if (condition) then (yes)
          :add (Compose);
          :See_if_mail_already_exists (OpenApiConnection);
          :Add_or_Update_Mail (If);
           if (condition) then (yes)
            :Update_a_row (OpenApiConnection);
           endif
           else (no)
            :Add_a_new_row (OpenApiConnection);
           endif
         endif
         else (no)
          :Solution_Not_Installed (Compose);
         endif
       repeat while (more items)
     }
    :Respond_to_a_PowerApp_or_flow__long_run (Response);
    :Get_Installed_Solutions (Scope);
     if (condition) then (yes)
      :List_rows (OpenApiConnection);
      :Filter_to_Core (Query);
      :hasCore (Compose);
      :Filter_to_Gov (Query);
      :Filter_to_IB (Query);
      :Filter_to_Nurture (Query);
      :Filter_to_Test_Soln (Query);
      :hasGov (Compose);
      :hasIB (Compose);
      :hasNurture (Compose);
      :hasTest (Compose);
     endif
     partition "Get_Installed_Solutions" {
      :List_rows (OpenApiConnection);
      :Filter_to_Core (Query);
      :hasCore (Compose);
      :Filter_to_Gov (Query);
      :Filter_to_IB (Query);
      :Filter_to_Nurture (Query);
      :Filter_to_Test_Soln (Query);
      :hasGov (Compose);
      :hasIB (Compose);
      :hasNurture (Compose);
      :hasTest (Compose);
     }
   endif
   else (no)
    :Respond_to_a_PowerApp_or_flow (Response);
    :reset_this_mail (Scope);
     if (condition) then (yes)
      :Filter_to_this_mail (Query);
      :Reset_this_mail_to_default (Foreach);
       if (condition) then (yes)
        :Get_mail_to_reset (OpenApiConnection);
        :Reset_Subject_and_or_Body (If);
         if (condition) then (yes)
          :Update_subject_or_body (OpenApiConnection);
         endif
         else (no)
          :something_went_wrong_add_it_instead (OpenApiConnection);
         endif
       endif
       repeat
        :Get_mail_to_reset (OpenApiConnection);
        :Reset_Subject_and_or_Body (If);
         if (condition) then (yes)
          :Update_subject_or_body (OpenApiConnection);
         endif
         else (no)
          :something_went_wrong_add_it_instead (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "reset_this_mail" {
      :Filter_to_this_mail (Query);
      :Reset_this_mail_to_default (Foreach);
       if (condition) then (yes)
        :Get_mail_to_reset (OpenApiConnection);
        :Reset_Subject_and_or_Body (If);
         if (condition) then (yes)
          :Update_subject_or_body (OpenApiConnection);
         endif
         else (no)
          :something_went_wrong_add_it_instead (OpenApiConnection);
         endif
       endif
       repeat
        :Get_mail_to_reset (OpenApiConnection);
        :Reset_Subject_and_or_Body (If);
         if (condition) then (yes)
          :Update_subject_or_body (OpenApiConnection);
         endif
         else (no)
          :something_went_wrong_add_it_instead (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Set_singleMailUpdatePassed_to_false (SetVariable);
   endif
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |

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
| CoE_Mails | InitializeVariable | Operation ID: a5277620-f725-42a9-91e6-53a4473372ee |
| Initialize_singleMailUpdatePassed_to_true | InitializeVariable | Operation ID: cb1dffbb-7952-46b3-9458-7a93286d94aa |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Configure_All_or_One_Email | Scope | Operation ID: f40be2f3-7689-449a-ac9b-11493b42b432 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
