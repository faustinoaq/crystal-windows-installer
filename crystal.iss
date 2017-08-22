; Crystal installer layer for bash on Windows
; by @faustinoaq, 2017

#define MyAppName "Crystal on WSL"
#define MyAppVersion "0.0.1"
#define MyAppPublisher "Faustino Aguilar"
#define MyAppURL "https://github.com/faustinoaq/crystal-windows-installer"
#define MyAppExeName "play.exe"

[Setup]
AppId={{07F53AD5-6E25-41F5-9FF2-86958C4FB64B}
SignTool=signtool
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ChangesEnvironment=yes
DefaultDirName={pf}\Crystal
DisableProgramGroupPage=yes
DisableWelcomePage=no
LicenseFile=C:\Users\main\Desktop\crystal-installer\LICENSE.md
InfoBeforeFile=C:\Users\main\Desktop\crystal-installer\info\README.txt
InfoAfterFile=C:\Users\main\Desktop\crystal-installer\info\CHANGELOG.txt
OutputDir=C:\Users\main\Desktop\crystal-installer
OutputBaseFilename=crystal-setup
SetupIconFile=C:\Users\main\Desktop\crystal-installer\images\favicon.ico
Compression=lzma
SolidCompression=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
WizardSmallImageFile=C:\Users\main\Desktop\crystal-installer\images\icon.bmp
WizardImageFile=C:\Users\main\Desktop\crystal-installer\images\image.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "C:\Users\main\Desktop\crystal-installer\play.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\main\Desktop\crystal-installer\crystal.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\main\Desktop\crystal-installer\shards.bat"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

; Add crystal to Windows Path
[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}"; \
    Check: NeedsAddPath('{app}')

; Ensure to delete old crystal entries on Path
[Code]
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
  ParamExpanded: string;
begin
  //expand the setup constants like {app} from Param
  ParamExpanded := ExpandConstant(Param);
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  // look for the path with leading and trailing semicolon and with or without \ ending
  // Pos() returns 0 if not found
  Result := Pos(';' + UpperCase(ParamExpanded) + ';', ';' + UpperCase(OrigPath) + ';') = 0;  
  if Result = True then
     Result := Pos(';' + UpperCase(ParamExpanded) + '\;', ';' + UpperCase(OrigPath) + ';') = 0; 
end;