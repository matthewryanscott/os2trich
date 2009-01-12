unit Mn;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TOstrichForm = class(TForm)
    FinishLine: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Start1: TButton;
    Start2: TButton;
    PhotoLabel: TLabel;
    Strich1: TImage;
    Strich2: TImage;
    WinnerLabel: TLabel;
    Strichbase1: TImage;
    Strichbase2: TImage;
    Strichbase3: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    refreshing: TImage;
    RefreshLabel: TLabel;
    procedure Start1Click(Sender: TObject);
    procedure Start2Click(Sender: TObject);
    procedure igetit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    thewinner,userwinner: integer;
    procedure StartRace;
  public
    { Public declarations }
  end;

var
  OstrichForm: TOstrichForm;

implementation

{$R *.DFM}

uses cheat, utils, about;

procedure TOstrichForm.Start1Click(Sender: TObject);
begin
if start1.tag = 0 then
	begin
    start1.tag := 1;
	userwinner := 1;
	StartRace;
    start1.tag := 0;
    end;
end;

procedure TOstrichForm.Start2Click(Sender: TObject);
begin
if start1.tag = 0 then
	begin
    start1.tag := 1;
	userwinner := 2;
	StartRace;
    start1.tag := 0;
    end;
end;

procedure TOstrichForm.StartRace;
var
	o1,o2:integer;
    vis:integer;
    i, j: integer;
    cheater: integer;
procedure SetVis(q1,q2:boolean);
	begin
    case vis of
    	0:	begin
        	if q1 then Strich1.Picture := Strichbase1.Picture;
            if q2 then Strich2.Picture := Strichbase1.Picture;
            if q1 then CheatForm.SetImage(1, 1);
            if q2 then CheatForm.SetImage(2, 1);
            end;
    	1,3:begin
        	if q1 then Strich1.Picture := Strichbase2.Picture;
            if q2 then strich2.picture := strichbase2.picture;
            if q1 then CheatForm.SetImage(1, 2);
            if q2 then CheatForm.SetImage(2, 2);
            end;
    	2:	begin
        	if q1 then strich1.picture := strichbase3.picture;
            if q2 then strich2.picture := strichbase3.picture;
            if q1 then CheatForm.SetImage(1, 3);
            if q2 then CheatForm.SetImage(2, 3);
            end;
    	end;
    vis := (vis + 1) mod 4;

    if photolabel.visible = false then
	    case cheater of
    		11:	begin
	        	CheatForm.SetImage(1, 4);
    	    	CheatForm.FlashCheat(1);
        	    end;
	        22:	begin
    	    	CheatForm.SetImage(2, 4);
        	    CheatForm.FlashCheat(2);
	            end;
    	    end;
    end;
procedure SetPos;
	begin
    strich1.left := o1;
    strich2.left := o2;
    end;
begin
	randomize;
    strich1.top := 32;
    strich2.top := 96;
	o1 := 32;
    o2 := 32;
    vis := 0;
    WinnerLabel.visible := false;
    cheatform.winnerlabel.visible := false;
    PhotoLabel.Visible := false;
    CheatForm.Resetcam;
    refreshlabel.visible := false;

    while ((o1+32) < finishline.left) and
    		((o2+32) < finishline.left) do
    	begin
        (* the beginning of
          the great racing algorithm *)
		o1 := o1 + random(5) + 1;
        o2 := o2 + random(5) + 1;
        cheater := random(200);
        case cheater of
        	11:	o1 := o1 + random(10);
            22:	o2 := o2 + random(10);
            end;
        SetPos;
        SetVis(true,true);
        Delay(50);
        end;

    if o1 = o2 then
    	thewinner := 3
    else if (o1+32) >= finishline.left then
    	thewinner :=1
    else
    	thewinner :=2;


    if thewinner = 3 then
    	winnerlabel.caption := 'Winner: Tie!'
    else if thewinner = userwinner then
    	winnerlabel.caption := 'Winner: You!'
    else
    	winnerlabel.caption := 'Winner: Computer!';

    cheatform.winnerlabel.caption := winnerlabel.caption;

   	for i := 1 to 5 do
    	begin
        photolabel.visible := true;
        cheatform.winnerlabel.visible := true;
        Delay(150);
        photolabel.visible := false;
        cheatform.winnerlabel.visible := false;
        Delay(150);
        end;
    photolabel.visible := true;
    winnerlabel.visible := true;
    cheatform.winnerlabel.visible := true;

    (* cool down period  for exhausted ostriches *)
    while ((o1+32) < ostrichform.width) or
    		((o2+32) < ostrichform.width) do
    	begin
        if (o1+32) < ostrichform.width then
        	o1 := o1 + 2
        else
        	o1 := ostrichform.width - 32;
        if (o2+32) < ostrichform.width then
        	o2 := o2 + 2
        else
        	o2 := ostrichform.width - 32;
        SetPos;
        SetVis(true,true);
        Delay(50);
        end;

    (* enjoy refreashing blue gatoraid *)
    (* preliminary version *)
    while (strich1.top+32) < strich2.top do
    	begin
        strich1.top := strich1.top + 2;
        SetVis(true,false);
        delay(50);
        end;
    while (strich2.top+32) < refreshing.top do
    	begin
        strich2.top := strich2.top + 2;
        strich1.top := strich1.top + 2;
        SetVis(true,true);
        delay(50);
        end;

    (* enjoy drink *)
    for i := 1 to 10 do
    	begin
        for j := 1 to 3 do
        	begin
            SetVis(true,true);
            delay(50);
            end;
        refreshlabel.visible := true;
        for j := 1 to 3 do
        	begin
            SetVis(true,true);
            delay(50);
            end;
        refreshlabel.visible := false;
        end;
    refreshlabel.visible := true;

end;

procedure TOstrichForm.igetit(Sender: TObject);
begin
AboutForm.Explode(left + button1.left, top + button1.top);
end;

procedure TOstrichForm.Button2Click(Sender: TObject);
begin
cheatform.height := 364;
visible := false;
end;

end.

