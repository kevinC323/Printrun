; LocalAppdata\Printrun\Printrun\
[Setup]
AppName = Fablicator Interface
AppVersion = 2.0
DefaultDirName = {sd}\Fablicator\Fablicator
DefaultGroupName = Fablicator
ChangesAssociations = yes
CloseApplications = yes

[Types]
Name: "main"; Description: "Select printer type"; Flags: iscustom

[Components]
Name: "required"; Description: "Required files"; Types: main; Flags: fixed
Name: "cfg"; Description: "Configuration"; Types: main
Name: "cfg/mx"; Description: "MX"; Types: main; Flags: exclusive
Name: "cfg/sx"; Description: "SX"; Types: main; Flags: exclusive
Name: "cfg/fm1"; Description: "FM1"; Types: main; Flags: exclusive

[Tasks]
Name: desktopicon; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"
Name: associate; Description: "&Associate .gcode files"; GroupDescription: "Other tasks:"

[Files]
Source: "fablicator.exe"; DestDir: "{app}"; Components: required
Source: "Documentation\*"; DestDir: "{app}\Documentation"; Components: required
Source: "Configs\mx\printrunconf.ini"; DestDir: "{localappdata}\Printrun\Printrun"; Components: cfg\mx
Source: "Configs\sx\printrunconf.ini"; DestDir: "{localappdata}\Printrun\Printrun"; Components: cfg\sx
Source: "Configs\fm1\printrunconf.ini"; DestDir: "{localappdata}\Printrun\Printrun"; Components: cfg\fm1

[Registry]
Root: HKA; Subkey: "Software\Classes\.gcode"; ValueType: string; ValueName: ""; ValueData: "GcodeFile.gcode"; Flags: uninsdeletevalue; Tasks: associate
Root: HKA; Subkey: "Software\Classes\.gcode\OpenWithProgids"; ValueType: string; ValueName: "GcodeFile.gcode"; ValueData: ""; Flags: uninsdeletevalue; Tasks: associate
Root: HKA; Subkey: "Software\Classes\GcodeFile.gcode"; ValueType: string; ValueName: ""; ValueData: "GCode File"; Flags: uninsdeletekey; Tasks: associate
Root: HKA; Subkey: "Software\Classes\GcodeFile.gcode\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\fablicator.exe,0"; Tasks: associate
Root: HKA; Subkey: "Software\Classes\GcodeFile.gcode\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\fablicator.exe"" ""%1"""; Tasks: associate
Root: HKA; Subkey: "Software\Classes\Applications\fablicator.exe\SupportedTypes"; ValueType: string; ValueName: ".gcode"; ValueData: ""; Tasks: associate

[Icons]
Name: "{group}\Fablicator"; Filename: "{app}\fablicator.exe"; WorkingDir: "{app}"
Name: "{group}\Uninstall Fablicator"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Fablicator"; Filename: "{app}\fablicator.exe"; WorkingDir: "{app}"; Tasks: desktopicon