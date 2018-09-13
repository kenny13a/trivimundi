unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TAcercade }

  TAcercade = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Acercade: TAcercade;

implementation

{$R *.lfm}

{ TAcercade }

procedure TAcercade.Timer1Timer(Sender: TObject);
begin
    if label1.BoundsRect.Bottom <= 0 then begin //reset position
    Label1.Top := Panel1.Height;
  end else begin // scroooolll!
    Label1.Top := Label1.Top - 1;
  end;
end;

procedure TAcercade.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=True;
end;

procedure TAcercade.Button1Click(Sender: TObject);
begin
  Acercade.Close;
end;

procedure TAcercade.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Timer1.Enabled:=false;
end;

end.
