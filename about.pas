unit About;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TAboutForm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LegCam1: TImage;
    Image1: TImage;
    Shape1: TShape;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Explode(startx, starty: integer);
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.DFM}

uses utils;

procedure TAboutForm.Explode(startx, starty: integer);
var
	i: integer;
begin
top := starty;
left := startx;
height := 33;
width := 33;
visible := true;

while height < 273 do
	begin
    if (height + 32) > 273 then
    	begin
        top := top - ((273 - height) div 2);
        height := height + ((273 - height) div 2) + 1;
        end
    else
    	begin
	    top := top - 16;
        height := height + 32;
        end;
    delay(50);
    end;

while width < 435 do
	begin
    if (width + 32) > 435 then
    	begin
        left := left - ((435 - width) div 2);
        width := width + ((435 - width) div 2) + 1;
        end
    else
    	begin
        left := left - 16;
        width := width + 32;
        end;
    delay(30);
    end;
Label1.visible := true;
button1.visible := true;
label2.visible := true;
label3.visible := true;
label4.visible := true;
legcam1.visible := true;
shape1.visible := true;
image1.visible := true;
end;

procedure TAboutForm.Button1Click(Sender: TObject);
begin
Label1.visible := false;
button1.visible := false;
label2.visible := false;
label3.visible := false;
label4.visible := false;
legcam1.visible := false;
image1.visible := false;
shape1.visible := false;
visible := false;

end;

end.
