; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Textallion"
#define MyAppVersion "2015-08-28"
#define MyAppPublisher "textallion"
#define MyAppURL "https://textallion.sourceforge.io"
#define MyAppExeName "textallion_cygwin.bat"
;#include ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','ScriptPath','')
#include <C:\textallion_setup\it_download.iss>

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D976D03E-C5A7-4403-85DB-19734D1B7E0A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=c:\cygwin\
DisableDirPage=yes
DefaultGroupName={#MyAppName}
;LicenseFile=C:\textallion_setup\cygwin\usr\share\textallion\docs\license.t2t
InfoBeforeFile=C:\textallion_setup\readme.txt
OutputBaseFilename=textallion_setup
SetupIconFile=textallion_setup\textallion.ico
UninstallDisplayIcon={app}\unins000.exe
Compression=lzma
SolidCompression=yes
WizardImageFile=textallion_setup\logo_textallion.bmp
WizardSmallImageFile=textallion_setup\logo_textallion_small.bmp

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"; InfoBeforeFile: C:\textallion_setup\readmeFR.txt
Name: "english"; MessagesFile: "compiler:Default.isl"; InfoBeforeFile: C:\textallion_setup\readme.txt


[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\textallion_setup\cygwin\textallion_cygwin.bat"; DestDir: "{app}"; Flags: ignoreversion;  Components: Main
Source: "C:\textallion_setup\textallion.ico"; DestDir: "{app}"; Flags: ignoreversion;  Components: Main
Source: "C:\textallion_setup\cygwin\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs;  Components: Main
; correct Geany incorrect handling of txt2tags files
Source: "C:\textallion_setup\filetype_extensions.conf"; DestDir: "{tmp}"; Flags: ignoreversion recursesubdirs createallsubdirs;  Components: Geany
Source: "C:\textallion_setup\solarized-light.conf"; DestDir: "{tmp}"; Flags: ignoreversion recursesubdirs createallsubdirs;  Components: Geany
Source: "C:\cygwin\usr\share\textallion_bitbucket\core\locale"; DestDir: "{tmp}"; Flags: ignoreversion recursesubdirs createallsubdirs;  Components: Main
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}" ; IconFilename: "{app}\textallion.ico"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"  ;  IconFilename: "{app}\uninstall.ico"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\textallion.ico" ; Tasks: desktopicon


[Code]
var
  MiktexChecked: Boolean;
  MiktexCheckResult: Boolean;

  SumatraChecked: Boolean;
  SumatraCheckResult: Boolean;

  CalibreChecked: Boolean;
  CalibreCheckResult: Boolean;

  GeanyChecked: Boolean;
  GeanyCheckResult: Boolean;


function MiktexCheck(): Boolean;
begin
  if not MiktexChecked then begin
    MiktexCheckResult := MsgBox('During this installation, do you want to download and install Miktex (recommended)? It is needed to create PDF file.', mbConfirmation, MB_YESNO) = idYes;
    MiktexChecked := True;
  end;
end;

function MiktexCheckInstall(): Boolean;
begin
 if (MiktexCheckResult = True) then begin
    Result := True;
  end;
end;



function CalibreCheck(): Boolean;
begin
  if not CalibreChecked then begin
    CalibreCheckResult := MsgBox('During this installation, do you want to download and install Calibre (recommended)? It is needed to create EPUB file.', mbConfirmation, MB_YESNO) = idYes;
    CalibreChecked := True;
  end;
end;

function CalibreCheckInstall(): Boolean;
begin
 if (CalibreCheckResult = True) then begin
    Result := True;
  end;
end;

function GeanyCheck(): Boolean;
begin
  if not GeanyChecked then begin
    GeanyCheckResult := MsgBox('During this installation, do you want to download Geany (highly recommended)? It will help editing source files. If you dont have it, it will require more setup from your part to edit your source files properly', mbConfirmation, MB_YESNO) = idYes;
    GeanyChecked := True;
  end;
end;

function GeanyCheckInstall(): Boolean;
begin
 if (GeanyCheckResult = True) then begin
    Result := True;
  end;
end;


function SumatraCheck(): Boolean;
begin
  if not SumatraChecked then begin
    SumatraCheckResult := MsgBox('During this installation, do you want to download Sumatra PDF? It will help displaying PDF file.', mbConfirmation, MB_YESNO) = idYes;
    SumatraChecked := True;
  end;
end;

function SumatraCheckInstall(): Boolean;
begin
 if (SumatraCheckResult = True) then begin
    Result := True;
  end;
end;


function MyDirCheck(DirName: String): Boolean;
begin
  Result := DirExists(DirName);
end;




procedure InitializeWizard();
//var
//  FileSumatra, FileMiktex, FileName: String;   
begin;
// Download
 itd_init;

 MiktexCheck();
 if (MiktexCheckResult = True) then begin
 if not FileExists(expandConstant('{src}\basic-miktex-2.9.5105.exe')) then begin
      //Let's download miktex
     itd_addfile('http://mirrors.ircam.fr/pub/CTAN/systems/win32/miktex/setup/basic-miktex-2.9.5105.exe',expandconstant('{src}\basic-miktex-2.9.5105.exe'));  
     //Start the download after the "Ready to install" screen is shown
     end;
 end;
                   

CalibreCheck();
 if (CalibreCheckResult = True) then begin
 if not FileExists(expandConstant('{src}\calibre-1.48.0.msi')) then begin
      //Let's download Calibre
     itd_addfile('http://download.calibre-ebook.com/1.48.0/calibre-1.48.0.msi',expandconstant('{src}\calibre-1.48.0.msi'));  
     //Start the download after the "Ready to install" screen is shown
     end;
 end;

 GeanyCheck();
 if (GeanyCheckResult = True) then begin
// FileGeany := ExpandConstant('{app}\geany-0.20_setup.exe');
 if not FileExists(expandConstant('{src}\geany-1.25_setup.exe')) then begin
      //Let's download Geany
     itd_addfile('http://download.geany.org/geany-1.25_setup.exe',expandconstant('{src}\geany-1.25_setup.exe'));  
     //Start the download after the "Ready to install" screen is shown
     end;
 end;
 
 SumatraCheck();
 if (SumatraCheckResult = True) then begin
// FileSumatra := ExpandConstant('{app}\SumatraPDF-1.4-install.exe');
 if not FileExists(expandConstant('{src}\SumatraPDF-3.0-install.exe')) then begin
      //Let's download sumatra
     itd_addfile('http://kjkpub.s3.amazonaws.com/sumatrapdf/rel/SumatraPDF-3.0-install.exe',expandconstant('{src}\SumatraPDF-3.0-install.exe'));  
     //Start the download after the "Ready to install" screen is shown
     end;
 end;

  itd_downloadafter(wpReady);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
//
 if CurStep=ssInstall then begin //Lets install those files that were downloaded for us
     if (MiktexCheckResult = True) then begin
      //Let's install miktex
      //filecopy(expandconstant('{tmp}\basic-miktex-2.8.3761.exe'),expandconstant('{src}\basic-miktex-2.8.3761.exe'),false);
      end;

     if (SumatraCheckResult = True) then begin
      //Let's install sumatra
      //filecopy(expandconstant('{tmp}\SumatraPDF-1.4-install.exe'),expandconstant('{src}\SumatraPDF-1.4-install.exe'),false);
      end;

     if (CalibreCheckResult = True) then begin
      //Let's install Calibre
      //filecopy(expandconstant('{tmp}\calibre-0.7.50.msi'),expandconstant('{src}\calibre-0.7.50.msi'),false);
      end;

     if (GeanyCheckResult = True) then begin
      //Let's install Geany
      //filecopy(expandconstant('{tmp}\geany-0.20_setup.exe'),expandconstant('{src}\geany-0.20_setup.exe'),false);
      end;
  end else if CurStep = ssPostInstall then begin

    // correct Geany incorrect handling of txt2tags files
      filecopy(expandconstant('{tmp}\filetype_extensions.conf'),expandconstant('{pf32}\Geany\data\filetype_extensions.conf'),false);
      filecopy(expandconstant('{tmp}\solarized-light.conf'),expandconstant('{pf32}\Geany\data\colorschemes\solarized-light.conf'),false);
      
   // locale

  
      end;

end;

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: shellexec postinstall skipifsilent; Components: Main
Filename: "{src}\basic-miktex-2.9.5105.exe"; Parameters: "/SILENT " ; Check: MiktexCheckInstall ; Components: Miktex
Filename: "msiexec"; Parameters: "/i ""{src}\calibre-1.48.0.msi""" ; Check: CalibreCheckInstall ; Components: Calibre
;Filename: "{src}\calibre-1.48.0.msi"; Parameters: "/SILENT " ; Check: CalibreCheckInstall ; Components: Calibre
Filename: "{src}\geany-1.25_setup.exe"; Parameters: "/SILENT " ; Check: GeanyCheckInstall ; Components: Geany
Filename: "{src}\SumatraPDF-3.0-install.exe"; Parameters: "/SILENT " ; Check: SumatraCheckInstall ; Components: Sumatra

[Components]
Name: Main; Description: Main Textallion Installation (cygwin); Types: full compact custom; Flags: fixed
Name: Miktex; Types: full; Description: MikTeX (for creating PDF)
Name: Calibre; Types: full; Description: Calibre (for creating EPUB)
Name: Geany; Types: full; Description: Geany text editor (recommended)
Name: Sumatra; Types: full; Description: Sumatra PDF reader (optional)

;[UninstallRun]
;Filename: {app}\*;
