; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Simple MP3 recorder
AppVerName=Simple MP3 recorder 0.5
AppPublisher=Petri Savolainen
AppPublisherURL=http://www.iki.fi/petri.savolainen
AppSupportURL=http://www.iki.fi/petri.savolainen
AppUpdatesURL=http://www.iki.fi/petri.savolainen
DefaultDirName={pf}\Simple MP3 Recorder
DefaultGroupName=Simple MP3 Recorder
AllowNoIcons=true
LicenseFile=E:\Documents and Settings\Administrator\My Documents\mp3recorder\license.txt
InfoAfterFile=E:\Documents and Settings\Administrator\My Documents\mp3recorder\README.htm
Compression=lzma
SolidCompression=true
ShowTasksTreeLines=true
ShowLanguageDialog=yes
MinVersion=4.1.2222,5.0.2195

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: dist\app.exe; DestDir: {app}; Flags: ignoreversion
Source: E:\Documents and Settings\Administrator\My Documents\mp3recorder\dist\*; DestDir: {app}; Flags: ignoreversion recursesubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[INI]
Filename: {app}\wxRecorder.url; Section: InternetShortcut; Key: URL; String: http://www.iki.fi/petri.savolainen

[Icons]
Name: {group}\My Program; Filename: {app}\app.exe
Name: {group}\{cm:ProgramOnTheWeb,My Program}; Filename: {app}\wxRecorder.url
Name: {group}\{cm:UninstallProgram,My Program}; Filename: {uninstallexe}
Name: {userdesktop}\My Program; Filename: {app}\app.exe; Tasks: desktopicon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\My Program; Filename: {app}\app.exe; Tasks: quicklaunchicon

[Run]
Filename: {app}\app.exe; Description: {cm:LaunchProgram,My Program}; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: {app}\wxRecorder.url