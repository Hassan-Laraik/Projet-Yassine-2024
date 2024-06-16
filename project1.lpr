program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zcomponent, fortes324forlaz, virtualdbgrid_package,
  Uadhesion, UPrancipalepas, uDM, uPersoAlertDialog, uCarte_Adherent,
uRecu_Paiement
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmprancipale, Frmprancipale);
  Application.CreateForm(TFrmAdhesion, FrmAdhesion);
  Application.CreateForm(TFrmPersoAlertDialog, FrmPersoAlertDialog);
  Application.CreateForm(TFrmCarteAdherent, FrmCarteAdherent);
  Application.CreateForm(TFrmRecu, FrmRecu);
  Application.Run;
end.

