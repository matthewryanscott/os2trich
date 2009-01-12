program Strich;

uses
  Forms,
  Mn in 'MN.PAS' {OstrichForm},
  Cheat in 'CHEAT.PAS' {CheatForm},
  Utils in 'UTILS.PAS',
  About in 'ABOUT.PAS' {AboutForm};

{$R *.RES}

begin
  Application.CreateForm(TOstrichForm, OstrichForm);
  Application.CreateForm(TCheatForm, CheatForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
