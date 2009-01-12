unit Utils;

interface

{ I can't believe delphi 1 doesn't have a delay function }
procedure Delay(msec: word);


implementation

uses sysutils, forms;

{ doot da doo, writing our own delay function }
procedure Delay(msec: word);
var
	st,et,woo:TDateTime;
begin
	st := now;
    woo := msec;
    woo := woo / 24;
    woo := woo / 60;
    woo := woo / 60;
    woo := woo / 1000;
    et := st + woo;
    repeat
    	Application.ProcessMessages;
    until now >= et;
end;



end.

