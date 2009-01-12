unit Cheat;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls;

type
  TCheatForm = class(TForm)
    legbase1: TImage;
    legbase2: TImage;
    legbase3: TImage;
    legbase4: TImage;
    Label1: TLabel;
    LegCam1: TImage;
    LegCam2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Cheating1: TLabel;
    Cheating2: TLabel;
    Button1: TButton;
    Label4: TLabel;
    Start1: TButton;
    Start2: TButton;
    WinnerLabel: TLabel;
    procedure Start1Click(Sender: TObject);
    procedure Start2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ResetCam;
    procedure SetImage(ostrich, image: integer);
    procedure FlashCheat(ostrich: integer);
  end;

var
  CheatForm: TCheatForm;

implementation

{$R *.DFM}

uses utils,mn;

procedure TCheatForm.ResetCam;
begin
SetImage(1, 1);
SetImage(2, 1);
cheating1.visible := false;
cheating2.visible := false;
end;

procedure TCheatForm.SetImage(ostrich, image: integer);
var
	which: TImage;
    leggs: TImage;
begin
	case ostrich of
    	1: which := Legcam1;
        2: which := Legcam2;
    	end;

	case image of
    	1: leggs := legbase1;
        2: leggs := legbase2;
        3: leggs := legbase3;
        4: leggs := legbase4;
        end;

    which.picture := leggs.picture;
end;

procedure TCheatForm.FlashCheat(ostrich: integer);
var
	i: integer;
    olabel: TLabel;
begin
	case ostrich of
    	1:	olabel := cheating1;
        2:	olabel := cheating2;
    	end;

    for i := 1 to 5 do
    	begin
        olabel.visible := true;
        delay(100);
        olabel.visible := false;
        delay(100);
        end;
    olabel.visible := true;
end;

procedure TCheatForm.Start1Click(Sender: TObject);
begin
ostrichform.start1click(sender);
end;

procedure TCheatForm.Start2Click(Sender: TObject);
begin
ostrichform.start2click(sender);
end;

procedure TCheatForm.Button1Click(Sender: TObject);
begin
height := width;
ostrichform.visible := true;
end;

procedure TCheatForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.
