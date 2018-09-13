unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DbCtrls, ComCtrls;

type

  { Tprof_ver }

  Tprof_ver = class(TForm)
    Button1: TButton;
    Button2: TButton;
    B_entrar: TButton;
    B_siguiente: TButton;
    B_volver: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMPista1: TDBMemo;
    DBMPista2: TDBMemo;
    DBMPista3: TDBMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Img1: TImage;
    Img2: TImage;
    Label2: TLabel;
    L_npt: TLabel;
    L_puntos: TLabel;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    Shape1: TShape;
    Shape2: TShape;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Img1Click(Sender: TObject);
    procedure Img2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  prof_ver: Tprof_ver;

implementation
Uses
  Unit2;

{$R *.lfm}

{ Tprof_ver }

procedure Tprof_ver.FormShow(Sender: TObject);   // TODO: Agregar un editor de imágenes.
begin
     Img1.picture.loadfromfile(application.location + Jugadores.tabla2.fieldbyname('Timg1_p').Text);
     Img2.picture.loadfromfile(application.location + Jugadores.tabla2.fieldbyname('Timg2_p').Text);
     OpenDialog1.InitialDir:= application.location + '\Imagenes\Preguntas';
     L_npt.Caption:= inttostr(Jugadores.Tabla2.RecNo) + '/' + inttostr(Jugadores.Tabla2.RecordCount);

     Edit1.Text:= Jugadores.tabla3.fieldbyname('pregunta').Text;
     Edit2.Text:= Jugadores.tabla2.fieldbyname('Trespuesta_p').Text;
end;

procedure Tprof_ver.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     //Jugadores.Tabla2.Refresh;
     Jugadores.Tabla3.Edit;
     Jugadores.tabla3.fieldbyname('pregunta').Text := Edit1.text;
     Jugadores.Tabla3.Post;
     Jugadores.Tabla2.Edit;
     Jugadores.tabla2.fieldbyname('Trespuesta_p').Text;
       Img1.Picture.SaveToFile(application.location + '\Imagenes\Preguntas\' + inttostr(Jugadores.Tabla2.RecNo) + '_A.bmp');
       Img2.Picture.SaveToFile(application.location + '\Imagenes\Preguntas\' + inttostr(Jugadores.Tabla2.RecNo) + '_B.bmp');
     Jugadores.Tabla2.Post;
     Jugadores.Tabla2.Refresh;
end;

procedure Tprof_ver.Img1Click(Sender: TObject);
var
   archivo: string;
begin
     if OpenDialog1.Execute then
        begin
             archivo := OpenDialog1.Filename;
             ShowMessage(archivo);
             Img1.picture.loadfromfile(archivo);
             //Img1.Picture.SaveToFile(application.location + '\Imagenes\Preguntas\' + inttostr(Jugadores.Tabla2.RecNo) + '_A.bmp');
        end;
end;

procedure Tprof_ver.Img2Click(Sender: TObject);
var
   archivo: string;
begin
     if OpenDialog1.Execute then
        begin
             archivo := OpenDialog1.Filename;
             ShowMessage(archivo);
             Img2.picture.loadfromfile(archivo);
             //Img2.Picture.SaveToFile(application.location + '\Imagenes\Preguntas\' + inttostr(Jugadores.Tabla2.RecNo) + '_B.bmp');
        end;
end;

end.

