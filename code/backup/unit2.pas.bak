unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, DBGrids, ExtCtrls, ZConnection, ZDataset, LCLType, Menus;

type

  { TJugadores }

  TJugadores = class(TForm)
    B_eliminar: TButton;
    B_nuevo: TButton;
    B_ranking: TButton;
    B_Salir: TButton;
    B_jugar: TButton;
    B_anterior: TButton;
    B_siguiente: TButton;
    Datos3: TDataSource;
    Datos2: TDataSource;
    Datos1: TDataSource;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    E_numero: TDBEdit;
    Grid2: TDBGrid;
    E_nombre: TDBEdit;
    E_edad: TDBEdit;
    DBGrid1: TDBGrid;
    Conexion1: TZConnection;
    Fondo: TImage;
    MainMenu1: TMainMenu;
    MenuAyuda: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuJugadores: TMenuItem;
    MenuJuego: TMenuItem;
    PTS: TDBText;
    Image1: TImage;
    Query1: TZQuery;
    Tabla1: TZTable;
    Tabla2: TZTable;
    Tabla3: TZTable;
    procedure B_eliminarClick(Sender: TObject);
    procedure B_nuevoClick(Sender: TObject);
    procedure B_rankingClick(Sender: TObject);
    procedure B_SalirClick(Sender: TObject);
    procedure B_anteriorClick(Sender: TObject);
    procedure B_jugarClick(Sender: TObject);
    procedure B_siguienteClick(Sender: TObject);
    procedure FormClose(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Jugadores: TJugadores;

implementation

Uses
  Unit3, Unit4, Unit5, Unit7;

{$R *.lfm}

{ TJugadores }

procedure TJugadores.B_SalirClick(Sender: TObject);
begin
  application.Terminate; //Termina la aplicación
end;

procedure TJugadores.B_eliminarClick(Sender: TObject);
begin
     Tabla1.Delete;
end;

procedure TJugadores.B_nuevoClick(Sender: TObject);
var
   respuesta: string;
begin
     if InputQuery('Nuevo jugador', 'Ingrese el nombre del nuevo jugador:', respuesta) then
        begin
             Tabla1.Insert; //Se pone la tabla en modo de inserccion
             Tabla1.FieldByName('nombre').Text:=respuesta; //se carga el valor del nombre
             Tabla1.Post;  //se ejecuta la inserccion
             B_anterior.enabled:= True;
             MenuItem9.enabled:= true;
          end
     else
         begin
              //showmessage('El nuevo jugador no ha sido creado.');
         end;
     tabla1.Refresh;
end;

procedure TJugadores.B_rankingClick(Sender: TObject);
begin
     Ranking.ShowModal;
end;

procedure TJugadores.B_anteriorClick(Sender: TObject);
begin
     B_siguiente.enabled :=true;
     MenuItem10.enabled:= true;
     Tabla1.prior;  //va al jugador anterior
     tabla1.prior;
     if Tabla1.BOF then
        begin
             B_anterior.Enabled :=false;
             MenuItem9.enabled:=false;
        end
     else
         Begin
              tabla1.Next;
         end;
  // DONE: Al llegar al primer elemento poner eneable.false
end;

procedure TJugadores.B_jugarClick(Sender: TObject);
var
   respuesta, estilocaja: Integer;
begin
  if (Tabla1.FieldByName('jinicio').text = '0') and (strtoint(Tabla1.FieldByName('jugadas').text) > 0) then
     begin
          estilocaja := MB_ICONQUESTION + MB_YESNO;
          respuesta := Application.MessageBox('USTED YA HA JUGADO' + sLineBreak + '¿Desea volver a jugar?' + sLineBreak + 'Su puntaje volverá a 0', '¿Volver a jugar?', estilocaja);
          if respuesta = IDYES then
             Juego.ShowModal; //Abre el juego como dependiente
     end
  else
      Juego.ShowModal; //Abre el juego como dependiente
end;

procedure TJugadores.B_siguienteClick(Sender: TObject);
begin
             B_anterior.enabled:= True;
MenuItem9.enabled:= true;
  Tabla1.next; //va al jugador siguiente
  Tabla1.next;     // TODO: Hacerlo en modo controls disableds
  if Tabla1.EOF then
     begin
          B_siguiente.enabled := false;
          MenuItem10.enabled:=false;
     end
  else
      begin
           Tabla1.Prior;
      end;

    // DONE: Al llegar al ultimo elemento poner eneable.false
end;

procedure TJugadores.FormClose(Sender: TObject);
begin
     Tabla1.Close;
     Tabla2.Close;
     Tabla3.Close;
     application.Terminate;   //Termina la aplicación
end;

procedure TJugadores.FormCreate(Sender: TObject);
begin
  {Conexion1.Connected:=False;
  Conexion1.Database := application.location + 'Trivimundi.sqlite';
  Conexion1.Connect;
  Tabla1.Open;
  Tabla2.Open;
  Tabla3.open;
  //ancho de las 3 primeras columnas de la grid
  DBGrid1.Columns[0].Width:=80;
  DBGrid1.Columns[1].Width:=40;
  DBGrid1.Columns[2].Width:=40;

  Jugadores.Tabla3.Open;
  Jugadores.Tabla3.Edit;
  Jugadores.Tabla3.FieldByName('cantidad').Text := inttostr(Jugadores.Tabla2.RecordCount);
  Jugadores.Tabla3.Post;
                           }

end;

procedure TJugadores.FormShow(Sender: TObject);
begin
     Conexion1.Connected:=False;
     Conexion1.Database := application.location + 'Trivimundi.sqlite';
     Conexion1.Connect;
     Tabla1.Open;
     Tabla2.Open;
     Tabla3.open;
     //ancho de las 3 primeras columnas de la grid
     DBGrid1.Columns[0].Width:=80;
     DBGrid1.Columns[1].Width:=40;
     DBGrid1.Columns[2].Width:=40;

     Jugadores.Tabla3.Open;
     Jugadores.Tabla3.Edit;
     Jugadores.Tabla3.FieldByName('cantidad').Text := inttostr(Jugadores.Tabla2.RecordCount);
     Jugadores.Tabla3.Post;
end;

procedure TJugadores.MenuItem14Click(Sender: TObject);
begin
     Acercade.ShowModal;
end;

procedure TJugadores.MenuItem5Click(Sender: TObject);
const
     contraprofe = 'anubis'; // contraseña del administrador
begin
     if passwordbox('MODO PROFESOR','Ingrese la contraseña de administrador:') = contraprofe then
        Profesor.ShowModal
     else
       showmessage('Incorrecto');
end;

end.

