program Trivimundi;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, Unit1, Unit2, Unit3, Unit4;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TPresentacion, Presentacion);
  Application.CreateForm(TJugadores, Jugadores);
  Application.CreateForm(TJuego, Juego);
  Application.CreateForm(TRanking, Ranking);
  Application.Run;
end.

