# Power Automate Flow: HELPER-SendEmail

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 00224829720B
**Source File:** HELPER-SendEmail-5625768C-BD3D-EC11-8C63-00224829720B.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** HELPER-SendEmail
- **Triggers:** 1
- **Actions:** 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 4

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: HELPER-SendEmail

start
:Trigger: manual (Request);\n:Send_an_email_V2 (OpenApiConnection);
:Initialize_returnVariable_to_pass (InitializeVariable);
:Set_returnVariable_to_fail (SetVariable);
:Respond_to_a_PowerApp_or_flow (Response);
:update_with_pass_or_fail (If);
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

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_office365 | shared_office365 | admin_CoECoreO365Outlook | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| eMail Body Start (admin_eMailBodyStart) | String | <body>     <div id='content'>         <table id='form'>             <tr>                 <td><img id='logo' src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Microsoft_logo_%282012%29.svg/1280px-Microsoft_logo_%282012%29.svg.png' width='300'></td>             </tr>             <tr>                 <td>                     <p id='header'>Power Platform</p>                 </td>             </tr>             <tr id='ribbon'>                 <td>                     <tr>                         <td></td>                     </tr>                     <tr id='message'>                         <td> | Inventory - Starter HTML format for eMails |
| eMail Body Stop (admin_eMailBodyStop) | String | </td>                     </tr>         </table>     </div> </body> | Inventory - Ending HTML format for eMails |
| eMail Header Style (admin_eMailHeaderStyle) | String | <head>     <style>         body {             background-color: #efefef;             font-family: Segoe UI;             text-align: center;         }          #content {             border: 1px solid #742774;             background-color: #ffffff;             width: 650px;             margin-bottom: 50px;             display: inline-block;         }          #logo {             margin-left: 52px;             margin-top: 40px;             width: 60px;             height: 12px;         }          #header {             font-size: 24px;             margin-left: 50px;             margin-top: 20px;             margin-bottom: 20px;         }          #ribbon {             background-color: #742774;         }          #ribbonContent {             font-size: 20px;             padding-left: 30px;             padding-top: 10px;             padding-bottom: 20px;             color: white;             width: 100%;             padding-right: 10px;         }          #message>td {             font-size: 14px;             padding-left: 60px;             padding-right: 60px;             padding-top: 20px;             padding-bottom: 40px;         }          #footer>td {             font-size: 12px;             background-color: #cfcfcf;             height: 40px;             padding-top: 15px;             padding-left: 40px;             padding-bottom: 20px;         }          #form {             width: 100%;             border-collapse: collapse;         }          #app {             width: 60%;             font-size: 12px;         }          .label {             color: #5f5f5f         }          table {             border-collapse: collapse;             width: 100%;         }          th,         td {             padding: 8px;             text-align: left;             border-bottom: 1px solid #ddd;         }     </style> </head> | Inventory - CSS/Style used for eMails |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Send_an_email_(V2) | OpenApiConnection | Operation ID: 8c6f9e3d-94be-4b06-8d5f-6722cb9d9da2 |
| Initialize_returnVariable_to_pass | InitializeVariable | Operation ID: 07fc9250-8f54-4dc6-9fde-f18fafbbef34 |
| Set_returnVariable_to_fail | SetVariable | Operation ID: 1b5fed02-be82-4be9-a978-9ad510e2165f |
| Respond_to_a_PowerApp_or_flow | Response | Operation ID: 05a27ea2-9c22-436e-9d84-1e5f21c60730 |
| update_with_pass_or_fail | If | Operation ID: 7f748c4a-7a00-401c-998d-9ed6734f521c |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
