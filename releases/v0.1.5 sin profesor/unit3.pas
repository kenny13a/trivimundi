unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, ExtCtrls, LCLType, ComCtrls, Types;

type

  { TJuego }

  TJuego = class(TForm)
    B_pista3: TButton;
    B_pista2: TButton;
    B_pista1: TButton;
    B_entrar: TButton;
    B_siguiente: TButton;
    B_volver: TButton;
    DBMPista1: TDBMemo;
    DBMPista2: TDBMemo;
    DBMPista3: TDBMemo;
    DBT_nombre: TDBText;
    DBT_puntos: TDBText;
    E_respuesta: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Img1: TImage;
    Img2: TImage;
    Fondo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    L_puntos: TLabel;
    L_npt: TLabel;
    ProgressBar1: TProgressBar;
    procedure B_10Click(Sender: TObject);
    procedure B_entrarClick(Sender: TObject);
    procedure B_pista1Click(Sender: TObject);
    procedure B_pista2Click(Sender: TObject);
    procedure B_pista3Click(Sender: TObject);
    procedure B_siguienteClick(Sender: TObject);
    procedure B_volverClick(Sender: TObject);
    procedure DBE_puntosChange(Sender: TObject);
    procedure FondoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Juego: TJuego;

Const
  cantidaddepreguntas = 25;

implementation

Uses
  Unit2;

{$R *.lfm}

{ TJuego }

// DONE: Poner un progressbar abajo de todo

procedure TJuego.B_10Click(Sender: TObject);
var
   a, b: Integer;
begin
     a:= strtoint(DBT_puntos.caption);
     b:= a + 10;
     DBT_puntos.caption := inttostr(b);
     Jugadores.Tabla1.Edit;
     Jugadores.Tabla1.FieldByName('puntos').Text:=inttostr(b);
     Jugadores.Tabla1.Post;
end;

procedure TJuego.B_entrarClick(Sender: TObject);
var
   a, b: integer;
begin
     If uppercase(E_respuesta.Text) = uppercase(Jugadores.Tabla2.fieldbyname('Trespuesta_p').text) then
        begin
             showmessage('CORRECTO');
             a:= strtoint(DBT_puntos.caption);
             b:= a + 10;
             DBT_puntos.caption := inttostr(b);
             Jugadores.Tabla1.Edit;
             Jugadores.Tabla1.FieldByName('puntos').Text:=inttostr(b);
             Jugadores.Tabla1.Post;
             B_pista1.Visible:=True;
             B_pista2.Visible:=True;
             B_pista3.Visible:=True;
             if strtoint(jugadores.Tabla2.FieldByName('Tnum_p').Text) < cantidaddepreguntas then
                Begin
                     Jugadores.tabla2.next;
                     ProgressBar1.Position := strtoint(Jugadores.Tabla2.FieldByName('Tnum_p').Text);
                     L_npt.Caption := Jugadores.tabla2.fieldbyname('Tnum_p').Text + '/' + inttostr(cantidaddepreguntas);
                     Img1.picture.loadfromfile(application.location + Jugadores.tabla2.fieldbyname('Timg1_p').Text);
                     Img2.picture.loadfromfile(application.location + Jugadores.tabla2.fieldbyname('Timg2_p').Text);
                end
             else
                 Begin // FIN DEL JUEGO
                       Jugadores.Tabla1.Edit;
                       Jugadores.Tabla1.FieldByName('jinicio').Text := '0';
                       Jugadores.Tabla1.FieldByName('jfin').Text := '1';
                       Jugadores.Tabla1.FieldByName('jugadas').Text := inttostr(strtoint(Jugadores.Tabla1.FieldByName('jugadas').Text) + 1);
                       jugadores.tabla1.FieldByName('ultima_p').Text := '1';
                       jugadores.tabla1.post;
                       Showmessage('FIN DEL JUEGO');
                       juego.close;
                 end;
        end
     else
         begin
              showmessage('INCORRECTO');
              a:= strtoint(DBT_puntos.caption);
              b:= a - 1;
              DBT_puntos.caption := inttostr(b);
              Jugadores.Tabla1.Edit;
              Jugadores.Tabla1.FieldByName('puntos').Text:=inttostr(b);
              Jugadores.Tabla1.Post;
         end;
     if strtoint(jugadores.tabla1.fieldbyname('puntos').text) < 0 then
        begin
             jugadores.tabla1.edit;
             jugadores.tabla1.fieldbyname('puntos').text := '0';
             jugadores.tabla1.post;
        end;
     E_respuesta.Text := '';
     E_respuesta.SetFocus;
end;

procedure TJuego.B_pista1Click(Sender: TObject);
var
   a, b: Integer;
begin
     B_pista1.Visible:=false;
     a:= strtoint(DBT_puntos.caption);
     b:= a - 3;
     DBT_puntos.caption := inttostr(b);
     Jugadores.Tabla1.Edit;
     Jugadores.Tabla1.FieldByName('puntos').Text:=inttostr(b);
     Jugadores.Tabla1.Post;
end;

procedure TJuego.B_pista2Click(Sender: TObject);
var
   a, b: Integer;
begin
     B_pista2.Visible:=false;
     a:= strtoint(DBT_puntos.caption);
     b:= a - 3;
     DBT_puntos.caption := inttostr(b);
     Jugadores.Tabla1.Edit;
     Jugadores.Tabla1.FieldByName('puntos').Text:=inttostr(b);
     Jugadores.Tabla1.Post;
end;

procedure TJuego.B_pista3Click(Sender: TObject);
var
   a, b: Integer;
begin
     B_pista3.Visible:=false;
     a:= strtoint(DBT_puntos.caption);
     b:= a - 3;
     DBT_puntos.caption := inttostr(b);
     Jugadores.Tabla1.Edit;
     Jugadores.Tabla1.FieldByName('puntos').Text:=inttostr(b);
     Jugadores.Tabla1.Post;
end;

procedure TJuego.B_siguienteClick(Sender: TObject);
begin
     if strtoint(jugadores.tabla1.fieldbyname('puntos').text) < 0 then
        begin
             jugadores.tabla1.edit;
             jugadores.tabla1.fieldbyname('puntos').text := '0';
             jugadores.tabla1.post;
        end;
     if strtoint(jugadores.Tabla2.FieldByName('Tnum_p').Text) < cantidaddepreguntas then
        Begin
             Jugadores.tabla2.next;
             ProgressBar1.Position := strtoint(Jugadores.Tabla2.FieldByName('Tnum_p').Text);
             L_npt.Caption := Jugadores.tabla2.fieldbyname('Tnum_p').Text + '/' + inttostr(cantidaddepreguntas);
             Img1.picture.loadfromfile(application.location + Jugadores.tabla2.fieldbyname('Timg1_p').Text);
             Img2.picture.loadfromfile(application.location + Jugadores.tabla2.fieldbyname('Timg2_p').Text);
             B_pista1.Visible:=True;
             B_pista2.Visible:=True;
             B_pista3.Visible:=True;

        end
     else
         Begin //FIN DEL JUEGO
               Jugadores.Tabla1.Edit;
               Jugadores.Tabla1.FieldByName('jinicio').Text := '0';
               Jugadores.Tabla1.FieldByName('jfin').Text := '1';
               Jugadores.Tabla1.FieldByName('jugadas').Text := inttostr(strtoint(Jugadores.Tabla1.FieldByName('jugadas').Text) + 1);
               Jugadores.Tabla1.Post;
               Showmessage('FIN DEL JUEGO');
               juego.Close;
         end;
     E_respuesta.Text := '';
     E_respuesta.SetFocus;
end;

procedure TJuego.B_volverClick(Sender: TObject);
begin
     if strtoint(jugadores.tabla1.fieldbyname('puntos').text) < 0 then
        begin
             jugadores.tabla1.edit;
             jugadores.tabla1.fieldbyname('puntos').text := '0';
             jugadores.tabla1.post;
        end;
        jugadores.tabla1.Edit;
        jugadores.tabla1.FieldByName('ultima_p').Text := Jugadores.tabla2.fieldbyname('Tnum_p').Text;
        jugadores.tabla1.post;
        Juego.Close;
end;

procedure TJuego.DBE_puntosChange(Sender: TObject);
begin

end;

procedure TJuego.FondoClick(Sender: TObject);
begin

end;

procedure TJuego.FormShow(Sender: TObject);
begin
     If Jugadores.Tabla1.FieldByName('jinicio').text = '0' then
        begin
             Jugadores.Tabla2.Locate('Tnum_p', '1', []);
             Jugadores.Tabla1.Edit;
             Jugadores.Tabla1.FieldByName('jinicio').Text := '1';
             Jugadores.Tabla1.FieldByName('jfin').Text := '0';
             Jugadores.Tabla1.FieldByName('puntos').Text := '0';
             Jugadores.Tabla1.Post;
        end
     else
         begin
              Jugadores.Tabla2.Locate('Tnum_p', Jugadores.Tabla1.FieldByName('ultima_p').Text, []);
         end;
     Img1.picture.loadfromfile(application.location + Jugadores.tabla2.fieldbyname('Timg1_p').Text);
     Img2.picture.loadfromfile(application.location + Jugadores.tabla2.fieldbyname('Timg2_p').Text);
     L_npt.Caption := Jugadores.tabla2.fieldbyname('Tnum_p').Text + '/' + inttostr(cantidaddepreguntas);
     ProgressBar1.Max:= cantidaddepreguntas;
     ProgressBar1.Position := strtoint(Jugadores.Tabla2.FieldByName('Tnum_p').Text);
end;

procedure TJuego.Image4Click(Sender: TObject);
begin

end;

procedure TJuego.Label2Click(Sender: TObject);
begin

end;

procedure TJuego.ProgressBar1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

end.

