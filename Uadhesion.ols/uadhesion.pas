unit Uadhesion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  DBGrids, StdCtrls, DBCtrls, EditBtn, DBExtCtrls, DBDateTimePicker, Grids,
  ExtDlgs, dbcntrlgrid, db;

type

  { TFrmAdhesion }

  TFrmAdhesion = class(TForm)
    Adhesion: TPanel;
    BtnPriorAdherent: TButton;
    BtnLast: TButton;
    BtnFirstAdherent: TButton;
    BtnNextAdherent: TButton;
    BtnLasrAdherent: TButton;
    BtnValiderAdherent: TButton;
    BtnAnnulerAdherent: TButton;
    BtnPrior: TButton;
    BtnFirst: TButton;
    BtnNext: TButton;
    DBGridAdhesion: TDBGrid;
    DBGrid2: TDBGrid;
    EdtRechercheAdhesion: TEdit;
    PageControl1: TPageControl;
    PnlEditerAdherent: TPanel;
    Panel12: TPanel;
    PnlEditerDetailAdhesion: TPanel;
    PnlEditAdhesion: TPanel;
    Panel15: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TabListeAdherents: TTabSheet;
    TabDetailAdherent: TTabSheet;
    TabListeAdhesion: TTabSheet;
    Panel5: TPanel;
    Panel11: TPanel;
    Gsm: TLabel;
    DBEdtGsm: TDBEdit;
    Panel10: TPanel;
    Email: TLabel;
    DBEdtEmail: TDBEdit;
    Panel9: TPanel;
    Adresse: TLabel;
    DBEdtAdresse: TDBEdit;
    Panel8: TPanel;
    Cin: TLabel;
    DBEdtCin: TDBEdit;
    Panel7: TPanel;
    Date_naissance: TLabel;
    Panel6: TPanel;
    Prenom: TLabel;
    DBEdtPrenom: TDBEdit;
    Panel26: TPanel;
    Nom: TLabel;
    DBEdtNom: TDBEdit;
    Panel27: TPanel;
    Panel28: TPanel;
    TabSport: TTabSheet;
    Panel29: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    BtnPriorSport: TButton;
    BtnFirstSport: TButton;
    BtnNextSport: TButton;
    BtnLastport: TButton;
    EdtRechercheSport: TEdit;
    Panel16: TPanel;
    DbedtSport: TDBLookupComboBox;
    DbedtDebut: TDBDateTimePicker;
    DbedtFin: TDBDateTimePicker;
    PnlCinAdhesion: TPanel;
    BtnEditerAdherent: TButton;
    DateEdtDate_naissance: TDBDateTimePicker;
    DBedtMontant: TDBEdit;
    DBComboEcheance: TDBComboBox;
    DBedtPrix: TDBEdit;
    DBText1: TDBText;
    Panel4: TPanel;
    DBImage: TDBImage;
    Panel13: TPanel;
    Cin1: TLabel;
    Panel30: TPanel;
    Nom1: TLabel;
    Panel19: TPanel;
    Prenom1: TLabel;
    Panel20: TPanel;
    Date_naissance1: TLabel;
    Panel21: TPanel;
    Gsm1: TLabel;
    Panel22: TPanel;
    Email1: TLabel;
    DBEdtCin1: TDBText;
    DBEdtNom1: TDBText;
    DBEdtPrenom1: TDBText;
    DateEdtDate_naissance1: TDBText;
    DBEdtGsm1: TDBText;
    DBEdtEmail1: TDBText;
    BtnCharger: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    BtnDecharger: TButton;
    BTnNouveauAdhesion: TButton;
    BtnModifierAdhesion: TButton;
    BtnValiderAdhesion: TButton;
    BtnAnnulerValidation: TButton;
    DBedtAssurance: TDBEdit;
    BtnNouveauAdherent: TButton;
    BtnModiferAdherent: TButton;
    EdtRechercheAdherent: TEdit;
    DBEdtCinAdhesion: TDBLookupComboBox;
    BtnAppliquer: TButton;
    BtnNouveauSport: TButton;
    BtnModifierSport: TButton;
    BtnValiderSport: TButton;
    BtnAnnulerSport: TButton;
    DBGrid1: TDBGrid;
    BtnImprimerCarte: TButton;
    Panel1: TPanel;
    DBedtTotal: TDBText;
    BtnPaiement: TButton;
    TabPaiement: TTabSheet;
    DBCntrlGrid1: TDBCntrlGrid;
    Panel14: TPanel;
    DBText2: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBDateTimePicker1: TDBDateTimePicker;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    procedure BTnNouveauAdhesionClick(Sender: TObject);
    procedure BtnModifierAdhesionClick(Sender: TObject);
    procedure BtnValiderAdhesionClick(Sender: TObject);
    procedure BtnAnnulerValidationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure EdtRechercheAdhesionChange(Sender: TObject);
    procedure EdtRechercheAdhesionKeyPress(Sender: TObject; var Key: char);
    procedure BtnEditerAdherentClick(Sender: TObject);
    procedure BtnAppliquerClick(Sender: TObject);
    procedure BtnNouveauAdherentClick(Sender: TObject);
    procedure BtnModiferAdherentClick(Sender: TObject);
    procedure BtnValiderAdherentClick(Sender: TObject);
    procedure BtnAnnulerAdherentClick(Sender: TObject);
    procedure EdtRechercheAdherentKeyPress(Sender: TObject; var Key: char);
    procedure BtnNouveauSportClick(Sender: TObject);
    procedure BtnModifierSportClick(Sender: TObject);
    procedure BtnValiderSportClick(Sender: TObject);
    procedure BtnAnnulerSportClick(Sender: TObject);
    procedure EdtRechercheSportKeyPress(Sender: TObject; var Key: char);
    procedure DBGridAdhesionSelectEditor(Sender: TObject; Column: TColumn;var Editor: TWinControl);
    procedure BtnChargerClick(Sender: TObject);
    procedure BtnDechargerClick(Sender: TObject);
    procedure Cin1Click(Sender: TObject);
    procedure DbedtSportSelect(Sender: TObject);
    procedure DBComboEcheanceSelect(Sender: TObject);
    procedure BtnFirstClick(Sender: TObject);
    procedure BtnPriorClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnLastClick(Sender: TObject);
    procedure DBGrid1EditingDone(Sender: TObject);
    procedure BtnFirstSportClick(Sender: TObject);
    procedure BtnPriorSportClick(Sender: TObject);
    procedure BtnNextSportClick(Sender: TObject);
    procedure BtnLastportClick(Sender: TObject);
    procedure BtnFirstAdherentClick(Sender: TObject);
    procedure BtnPriorAdherentClick(Sender: TObject);
    procedure BtnNextAdherentClick(Sender: TObject);
    procedure BtnLasrAdherentClick(Sender: TObject);
    procedure BtnImprimerCarteClick(Sender: TObject);
    procedure AdhesionClick(Sender: TObject);
    procedure BtnPaiementClick(Sender: TObject);
  private
    function ValiderSaisieAdhesion(): boolean;
    procedure GestionBottonsAdhesion;
    procedure GestionBottonsAdherent;
    procedure GestionBottonsSports;
    procedure ChargerPhoto;
    procedure EffacerPhoto;
  public

  end;

var
  FrmAdhesion: TFrmAdhesion;

implementation
 uses uDM,uPersoAlertDialog,uCarte_Adherent;
{$R *.lfm}

 { TFrmAdhesion }

 procedure TFrmAdhesion.BTnNouveauAdhesionClick(Sender: TObject);
 begin
   DM.AddAdhesion();
   self.GestionBottonsAdhesion;
 end;

procedure TFrmAdhesion.BtnModifierAdhesionClick(Sender: TObject);
begin
  DM.EditAdhesion();
  self.GestionBottonsAdhesion;
end;

procedure TFrmAdhesion.BtnValiderAdhesionClick(Sender: TObject);
var
   Reponse : word;
begin
   if  NOT self.ValiderSaisieAdhesion() then
   begin
     exit;
   end;

   if dm.ValidateAdhesion() = true then
   begin
     showmessage('Operation sur  Adhesion Effectuée avec succes');
   end
   else
   begin
    FrmPersoAlertDialog.Caption := 'Alert';
    FrmPersoAlertDialog.PnlMessage.Caption :='Operation Non Effectuée !';
    Reponse := FrmPersoAlertDialog.ShowModal;

    case Reponse of
      mrAbort : DM.CancelAdhesion();
      mrRetry : DM.EditAdhesion();
    end;

    DBGridAdhesion.Enabled := false;
   end;

   self.GestionBottonsAdhesion;
end;

procedure TFrmAdhesion.BtnAnnulerValidationClick(Sender: TObject);
begin
  DM.CancelAdhesion();
  self.GestionBottonsAdhesion;
end;

procedure TFrmAdhesion.GestionBottonsAdhesion;
begin
  BTnNouveauAdhesion.Enabled:=dm.IsBrowseAdhesion();
  BtnModifierAdhesion.Enabled:=dm.IsBrowseAdhesion();
  BtnAnnulerValidation.Enabled:=dm.IsEditOrInsertAdhesion();
  BtnValiderAdhesion.Enabled:=dm.IsEditOrInsertAdhesion();
  PnlEditerDetailAdhesion.Enabled:=DM.IsEditOrInsertAdhesion();
end;

function TFrmAdhesion.ValiderSaisieAdhesion(): boolean;
begin
  Result := False;
  if   Length(trim(DBEdtCinAdhesion.Text)) < 1 then
  begin
    ShowMessage('Cin Adhrenet Obligatoire');
    DBEdtCinAdhesion.SetFocus;
    exit;
  end;
   if   Length(trim(DbedtSport.Text)) < 1 then
  begin
    ShowMessage('Sport Obligatoire');
    DbedtSport.SetFocus;
    exit;
  end;

  if   Length(trim(DBComboEcheance.Text)) < 1 then
  begin
    ShowMessage('Echeace Obligatoire');
    DBComboEcheance.SetFocus;
    exit;
  end;

    if   Length(trim(DBedtMontant.Text)) < 1 then
  begin
    ShowMessage('Montant Obligatoire');
    DBedtMontant.SetFocus;
    exit;
  end;

  if   DBedtMontant.Field.AsFloat <= 0 then
  begin
    ShowMessage('Echeace Non Nul');
    DBedtMontant.SetFocus;
    exit;
  end;

  Result := True;
end;

procedure TFrmAdhesion.FormCreate(Sender: TObject);
begin
  self.GestionBottonsAdhesion;
  //self.GestionBottonsAdhesion;
  self.GestionBottonsSports;
end;

procedure TFrmAdhesion.FormResize(Sender: TObject);
var
  WidthDbedit : integer;
begin
  WidthDbedit :=Round((PnlEditerDetailAdhesion.Width-5)/8);
  PnlCinAdhesion.Width:= WidthDbedit;
  DbedtSport.Width:= WidthDbedit;
  DbedtDebut.Width:= WidthDbedit;
  DbedtFin.Width:= WidthDbedit;
  DBComboEcheance.Width:=WidthDbedit;
  DBedtMontant.Width:=WidthDbedit;
  DBedtPrix.Width:=WidthDbedit;
  DBedtAssurance.Width :=WidthDbedit;
end;

procedure TFrmAdhesion.EdtRechercheAdhesionChange(Sender: TObject);
begin
  self.GestionBottonsAdhesion;
end;

procedure TFrmAdhesion.EdtRechercheAdhesionKeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  begin
    if NOT  DM.FiltrerAdhesiont(EdtRechercheAdhesion.Text) then
    begin
    ShowMessage('Adhesion Non Trouvées !!')
    end;
  end;
end;

procedure TFrmAdhesion.BtnEditerAdherentClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabListeAdherents;
end;

procedure TFrmAdhesion.BtnAppliquerClick(Sender: TObject);
begin
  if NOT DM.IsEditOrInsertAdhesion() then Exit;
  DM.CinAdherentToCinAdhesion();
  PageControl1.ActivePage := TabListeAdhesion;
end;

procedure TFrmAdhesion.BtnNouveauAdherentClick(Sender: TObject);
begin
  DM.AddAdherent();
  PageControl1.ActivePage:=TabDetailAdherent;
end;

procedure TFrmAdhesion.BtnModiferAdherentClick(Sender: TObject);
begin
  DM.EditAdherent();
  PageControl1.ActivePage:=TabDetailAdherent;
end;

procedure TFrmAdhesion.BtnValiderAdherentClick(Sender: TObject);
var
  Reponse : Word;
begin
  if DM.ValidateAdherent() then
  begin
    ShowMessage('Operation effectuée');
    PageControl1.ActivePage:=TabListeAdherents;
  end else
  begin
    FrmPersoAlertDialog.Caption := 'Alert';
    FrmPersoAlertDialog.PnlMessage.Caption :='Operation Non Effectuée !';
    Reponse := FrmPersoAlertDialog.ShowModal;

     case Reponse of
      mrAbort :
        begin
         DM.CancelAdherent();
         PageControl1.ActivePage:=TabListeAdherents;
        end;
      mrRetry : DM.EditAdherent();
     end;

  end;
end;

procedure TFrmAdhesion.BtnAnnulerAdherentClick(Sender: TObject);
begin
  DM.CancelAdherent();
  PageControl1.ActivePage:=TabListeAdherents;
end;

procedure TFrmAdhesion.EdtRechercheAdherentKeyPress(Sender: TObject;
  var Key: char);
begin
 if key = #13 then
  begin
    if NOT  DM.RechercherAdherent(EdtRechercheAdherent.Text) then
    begin
    ShowMessage('Cet Adherent Est Non Enregistrée !!')
    end;
  end;
end;

procedure TFrmAdhesion.GestionBottonsAdherent;
begin
  BtnNouveauAdherent.Enabled:=dm.IsBrowseAdherent();
  BtnModifierAdhesion.Enabled:=dm.IsBrowseAdherent();
  BtnAnnulerAdherent.Enabled:=dm.IsEditOrInsertAdherent();
  BtnValiderAdherent.Enabled:=dm.IsEditOrInsertAdherent();
end;

procedure TFrmAdhesion.BtnNouveauSportClick(Sender: TObject);
begin
  DM.AddSport();
  self.GestionBottonsSports;
end;

procedure TFrmAdhesion.BtnModifierSportClick(Sender: TObject);
begin
  DM.EditSport();
  self.GestionBottonsSports;
end;

procedure TFrmAdhesion.BtnValiderSportClick(Sender: TObject);
begin
  if  DM.ValidateSport() = true then
  begin
     ShowMessage('Operation Effectuée !');
  end;
   self.GestionBottonsSports;
end;

procedure TFrmAdhesion.BtnAnnulerSportClick(Sender: TObject);
begin
  dm.CancelSport();
  self.GestionBottonsSports;
end;

procedure TFrmAdhesion.EdtRechercheSportKeyPress(Sender: TObject; var Key: char
  );
begin
  if key = #13 then
    begin
      if NOT  DM.RechercherSport(EdtRechercheSport.Text) then
      begin
      ShowMessage('Ce Sport Est Non Enregistrée !!')
      end;
    end;
end;


procedure TFrmAdhesion.DBGridAdhesionSelectEditor(Sender: TObject;
  Column: TColumn; var Editor: TWinControl);
begin
  if DM.ZtblAdhesion.State  in [dsBrowse] then
  begin
    Dm.ZtblAdherent.Locate('cin',dm.ZtblAdhesion.FieldByName('cin').AsString ,[]);
  end;
end;

procedure TFrmAdhesion.BtnChargerClick(Sender: TObject);
begin
  //if DM.ZtblAdherent.state in [dsBrowse]  then
  if DM.IsBrowseAdherent()  then
  begin
    DM.EditAdherent();
    self.ChargerPhoto;
    DM.ValidateAdherent();
    exit;
  end;

  if DM.IsEditOrInsertAdherent()  then
  begin
    self.ChargerPhoto;
  end;

end;

procedure TFrmAdhesion.ChargerPhoto;
begin
  if OpenPictureDialog1.Execute then
  begin
   //TBlobField(DM.ZtbProduit.FieldByName('photo')).LoadFromFile(DM.OpenPictureDialog1.FileName);
   DBImage.Visible := false;
   DBImage.Picture.LoadFromFile(OpenPictureDialog1.FileName);
   DBImage.Visible := true;
  end ;
  {else
  begin
   //if DM.IsInsertAdherent() then
   DBImage.Picture.Assign(nil);
  end;
 }
end;

procedure TFrmAdhesion.BtnDechargerClick(Sender: TObject);
begin
 if DM.ZtblAdherent.state in [dsInsert,dsEdit] then
 begin
  self.EffacerPhoto;
  exit;
 end;
 if DM.ZtblAdherent.state in [dsBrowse] then
 begin
  DM.ZtblAdherent.Edit;
  self.EffacerPhoto;
  DM.ZtblAdherent.Post;;
  exit;
 end;
end;

procedure TFrmAdhesion.EffacerPhoto;
begin
  DBImage.Picture.Assign(nil);
end;

procedure TFrmAdhesion.Cin1Click(Sender: TObject);
begin

end;



procedure TFrmAdhesion.DbedtSportSelect(Sender: TObject);
begin
  dm.ZtblAdhesion.FieldByName('prix').AsFloat:=
                                                    dm.ZtblSport.FieldByName('tarif').AsFloat ;
  dm.ZtblAdhesion.FieldByName('assurance').AsFloat:=
                                                    dm.ZtblSport.FieldByName('assurance').AsFloat ;

end;

procedure TFrmAdhesion.DBComboEcheanceSelect(Sender: TObject);
begin
    case DBComboEcheance.ItemIndex of
    0:  DM.CalculerDateFinAdhesion(1);
    1:  DM.CalculerDateFinAdhesion(2);
    2:  DM.CalculerDateFinAdhesion(3);
    3:  DM.CalculerDateFinAdhesion(6);
    4:  DM.CalculerDateFinAdhesion(9);
    5:  DM.CalculerDateFinAdhesion(12);
    6:  DM.CalculerDateFinAdhesion(4);
    7:  DM.CalculerDateFinAdhesion(5);
    8:  DM.CalculerDateFinAdhesion(7);
    9:  DM.CalculerDateFinAdhesion(8);
    10: DM.CalculerDateFinAdhesion(10);
    11: DM.CalculerDateFinAdhesion(11);
  else ;
  end;
end;

procedure TFrmAdhesion.BtnFirstClick(Sender: TObject);
begin
  DM.FirstAdhesion();
end;

procedure TFrmAdhesion.BtnPriorClick(Sender: TObject);
begin
  DM.PriorAdhesion();
end;

procedure TFrmAdhesion.BtnNextClick(Sender: TObject);
begin
  DM.NextAdhesion();
end;

procedure TFrmAdhesion.BtnLastClick(Sender: TObject);
begin
  DM.LastAdhesion();
end;

procedure TFrmAdhesion.GestionBottonsSports;
begin
   BtnNouveauSport.Enabled:=dm.IsBrowseSport();
  BtnModifierSport.Enabled:=dm.IsBrowseSport();
  BtnAnnulerSport.Enabled:=dm.IsEditOrInsertSport();
  BtnValiderSport.Enabled:=dm.IsEditOrInsertSport();
end;

procedure TFrmAdhesion.DBGrid1EditingDone(Sender: TObject);
begin
  self.GestionBottonsSports;
end;

procedure TFrmAdhesion.BtnFirstSportClick(Sender: TObject);
begin
  dm.FirstSport();
end;

procedure TFrmAdhesion.BtnPriorSportClick(Sender: TObject);
begin
  DM.PriorSport();
end;

procedure TFrmAdhesion.BtnNextSportClick(Sender: TObject);
begin
  DM.NextSport();
end;

procedure TFrmAdhesion.BtnLastportClick(Sender: TObject);
begin
  DM.LastSport();
end;

procedure TFrmAdhesion.BtnFirstAdherentClick(Sender: TObject);
begin
  DM.FirstAdherent();
end;

procedure TFrmAdhesion.BtnPriorAdherentClick(Sender: TObject);
begin
  DM.PriorAdherent();
end;

procedure TFrmAdhesion.BtnNextAdherentClick(Sender: TObject);
begin
  DM.NextAdherent();
end;

procedure TFrmAdhesion.BtnLasrAdherentClick(Sender: TObject);
begin
  DM.LastAdherent();
end;

procedure TFrmAdhesion.BtnImprimerCarteClick(Sender: TObject);
var
  cin_adh : string;
begin
 cin_adh:= DM.ZtblAdhesion.FieldByName('cin').AsString;
   DM.Ztbl_view_adherents.Active:=true;
   DM.Ztbl_view_adherents.Filtered:=False;
   DM.Ztbl_view_adherents.Filter:='cin = '+QuotedStr(cin_adh);
   DM.Ztbl_view_adherents.Filtered:=true;

  // DM.Ztbl_view_adherents.Locate('cin',DM.ZtblAdhesion.FieldByName('cin').AsString,[]);
   DM.Ztbl_view_adherents.Locate('cin',cin_adh,[loCaseInsensitive]);
   //FrmCarteAdherent.RLReport1.Prepare;
   FrmCarteAdherent.RLReport1.PreviewModal;
   DM.Ztbl_view_adherents.Active:=False;
end;

procedure TFrmAdhesion.AdhesionClick(Sender: TObject);
begin
  scaleBy(90,100)
end;

procedure TFrmAdhesion.BtnPaiementClick(Sender: TObject);
begin
    PageControl1.ActivePage := TabPaiement;
end;

end.

