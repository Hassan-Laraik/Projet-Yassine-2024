unit uDepenses;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, DBCtrls, DBExtCtrls;

type

  { TFrmDepenses }

  TFrmDepenses = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PnlEditerDetailDepense: TPanel;
    DBGrid1: TDBGrid;
    BtnPremier: TButton;
    BtnAvant: TButton;
    BtnDernier: TButton;
    BtnSuivant: TButton;
    EdtRecherche: TEdit;
    PnlSaisieDetailDepense: TPanel;
    BtnNouveauDepense: TButton;
    BtnEditerDepense: TButton;
    BtnAnnulerDepense: TButton;
    BtnValiderDepense: TButton;
    DBEdtMontant: TDBEdit;
    DBCmbxBenigivaire: TDBComboBox;
    DBCmbxFacture: TDBComboBox;
    DBEdtNumDocument: TDBEdit;
    DBDateOaiement: TDBDateEdit;
    DBEdyObservation: TDBEdit;
    procedure BtnPremierClick(Sender: TObject);
    procedure BtnAvantClick(Sender: TObject);
    procedure BtnSuivantClick(Sender: TObject);
    procedure BtnDernierClick(Sender: TObject);
    procedure BtnNouveauDepenseClick(Sender: TObject);
    procedure BtnEditerDepenseClick(Sender: TObject);
    procedure BtnAnnulerDepenseClick(Sender: TObject);
    procedure BtnValiderDepenseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
     procedure GestionBottonsDepense();
  public

  end;

var
  FrmDepenses: TFrmDepenses;

implementation
   uses UDM;
{$R *.lfm}

   { TFrmDepenses }

   procedure TFrmDepenses.BtnPremierClick(Sender: TObject);
   begin
      DM.FirstDepense();
   end;

procedure TFrmDepenses.BtnAvantClick(Sender: TObject);
begin
   DM.Priorepense();
end;

procedure TFrmDepenses.BtnSuivantClick(Sender: TObject);
begin
  DM.Nextepense();
end;

procedure TFrmDepenses.BtnDernierClick(Sender: TObject);
begin
  DM.Lastepense();
end;

procedure TFrmDepenses.BtnNouveauDepenseClick(Sender: TObject);
begin
  DM.AddDepense();
  self.GestionBottonsDepense;
  PnlSaisieDetailDepense.Enabled:=True;
end;

procedure TFrmDepenses.BtnEditerDepenseClick(Sender: TObject);
begin
  DM.EditDepense();
  self.GestionBottonsDepense;
  PnlSaisieDetailDepense.Enabled:=true;

end;

procedure TFrmDepenses.BtnAnnulerDepenseClick(Sender: TObject);
begin
  DM.CancelDepense();
  self.GestionBottonsDepense;
  PnlSaisieDetailDepense.Enabled:=False;
end;

procedure TFrmDepenses.BtnValiderDepenseClick(Sender: TObject);
begin

   if  DM.ValidateDepense() = true then
  begin
     ShowMessage('Operation Effectuée !');
  end;
  self.GestionBottonsDepense;
  PnlSaisieDetailDepense.Enabled:=False;
end;

procedure TFrmDepenses.GestionBottonsDepense();
begin
  BtnNouveauDepense.Enabled:=dm.IsBrowseDepense();
  BtnEditerDepense.Enabled:=dm.IsBrowseDepense();
  BtnAnnulerDepense.Enabled:=dm.IsEditOrInsertDepense();
  BtnValiderDepense.Enabled:=dm.IsEditOrInsertDepense();
end;

procedure TFrmDepenses.FormShow(Sender: TObject);
begin
   self.GestionBottonsDepense();
   PnlSaisieDetailDepense.Enabled:=False;
end;

procedure TFrmDepenses.FormResize(Sender: TObject);
var
  WidthDbedit : integer;
begin
  WidthDbedit :=Round((PnlSaisieDetailDepense.Width-5)/6);

  DBEdtMontant.Width:= WidthDbedit;
  DBCmbxBenigivaire.Width:= WidthDbedit;
  DBCmbxFacture.Width:= WidthDbedit;
  DBEdtNumDocument.Width:=WidthDbedit;
  DBDateOaiement.Width:=WidthDbedit;
  DBEdyObservation.Width:=WidthDbedit;

end;

end.

