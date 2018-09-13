unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DbCtrls, ZDataset;

type

  { TProfesor }

  TProfesor = class(TForm)
    B_editar: TButton;
    B_agregar: TButton;
    B_eliminar: TButton;
    B_salir: TButton;
    B_recno: TButton;
    B_reccant: TButton;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure B_editarClick(Sender: TObject);
    procedure B_agregarClick(Sender: TObject);
    procedure B_eliminarClick(Sender: TObject);
    procedure B_salirClick(Sender: TObject);
    procedure B_recnoClick(Sender: TObject);
    procedure B_reccantClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Profesor: TProfesor;

implementation
Uses
  Unit2,Unit6;

{$R *.lfm}

{ TProfesor }

procedure TProfesor.B_editarClick(Sender: TObject);
begin
     prof_ver.show;
end;

procedure TProfesor.B_agregarClick(Sender: TObject);
begin
     Jugadores.Tabla2.Insert;
     Jugadores.Tabla2.Post;
     prof_ver.show;
end;

procedure TProfesor.B_eliminarClick(Sender: TObject);
begin
     Jugadores.Tabla2.Delete;
end;

procedure TProfesor.B_salirClick(Sender: TObject);
begin
     Profesor.Close;
end;

procedure TProfesor.B_recnoClick(Sender: TObject);
begin
  showmessage(inttostr(Jugadores.Tabla2.RecNo));
end;

procedure TProfesor.B_reccantClick(Sender: TObject);
begin
  Showmessage(inttostr(jugadores.tabla2.RecordCount));
end;

procedure TProfesor.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     Jugadores.Tabla3.Open;
     Jugadores.Tabla3.Edit;
     Jugadores.Tabla3.FieldByName('cantidad').Text := inttostr(Jugadores.Tabla2.RecordCount);
     Jugadores.Tabla3.Post;
end;

procedure TProfesor.FormCreate(Sender: TObject);
begin
     //Jugadores.Tabla2.Open;
end;

procedure TProfesor.FormShow(Sender: TObject);
begin
     Jugadores.Tabla2.Open;
end;

end.

