# Power Automate Flow: AdminAuditLogsSyncAuditLogsV2

**Generated on:** 2025-07-15 19:14:46
**Flow ID:** 6045BD039C1F
**Source File:** AdminAuditLogsSyncAuditLogsV2-BCCF2957-AE51-EF11-A316-6045BD039C1F.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminAuditLogsSyncAuditLogsV2
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
- **Connections:** 3
- **Parameters:** 8

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminAuditLogsSyncAuditLogsV2

start
:Trigger: Recurrence (Recurrence);\n:Initialize_appID (InitializeVariable);
:Initialize_theTextSecret (InitializeVariable);
:Initialize_Secret_AzureType_to_true (InitializeVariable);
:Get_Logs (Scope);
 if (condition) then (yes)
  :Get_env_var_for_AppID (Scope);
   if (condition) then (yes)
    :ListDefnsAppID (OpenApiConnection);
    :Get_ID_from_AppID (Compose);
    :Set_to_current_or_default__AppID (If);
     if (condition) then (yes)
      :Set_AppID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AppID__DefaultValue (SetVariable);
     endif
    :ListCurrentsAppID (OpenApiConnection);
   endif
   partition "Get_env_var_for_AppID" {
    :ListDefnsAppID (OpenApiConnection);
    :Get_ID_from_AppID (Compose);
    :Set_to_current_or_default__AppID (If);
     if (condition) then (yes)
      :Set_AppID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AppID__DefaultValue (SetVariable);
     endif
    :ListCurrentsAppID (OpenApiConnection);
   }
  :Get_env_var_for_for_text_Secret (Scope);
   if (condition) then (yes)
    :ListDefnsTextSecret (OpenApiConnection);
    :Get_ID_from_text_secret (Compose);
    :Set_to_current_or_default__TextSecret (If);
     if (condition) then (yes)
      :Set_theTextSecret__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_theTextSecret__DefaultValue (SetVariable);
     endif
    :ListCurrentsTextSecret (OpenApiConnection);
   endif
   partition "Get_env_var_for_for_text_Secret" {
    :ListDefnsTextSecret (OpenApiConnection);
    :Get_ID_from_text_secret (Compose);
    :Set_to_current_or_default__TextSecret (If);
     if (condition) then (yes)
      :Set_theTextSecret__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_theTextSecret__DefaultValue (SetVariable);
     endif
    :ListCurrentsTextSecret (OpenApiConnection);
   }
  :Get_env_var_for_for_Azure_Secret (Scope);
   if (condition) then (yes)
    :Get_Azure_Secret (OpenApiConnection);
    :Set_Secret_AzureType_to_false_if_failed (SetVariable);
   endif
   partition "Get_env_var_for_for_Azure_Secret" {
    :Get_Azure_Secret (OpenApiConnection);
    :Set_Secret_AzureType_to_false_if_failed (SetVariable);
   }
  :UseGraphAPI (If);
   if (condition) then (yes)
    :ScopeAuditLogQuery (Scope);
     if (condition) then (yes)
      :ResetHttpCallFailed_2 (SetVariable);
      :RetryLogicStartAuditLogQuery (Until);
       if (condition) then (yes)
        :AuditLogQuery (Http);
        :AuditLogQueryFAILED (Scope);
         if (condition) then (yes)
          :Delay_2 (Wait);
          :SetHttpCallFailedTRUE_2 (SetVariable);
         endif
         partition "AuditLogQueryFAILED" {
          :Delay_2 (Wait);
          :SetHttpCallFailedTRUE_2 (SetVariable);
         }
        :SetHttpCallFailedFALSE_2 (SetVariable);
       endif
      :DidAllListAuditLogContentCallsFailed_2 (If);
       if (condition) then (yes)
        :Increment_variable_2 (IncrementVariable);
       endif
       else (no)
        :ParseBody_2 (ParseJson);
        :SetAuditLogQueryID (SetVariable);
        :WaitUntilQueryFinished (Until);
         if (condition) then (yes)
          :AuditLogQueryStatus (Http);
          :ParseBodyQueryStatus (ParseJson);
          :WaitBeforeCheckingStatusAgain (Wait);
         endif
        :QueryWaitTimeExceeded (Terminate);
        :SetInitialAuditLogQueryRecordsURL (SetVariable);
       endif
     endif
     partition "ScopeAuditLogQuery" {
      :ResetHttpCallFailed_2 (SetVariable);
      :RetryLogicStartAuditLogQuery (Until);
       if (condition) then (yes)
        :AuditLogQuery (Http);
        :AuditLogQueryFAILED (Scope);
         if (condition) then (yes)
          :Delay_2 (Wait);
          :SetHttpCallFailedTRUE_2 (SetVariable);
         endif
         partition "AuditLogQueryFAILED" {
          :Delay_2 (Wait);
          :SetHttpCallFailedTRUE_2 (SetVariable);
         }
        :SetHttpCallFailedFALSE_2 (SetVariable);
       endif
      :DidAllListAuditLogContentCallsFailed_2 (If);
       if (condition) then (yes)
        :Increment_variable_2 (IncrementVariable);
       endif
       else (no)
        :ParseBody_2 (ParseJson);
        :SetAuditLogQueryID (SetVariable);
        :WaitUntilQueryFinished (Until);
         if (condition) then (yes)
          :AuditLogQueryStatus (Http);
          :ParseBodyQueryStatus (ParseJson);
          :WaitBeforeCheckingStatusAgain (Wait);
         endif
        :QueryWaitTimeExceeded (Terminate);
        :SetInitialAuditLogQueryRecordsURL (SetVariable);
       endif
     }
    :ScopeAuditLogRecords (Scope);
     if (condition) then (yes)
      :ProcessAuditLogRecords (Until);
       if (condition) then (yes)
        :RetryLogicAuditLogRecords (Until);
         if (condition) then (yes)
          :AuditLogRecords (Http);
          :AuditLogRecordsFAILED (Scope);
           if (condition) then (yes)
            :AuditLogRecordsWait (Wait);
            :SetHttpCallFailedTRUE2_2 (SetVariable);
           endif
           partition "AuditLogRecordsFAILED" {
            :AuditLogRecordsWait (Wait);
            :SetHttpCallFailedTRUE2_2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2_2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed_2 (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount_2 (IncrementVariable);
         endif
         else (no)
          :ApplyEvents (Foreach);
           if (condition) then (yes)
            :Filter_to_find_AppID_Graph (Query);
            :AppIdFound_Graph (Compose);
            :Switch_2 (Switch);
           endif
           repeat
            :Filter_to_find_AppID_Graph (Query);
            :AppIdFound_Graph (Compose);
            :Switch_2 (Switch);
           repeat while (more items)
          :SetAuditLogQueryRecordsURL (SetVariable);
          :ParseBodyAuditLogRecords (ParseJson);
          :Filter_to_current_schema (Query);
         endif
       endif
     endif
     partition "ScopeAuditLogRecords" {
      :ProcessAuditLogRecords (Until);
       if (condition) then (yes)
        :RetryLogicAuditLogRecords (Until);
         if (condition) then (yes)
          :AuditLogRecords (Http);
          :AuditLogRecordsFAILED (Scope);
           if (condition) then (yes)
            :AuditLogRecordsWait (Wait);
            :SetHttpCallFailedTRUE2_2 (SetVariable);
           endif
           partition "AuditLogRecordsFAILED" {
            :AuditLogRecordsWait (Wait);
            :SetHttpCallFailedTRUE2_2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2_2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed_2 (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount_2 (IncrementVariable);
         endif
         else (no)
          :ApplyEvents (Foreach);
           if (condition) then (yes)
            :Filter_to_find_AppID_Graph (Query);
            :AppIdFound_Graph (Compose);
            :Switch_2 (Switch);
           endif
           repeat
            :Filter_to_find_AppID_Graph (Query);
            :AppIdFound_Graph (Compose);
            :Switch_2 (Switch);
           repeat while (more items)
          :SetAuditLogQueryRecordsURL (SetVariable);
          :ParseBodyAuditLogRecords (ParseJson);
          :Filter_to_current_schema (Query);
         endif
       endif
     }
   endif
   else (no)
    :BuildContentSlotArray (Until);
     if (condition) then (yes)
      :ResetHttpCallFailed (SetVariable);
      :RetryLogicListAuditLogContent (Until);
       if (condition) then (yes)
        :ListAuditLogContent (Http);
        :ListAuditLogContentCallFAILED (Scope);
         if (condition) then (yes)
          :Delay (Wait);
          :SetHttpCallFailedTRUE (SetVariable);
         endif
         partition "ListAuditLogContentCallFAILED" {
          :Delay (Wait);
          :SetHttpCallFailedTRUE (SetVariable);
         }
        :SetHttpCallFailedFALSE (SetVariable);
       endif
      :DidAllListAuditLogContentCallsFailed (If);
       if (condition) then (yes)
        :Increment_variable (IncrementVariable);
       endif
       else (no)
        :ParseHeader (ParseJson);
        :ParseBody (ParseJson);
        :SelectContentIDs (Select);
        :AppendContentIDsArray (AppendToArrayVariable);
        :DoesNextPageUriExist (If);
         if (condition) then (yes)
          :SetNextPageURI (SetVariable);
          :QueryString (Compose);
          :SetNextPageParamValue (SetVariable);
         endif
         else (no)
          :SetNextPageURINULL (SetVariable);
         endif
       endif
     endif
    :LoopContentIDs (Foreach);
     if (condition) then (yes)
      :ConvertStringToArray (Compose);
      :ParseContentIDs (ParseJson);
      :GetAndProcessEvents (Foreach);
       if (condition) then (yes)
        :ResetHttpCallFailed2 (SetVariable);
        :RetryLogicGetContentDetails (Until);
         if (condition) then (yes)
          :GetContentDetails (Http);
          :GetContentDetailsCallFAILED (Scope);
           if (condition) then (yes)
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           endif
           partition "GetContentDetailsCallFAILED" {
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount (IncrementVariable);
         endif
         else (no)
          :ParseEvents (ParseJson);
          :FilterEvents (Query);
          :Apply_to_each_Audit_Log (Foreach);
           if (condition) then (yes)
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           endif
           repeat
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           repeat while (more items)
         endif
       endif
       repeat
        :ResetHttpCallFailed2 (SetVariable);
        :RetryLogicGetContentDetails (Until);
         if (condition) then (yes)
          :GetContentDetails (Http);
          :GetContentDetailsCallFAILED (Scope);
           if (condition) then (yes)
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           endif
           partition "GetContentDetailsCallFAILED" {
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount (IncrementVariable);
         endif
         else (no)
          :ParseEvents (ParseJson);
          :FilterEvents (Query);
          :Apply_to_each_Audit_Log (Foreach);
           if (condition) then (yes)
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           endif
           repeat
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           repeat while (more items)
         endif
       repeat while (more items)
     endif
     repeat
      :ConvertStringToArray (Compose);
      :ParseContentIDs (ParseJson);
      :GetAndProcessEvents (Foreach);
       if (condition) then (yes)
        :ResetHttpCallFailed2 (SetVariable);
        :RetryLogicGetContentDetails (Until);
         if (condition) then (yes)
          :GetContentDetails (Http);
          :GetContentDetailsCallFAILED (Scope);
           if (condition) then (yes)
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           endif
           partition "GetContentDetailsCallFAILED" {
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount (IncrementVariable);
         endif
         else (no)
          :ParseEvents (ParseJson);
          :FilterEvents (Query);
          :Apply_to_each_Audit_Log (Foreach);
           if (condition) then (yes)
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           endif
           repeat
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           repeat while (more items)
         endif
       endif
       repeat
        :ResetHttpCallFailed2 (SetVariable);
        :RetryLogicGetContentDetails (Until);
         if (condition) then (yes)
          :GetContentDetails (Http);
          :GetContentDetailsCallFAILED (Scope);
           if (condition) then (yes)
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           endif
           partition "GetContentDetailsCallFAILED" {
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount (IncrementVariable);
         endif
         else (no)
          :ParseEvents (ParseJson);
          :FilterEvents (Query);
          :Apply_to_each_Audit_Log (Foreach);
           if (condition) then (yes)
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           endif
           repeat
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           repeat while (more items)
         endif
       repeat while (more items)
     repeat while (more items)
   endif
 endif
 partition "Get_Logs" {
  :Get_env_var_for_AppID (Scope);
   if (condition) then (yes)
    :ListDefnsAppID (OpenApiConnection);
    :Get_ID_from_AppID (Compose);
    :Set_to_current_or_default__AppID (If);
     if (condition) then (yes)
      :Set_AppID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AppID__DefaultValue (SetVariable);
     endif
    :ListCurrentsAppID (OpenApiConnection);
   endif
   partition "Get_env_var_for_AppID" {
    :ListDefnsAppID (OpenApiConnection);
    :Get_ID_from_AppID (Compose);
    :Set_to_current_or_default__AppID (If);
     if (condition) then (yes)
      :Set_AppID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AppID__DefaultValue (SetVariable);
     endif
    :ListCurrentsAppID (OpenApiConnection);
   }
  :Get_env_var_for_for_text_Secret (Scope);
   if (condition) then (yes)
    :ListDefnsTextSecret (OpenApiConnection);
    :Get_ID_from_text_secret (Compose);
    :Set_to_current_or_default__TextSecret (If);
     if (condition) then (yes)
      :Set_theTextSecret__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_theTextSecret__DefaultValue (SetVariable);
     endif
    :ListCurrentsTextSecret (OpenApiConnection);
   endif
   partition "Get_env_var_for_for_text_Secret" {
    :ListDefnsTextSecret (OpenApiConnection);
    :Get_ID_from_text_secret (Compose);
    :Set_to_current_or_default__TextSecret (If);
     if (condition) then (yes)
      :Set_theTextSecret__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_theTextSecret__DefaultValue (SetVariable);
     endif
    :ListCurrentsTextSecret (OpenApiConnection);
   }
  :Get_env_var_for_for_Azure_Secret (Scope);
   if (condition) then (yes)
    :Get_Azure_Secret (OpenApiConnection);
    :Set_Secret_AzureType_to_false_if_failed (SetVariable);
   endif
   partition "Get_env_var_for_for_Azure_Secret" {
    :Get_Azure_Secret (OpenApiConnection);
    :Set_Secret_AzureType_to_false_if_failed (SetVariable);
   }
  :UseGraphAPI (If);
   if (condition) then (yes)
    :ScopeAuditLogQuery (Scope);
     if (condition) then (yes)
      :ResetHttpCallFailed_2 (SetVariable);
      :RetryLogicStartAuditLogQuery (Until);
       if (condition) then (yes)
        :AuditLogQuery (Http);
        :AuditLogQueryFAILED (Scope);
         if (condition) then (yes)
          :Delay_2 (Wait);
          :SetHttpCallFailedTRUE_2 (SetVariable);
         endif
         partition "AuditLogQueryFAILED" {
          :Delay_2 (Wait);
          :SetHttpCallFailedTRUE_2 (SetVariable);
         }
        :SetHttpCallFailedFALSE_2 (SetVariable);
       endif
      :DidAllListAuditLogContentCallsFailed_2 (If);
       if (condition) then (yes)
        :Increment_variable_2 (IncrementVariable);
       endif
       else (no)
        :ParseBody_2 (ParseJson);
        :SetAuditLogQueryID (SetVariable);
        :WaitUntilQueryFinished (Until);
         if (condition) then (yes)
          :AuditLogQueryStatus (Http);
          :ParseBodyQueryStatus (ParseJson);
          :WaitBeforeCheckingStatusAgain (Wait);
         endif
        :QueryWaitTimeExceeded (Terminate);
        :SetInitialAuditLogQueryRecordsURL (SetVariable);
       endif
     endif
     partition "ScopeAuditLogQuery" {
      :ResetHttpCallFailed_2 (SetVariable);
      :RetryLogicStartAuditLogQuery (Until);
       if (condition) then (yes)
        :AuditLogQuery (Http);
        :AuditLogQueryFAILED (Scope);
         if (condition) then (yes)
          :Delay_2 (Wait);
          :SetHttpCallFailedTRUE_2 (SetVariable);
         endif
         partition "AuditLogQueryFAILED" {
          :Delay_2 (Wait);
          :SetHttpCallFailedTRUE_2 (SetVariable);
         }
        :SetHttpCallFailedFALSE_2 (SetVariable);
       endif
      :DidAllListAuditLogContentCallsFailed_2 (If);
       if (condition) then (yes)
        :Increment_variable_2 (IncrementVariable);
       endif
       else (no)
        :ParseBody_2 (ParseJson);
        :SetAuditLogQueryID (SetVariable);
        :WaitUntilQueryFinished (Until);
         if (condition) then (yes)
          :AuditLogQueryStatus (Http);
          :ParseBodyQueryStatus (ParseJson);
          :WaitBeforeCheckingStatusAgain (Wait);
         endif
        :QueryWaitTimeExceeded (Terminate);
        :SetInitialAuditLogQueryRecordsURL (SetVariable);
       endif
     }
    :ScopeAuditLogRecords (Scope);
     if (condition) then (yes)
      :ProcessAuditLogRecords (Until);
       if (condition) then (yes)
        :RetryLogicAuditLogRecords (Until);
         if (condition) then (yes)
          :AuditLogRecords (Http);
          :AuditLogRecordsFAILED (Scope);
           if (condition) then (yes)
            :AuditLogRecordsWait (Wait);
            :SetHttpCallFailedTRUE2_2 (SetVariable);
           endif
           partition "AuditLogRecordsFAILED" {
            :AuditLogRecordsWait (Wait);
            :SetHttpCallFailedTRUE2_2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2_2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed_2 (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount_2 (IncrementVariable);
         endif
         else (no)
          :ApplyEvents (Foreach);
           if (condition) then (yes)
            :Filter_to_find_AppID_Graph (Query);
            :AppIdFound_Graph (Compose);
            :Switch_2 (Switch);
           endif
           repeat
            :Filter_to_find_AppID_Graph (Query);
            :AppIdFound_Graph (Compose);
            :Switch_2 (Switch);
           repeat while (more items)
          :SetAuditLogQueryRecordsURL (SetVariable);
          :ParseBodyAuditLogRecords (ParseJson);
          :Filter_to_current_schema (Query);
         endif
       endif
     endif
     partition "ScopeAuditLogRecords" {
      :ProcessAuditLogRecords (Until);
       if (condition) then (yes)
        :RetryLogicAuditLogRecords (Until);
         if (condition) then (yes)
          :AuditLogRecords (Http);
          :AuditLogRecordsFAILED (Scope);
           if (condition) then (yes)
            :AuditLogRecordsWait (Wait);
            :SetHttpCallFailedTRUE2_2 (SetVariable);
           endif
           partition "AuditLogRecordsFAILED" {
            :AuditLogRecordsWait (Wait);
            :SetHttpCallFailedTRUE2_2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2_2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed_2 (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount_2 (IncrementVariable);
         endif
         else (no)
          :ApplyEvents (Foreach);
           if (condition) then (yes)
            :Filter_to_find_AppID_Graph (Query);
            :AppIdFound_Graph (Compose);
            :Switch_2 (Switch);
           endif
           repeat
            :Filter_to_find_AppID_Graph (Query);
            :AppIdFound_Graph (Compose);
            :Switch_2 (Switch);
           repeat while (more items)
          :SetAuditLogQueryRecordsURL (SetVariable);
          :ParseBodyAuditLogRecords (ParseJson);
          :Filter_to_current_schema (Query);
         endif
       endif
     }
   endif
   else (no)
    :BuildContentSlotArray (Until);
     if (condition) then (yes)
      :ResetHttpCallFailed (SetVariable);
      :RetryLogicListAuditLogContent (Until);
       if (condition) then (yes)
        :ListAuditLogContent (Http);
        :ListAuditLogContentCallFAILED (Scope);
         if (condition) then (yes)
          :Delay (Wait);
          :SetHttpCallFailedTRUE (SetVariable);
         endif
         partition "ListAuditLogContentCallFAILED" {
          :Delay (Wait);
          :SetHttpCallFailedTRUE (SetVariable);
         }
        :SetHttpCallFailedFALSE (SetVariable);
       endif
      :DidAllListAuditLogContentCallsFailed (If);
       if (condition) then (yes)
        :Increment_variable (IncrementVariable);
       endif
       else (no)
        :ParseHeader (ParseJson);
        :ParseBody (ParseJson);
        :SelectContentIDs (Select);
        :AppendContentIDsArray (AppendToArrayVariable);
        :DoesNextPageUriExist (If);
         if (condition) then (yes)
          :SetNextPageURI (SetVariable);
          :QueryString (Compose);
          :SetNextPageParamValue (SetVariable);
         endif
         else (no)
          :SetNextPageURINULL (SetVariable);
         endif
       endif
     endif
    :LoopContentIDs (Foreach);
     if (condition) then (yes)
      :ConvertStringToArray (Compose);
      :ParseContentIDs (ParseJson);
      :GetAndProcessEvents (Foreach);
       if (condition) then (yes)
        :ResetHttpCallFailed2 (SetVariable);
        :RetryLogicGetContentDetails (Until);
         if (condition) then (yes)
          :GetContentDetails (Http);
          :GetContentDetailsCallFAILED (Scope);
           if (condition) then (yes)
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           endif
           partition "GetContentDetailsCallFAILED" {
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount (IncrementVariable);
         endif
         else (no)
          :ParseEvents (ParseJson);
          :FilterEvents (Query);
          :Apply_to_each_Audit_Log (Foreach);
           if (condition) then (yes)
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           endif
           repeat
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           repeat while (more items)
         endif
       endif
       repeat
        :ResetHttpCallFailed2 (SetVariable);
        :RetryLogicGetContentDetails (Until);
         if (condition) then (yes)
          :GetContentDetails (Http);
          :GetContentDetailsCallFAILED (Scope);
           if (condition) then (yes)
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           endif
           partition "GetContentDetailsCallFAILED" {
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount (IncrementVariable);
         endif
         else (no)
          :ParseEvents (ParseJson);
          :FilterEvents (Query);
          :Apply_to_each_Audit_Log (Foreach);
           if (condition) then (yes)
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           endif
           repeat
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           repeat while (more items)
         endif
       repeat while (more items)
     endif
     repeat
      :ConvertStringToArray (Compose);
      :ParseContentIDs (ParseJson);
      :GetAndProcessEvents (Foreach);
       if (condition) then (yes)
        :ResetHttpCallFailed2 (SetVariable);
        :RetryLogicGetContentDetails (Until);
         if (condition) then (yes)
          :GetContentDetails (Http);
          :GetContentDetailsCallFAILED (Scope);
           if (condition) then (yes)
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           endif
           partition "GetContentDetailsCallFAILED" {
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount (IncrementVariable);
         endif
         else (no)
          :ParseEvents (ParseJson);
          :FilterEvents (Query);
          :Apply_to_each_Audit_Log (Foreach);
           if (condition) then (yes)
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           endif
           repeat
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           repeat while (more items)
         endif
       endif
       repeat
        :ResetHttpCallFailed2 (SetVariable);
        :RetryLogicGetContentDetails (Until);
         if (condition) then (yes)
          :GetContentDetails (Http);
          :GetContentDetailsCallFAILED (Scope);
           if (condition) then (yes)
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           endif
           partition "GetContentDetailsCallFAILED" {
            :Delay2 (Wait);
            :SetHttpCallFailedTRUE2 (SetVariable);
           }
          :SetHttpCallFailedFALSE2 (SetVariable);
         endif
        :DidAllGetContentDetailsCallsFailed (If);
         if (condition) then (yes)
          :IncrementHttpCallFailureCount (IncrementVariable);
         endif
         else (no)
          :ParseEvents (ParseJson);
          :FilterEvents (Query);
          :Apply_to_each_Audit_Log (Foreach);
           if (condition) then (yes)
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           endif
           repeat
            :Switch (Switch);
            :Filter_to_find_AppID (Query);
            :AppIdFound (Compose);
           repeat while (more items)
         endif
       repeat while (more items)
     repeat while (more items)
   endif
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
:NextPageUri (InitializeVariable);
:NextPageParamValue (InitializeVariable);
:ContentIDs (InitializeVariable);
:startTime_variable (InitializeVariable);
:endTime_variable_ (InitializeVariable);
:emailGUID (InitializeVariable);
:httpCallFailed (InitializeVariable);
:httpCallFailureCount (InitializeVariable);
:Update_last_run_as_pass_OR_handle_HTTP_call_errors (Scope);
 if (condition) then (yes)
  :AnyHttpCallFailures (If);
   if (condition) then (yes)
    :Create_a_new_record__Sync_Flow_Errors_2 (OpenApiConnection);
    :Get_ID_Fail_2 (OpenApiConnection);
    :Update_Last_Run_Fail_2 (OpenApiConnection);
    :Terminate_2 (Terminate);
   endif
   else (no)
    :Get_ID_Pass (OpenApiConnection);
    :Update_Last_Run_Successful (OpenApiConnection);
    :Catch__not_ready_to_take_last_run_date (Compose);
   endif
 endif
 partition "Update_last_run_as_pass_OR_handle_HTTP_call_errors" {
  :AnyHttpCallFailures (If);
   if (condition) then (yes)
    :Create_a_new_record__Sync_Flow_Errors_2 (OpenApiConnection);
    :Get_ID_Fail_2 (OpenApiConnection);
    :Update_Last_Run_Fail_2 (OpenApiConnection);
    :Terminate_2 (Terminate);
   endif
   else (no)
    :Get_ID_Pass (OpenApiConnection);
    :Update_Last_Run_Successful (OpenApiConnection);
    :Catch__not_ready_to_take_last_run_date (Compose);
   endif
 }
:AuditLogQueryID (InitializeVariable);
:AuditLogQueryRecordsURL (InitializeVariable);
:minutes_back (Compose);
:start_time_minutes_back (Compose);
:end_time_minutes_back (Compose);
:Compose (Compose);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseForApps | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| TenantID (admin_TenantID) | String | 67c96cd6-4a95-46ee-ac9b-8ee13ae256c4 | Inventory - REQUIRED. Azure Tenant ID |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Audit Logs - Audience (admin_AuditLogsAudience) | String | https://manage.office.com | AuditLogs - The audience for the HTTP connector. Set by Setup wizard based on tenant type |
| Audit Logs - Authority (admin_AuditLogsAuthority) | String | https://login.windows.net | AuditLogs - The authority for the HTTP connector. Set by Setup wizard based on tenant type |
| Audit Logs - Use Graph API (admin_AuditLogsUseGraphAPI) | Bool | - | If true, uses the AuditLogQuery api in Graph to gather audit logs. If false (default), continues to use the old Office 365 Management API to gather them. Default due to legacy behavior but its not the preferred technique due to lack of backend filtering. |
| Graph URL Environment Variable (admin_GraphURLEnvironmentVariable) | String | https://graph.microsoft.com/ | Inventory - REQUIRED. The URL used to get graph information for your cloud. Ex https://graph.microsoft.com/ |
| Audit Logs - Minutes to Look Back (admin_AuditLogsMinutestoLookBack) | Int | 65 | Number of minutes back to pull audit logs, default 65 will get one hour of data. |
| Audit Logs - End Time Minutes Ago (admin_AuditLogsEndTimeMinutesAgo) | Int | - | How far back in time to start looking for audit log records in number of minutes. The flow will start here and go back 65 minutes (configurable) to get logs from that period. Default 0 means that you will look for data points from this most recent hour. This gets you the most recent data but may miss logs as data can take up to 48 hours to fill in the the product logs. Value of 2820 gets you data from 48 hours ago, so your data will never be current but will always be complete |

## Triggers

### Recurrence
- **Type:** Recurrence
- **Recurrence:** Frequency: Hour, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_appID | InitializeVariable | Operation ID: 4fb2b304-6d7c-407e-a2c1-782ba52b4567 |
| Initialize_theTextSecret | InitializeVariable | Operation ID: 8b1e1654-f936-473c-95f8-fcd9869e2f72 |
| Initialize_Secret_AzureType_to_true | InitializeVariable | Operation ID: 4fb2b304-6d7c-407e-a2c1-782ba52b4567 |
| Get_Logs | Scope | Operation ID: 5b2dd07e-a81a-4782-aa0d-3670573c5eed |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| NextPageUri | InitializeVariable | Operation ID: 97b3b8ca-3592-48bd-86e4-0579886a9c93 |
| NextPageParamValue | InitializeVariable | Operation ID: 0c9e3b9e-1a9a-4241-8901-8ea91e9e05b1 |
| ContentIDs | InitializeVariable | Operation ID: c15216d4-4308-4e0c-9391-b03aaa088571 |
| startTime_variable | InitializeVariable | Operation ID: 8d2f458b-5680-4af9-9a99-6f4b895fb2e0 |
| endTime_variable_ | InitializeVariable | Operation ID: 6f63706f-8ddd-4ce2-85d4-0dc7ba17b82d |
| emailGUID | InitializeVariable | Operation ID: dad8eca6-7937-47c0-aa57-f2d48dd1c5a2 |
| httpCallFailed | InitializeVariable | Operation ID: 82ad2af7-99f4-4ee4-8d72-d2771da42f7d |
| httpCallFailureCount | InitializeVariable | Operation ID: 6b3a00fe-23a7-42d3-8a15-211fddbe9387 |
| Update_last_run_as_pass_OR_handle_HTTP_call_errors | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| AuditLogQueryID | InitializeVariable | Operation ID: 4d160935-72bc-47ce-8946-bca03a519c8d |
| AuditLogQueryRecordsURL | InitializeVariable | Operation ID: 97b3b8ca-3592-48bd-86e4-0579886a9c93 |
| minutes_back | Compose | Operation ID: a66d52c8-2d2b-4306-a84a-a46bacf6af08 |
| start_time_minutes_back | Compose | Operation ID: cb726b6d-9e7f-4ec8-acfa-b7143a82da11 |
| end_time_minutes_back | Compose | Operation ID: a358ba94-9e4f-472b-9afd-070d57261bf9 |
| Compose | Compose | Operation ID: a2c6ca40-ae7f-40f3-9c08-b118ca2d68d8 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
