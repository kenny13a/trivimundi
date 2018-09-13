unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, ExtCtrls, ZDataset;

type

  { TRanking }

  TRanking = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Image1: TImage;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Ranking: TRanking;

implementation

uses
    Unit2;

{$R *.lfm}

{ TRanking }

procedure TRanking.FormShow(Sender: TObject);
begin
     ZReadOnlyQuery1.Active:= True;
     ZreadOnlyQuery1.Refresh;
     // DONE: ponerle un boton para cerrar, quitar los botones de arriba, ploquear grilla y poner fondo
     DBGrid1.Columns[0].Width:=50;
     DBGrid1.Columns[0].Alignment := taCenter;
     DBGrid1.Columns[1].Width:=120;
     DBGrid1.Columns[1].Alignment := taCenter;
     DBGrid1.Columns[2].Width:=100;
     DBGrid1.Columns[2].Alignment := taCenter;
     DBGrid1.DefaultRowHeight:= 30;
end;

procedure TRanking.Button1Click(Sender: TObject);
begin
     Ranking.close;
end;

end.

