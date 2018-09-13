unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons;

type

  { TPresentacion }

  TPresentacion = class(TForm)
    Button1: TButton;
    Fondo: TImage;
    Image2: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { private declarations }

  public
    { public declarations }
  end;

var
  Presentacion: TPresentacion;

implementation

uses
  Unit2;

{$R *.lfm}

{ TPresentacion }



procedure TPresentacion.Button1Click(Sender: TObject);    // TODO: Quitar Boton
begin
       Jugadores.show;
       presentacion.hide;
       Timer1.Enabled:=false;
end;

procedure TPresentacion.FormCreate(Sender: TObject);
begin
     Timer1.Enabled:=True;

end;

procedure TPresentacion.Label1Click(Sender: TObject);
begin

end;

procedure TPresentacion.Timer1Timer(Sender: TObject);
begin
     Timer1.Enabled:= false;
     Jugadores.show;
     presentacion.hide;
end;


end.

