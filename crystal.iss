; Crystal installer layer for bash on Windows
; by @faustinoaq, 2017-2021

#define MyAppName "Crystal on WSL"
#define MyAppVersion "0.0.2"
#define MyAppPublisher "Faustino Aguilar"
#define MyAppURL "https://github.com/faustinoaq/crystal-windows-installer"
#define MyAppExeName "play.exe"

[Setup]
AppId={{07F53AD5-6E25-41F5-9FF2-86958C4FB64B}
;SignTool=signtool $f

AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ChangesEnvironment=yes
DefaultDirName={commonpf}\Crystal
DisableProgramGroupPage=yes
DisableWelcomePage=no
LicenseFile={#SourcePath}\LICENSE
InfoBeforeFile={#SourcePath}\info\README.txt
InfoAfterFile={#SourcePath}\info\CHANGELOG.txt
OutputDir={#SourcePath}
OutputBaseFilename=crystal-setup
SetupIconFile={#SourcePath}\images\favicon.ico
Compression=lzma
SolidCompression=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
WizardSmallImageFile={#SourcePath}\images\icon.bmp
WizardImageFile={#SourcePath}\images\image.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#SourcePath}\play.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\crystal.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\shards.bat"; DestDir: "{app}"; Flags: ignoreversion

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