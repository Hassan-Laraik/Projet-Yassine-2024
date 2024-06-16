unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ExtDlgs, DB, ZConnection, ZDataset, ZAbstractRODataset;

type

  { TDM }

  TDM = class(TDataModule)
    ZNX: TZConnection;
    ZtblSport: TZTable;
    ZtblAdherent: TZTable;
    ZtblAdhesion: TZTable;
    DsPSort: TDataSource;
    DsAdherent: TDataSource;
    DsAdhesion: TDataSource;
    DsPaiement: TDataSource;
    ZtblAdhesioncin: TZRawStringField;
    ZtblAdhesionidsport: TZIntegerField;
    ZtblAdhesiondebut: TZDateField;
    ZtblAdhesionfin: TZDateField;
    ZtblAdhesionecheance: TZRawStringField;
    ZtblAdhesionmontant: TZDoubleField;
    ZtblAdhesionprix: TZDoubleField;
    ZtblSportidsport: TZIntegerField;
    ZtblSportlabel: TZRawStringField;
    ZtblSporttarif: TZDoubleField;
    OpenPictureAdherent: TOpenPictureDialog;
    ZtblAdhesionassurance: TZDoubleField;
    ZtblSportassurance: TZDoubleField;
    ZtblAdhesionTotalInscription: TFloatField;
    Ztbl_view_adherents: TZTable;
    DSview_adherents: TDataSource;
    ZtblPaiementNrecu: TZIntegerField;
    ZtblPaiementcin: TZRawStringField;
    ZtblPaiementidsport: TZIntegerField;
    ZtblPaiementdate_paiement: TZDateField;
    ZtblPaiementmontant: TZBCDField;
    ZtblPaiement: TZTable;
    ZtblPaiementlabel: TZRawStringField;
    ZReadQryPaiement: TZReadOnlyQuery;
    DSReadQryPaiement: TDataSource;
    ZtblPaiementsolde: TZSmallIntField;
    Ztbl_view_adherentscin: TZRawStringField;
    Ztbl_view_adherentsnom: TZRawStringField;
    Ztbl_view_adherentsprenom: TZRawStringField;
    Ztbl_view_adherentsadress: TZRawStringField;
    Ztbl_view_adherentstele: TZRawStringField;
    Ztbl_view_adherentssexe: TZRawStringField;
    Ztbl_view_adherentsnaissance: TZDateField;
    Ztbl_view_adherentsphoto: TZBlobField;
    Ztbl_view_adherentsdebut: TZDateField;
    Ztbl_view_adherentsfin: TZDateField;
    Ztbl_view_adherentslabel: TZRawStringField;

    procedure ZtblAdhesionprixChange(Sender: TField);
    procedure ZtblAdhesionprixValidate(Sender: TField);
    procedure ZtblAdhesionCalcFields(DataSet: TDataSet);
    procedure ZtblAdhesionTotalInscriptionGetText(Sender: TField;var aText: string;
                                                                         DisplayText: Boolean);
    procedure ZtblPaiementsoldeGetText(Sender: TField; var aText: string;DisplayText: Boolean);
  private

  public
//--------------Gestion Des Adhesions --------------------------------------//
    procedure AddAdhesion();
    procedure EditAdhesion();
    procedure CancelAdhesion();
    procedure DeleteAdhesion();

    procedure FirstAdhesion();
    procedure LastAdhesion();
    procedure PriorAdhesion();
    procedure NextAdhesion();


    function GetTotalAdhesion():Double;
    function GetEcheance: String;

    function RechercherAdhesiont(aRecherche : string):boolean;
    function FiltrerAdhesiont(aRecherche : string):boolean;

    function IsEditOrInsertAdhesion():Boolean;
    function ValidateAdhesion():Boolean;
    function IsInsertAdhesion() : Boolean ;
    function IsEditAdhesion() : Boolean  ;
    function IsBrowseAdhesion() : Boolean  ;

    Procedure CinAdherentToCinAdhesion();
    procedure CalculerDateFinAdhesion(aNombreMois : integer = 1);
    function ChargerPhotoAdherent(aphto:string):Boolean;

//--------------FIN Gestion Des Adhesions --------------------------------------------------------//

//--------------Gestion Des Adherents ------------------------------------------------------------//
    procedure AddAdherent();
    procedure EditAdherent();
    procedure CancelAdherent();
    procedure DeleteAdherent();

    procedure FirstAdherent();
    procedure LastAdherent();
    procedure PriorAdherent();
    procedure NextAdherent();

    function GetCinAdheren() : string;

    function ValidateAdherent():Boolean;
    function RechercherAdherent(aRecherche : string):boolean;

    function IsEditOrInsertAdherent():Boolean;
    function IsInsertAdherent() : Boolean ;
    function IsEditAdherent() : Boolean  ;
    function IsBrowseAdherent() : Boolean  ;

//--------------FIN Gestion Des Adherents --------------------------------------------------------//

//---------------------------------Gestion des sports---------------------------------------------//
    procedure AddSport();
    procedure EditSport();
    procedure CancelSport();
    procedure DeleteSport();

    procedure FirstSport();
    procedure LastSport();
    procedure PriorSport();
    procedure NextSport();

    function ValidateSport():Boolean;
    function RechercherSport(aRecherche : string):boolean;

    function IsBrowseSport():Boolean;
    function IsEditOrInsertSport():Boolean;

    procedure SportToAdhesion();

//---------------------------------IIN Gestion des sports-----------------------------------------//

//--------------------------------View Adherent --------------------------------------------------//
    function RechercherViewAdherent(aRecherche : string):boolean;
    function FiltrerViewAdherent(aRecherche : string):boolean;
//--------------------------------FIN View Adherent ----------------------------------------------//

//--------------------------------Paiement ------------------------------------------------------//
     function GetSoldePaiement() : Boolean;

     function IsBrowsePaiement() : Boolean;
     function IsEditOrInsertPaiemnt () : Boolean;

     function FiltrerPaiement(aRecherche : string):boolean;
     function AddSportToPaiement(aSport: string):Boolean;
     function ValiderPaiement(aSolde: Boolean): Boolean;
     function ModifierPaiement: Boolean;
     function DebitPaiement(aAdherent : string):Double;
     function CreditPaiement(aAdherent : string):Double;
     function DebitPaiement_(aAdherent : string):Tdataset;
     function CreditPaiement_(aAdherent: string):Tdataset;
     function SoldePaiement_(aAdherent,aSport : string):Double;


//-------------------------------FIN Paiement ----------------------------------------------------//
  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.AddAdhesion();
begin
  if self.ZtblAdhesion.State  in [dsInsert,dsEdit] then exit;
  self.ZtblAdhesion.Append;
end;

procedure TDM.CancelAdhesion();
begin
 if NOT (self.ZtblAdhesion.State  in [dsInsert,dsEdit]) then exit;
 self.ZtblAdhesion.Cancel;
end;

procedure TDM.DeleteAdhesion();
begin
   //
end;

procedure TDM.EditAdhesion();
begin
  if self.ZtblAdhesion.State  in [dsInsert,dsEdit] then exit;
  self.ZtblAdhesion.Edit;
end;

function TDM.IsBrowseAdhesion(): Boolean;
begin
   Result := (Self.ZtblAdhesion.State = dsBrowse);
end;

function TDM.IsEditAdhesion(): Boolean;
begin
  Result := (Self.ZtblAdhesion.State = dsEdit);
end;

function TDM.IsEditOrInsertAdhesion(): Boolean;
begin
  Result := (Self.ZtblAdhesion.State in [dsEdit,dsInsert]);
end;

function TDM.IsInsertAdhesion(): Boolean;
begin
  Result := (Self.ZtblAdhesion.State = dsInsert);
end;

function TDM.RechercherAdhesiont(aRecherche: string): boolean;
begin
  Result := False;
  if  not self.ZtblAdherent.IsEmpty then
  Result :=  self.ZtblAdherent.Locate('cin',trim(aRecherche),[loCaseInsensitive]);
end;

function TDM.ValidateAdhesion(): Boolean;
begin
   try
     if NOT(self.IsEditOrInsertAdhesion()) then exit;
     self.ZtblAdhesion.post;
     result := True;
   except
     result := false;
   end;
end;

procedure TDM.AddAdherent();
begin
  if self.ZtblAdherent.State  in [dsInsert,dsEdit] then exit;
  self.ZtblAdherent.Append;
end;

procedure TDM.CancelAdherent();
begin
   if NOT (self.ZtblAdherent.State  in [dsInsert,dsEdit]) then exit;
   self.ZtblAdherent.Cancel;
end;

procedure TDM.DeleteAdherent();
begin
  //
end;

procedure TDM.EditAdherent();
begin
  if self.ZtblAdherent.State  in [dsInsert,dsEdit] then exit;
  self.ZtblAdherent.edit;
end;

function TDM.IsBrowseAdherent(): Boolean;
begin
   Result := (Self.ZtblAdherent.State = dsBrowse);
end;

function TDM.IsEditAdherent(): Boolean;
begin
  Result := (Self.ZtblAdherent.State = dsEdit);
end;

function TDM.IsEditOrInsertAdherent(): Boolean;
begin
  Result := (Self.ZtblAdherent.State in [dsEdit,dsInsert]);
end;

function TDM.IsInsertAdherent(): Boolean;
begin
  Result := (Self.ZtblAdherent.State = dsInsert);
end;

function TDM.RechercherAdherent(aRecherche: string): boolean;
begin
  Result := False;
  if  not self.ZtblAdherent.IsEmpty then
  Result :=  self.ZtblAdherent.Locate('cin',trim(aRecherche),[loCaseInsensitive]);
end;

function TDM.ValidateAdherent(): Boolean;
begin
  try
     if NOT(self.IsEditOrInsertAdherent()) then exit;
     self.ZtblAdherent.post;
     result := True;
   except
     result := false;
   end;
end;

procedure TDM.CinAdherentToCinAdhesion();
begin
  ZtblAdhesion.FieldByName('cin').AsString:=
  ZtblAdherent.FieldByName('cin').AsString;
end;

procedure TDM.AddSport();
begin
  if self.ZtblSport.State  in [dsInsert,dsEdit] then exit;
  self.ZtblSport.Append;
end;

procedure TDM.CancelSport();
begin
  if NOT (self.ZtblSport.State  in [dsInsert,dsEdit]) then exit;
  self.ZtblSport.Cancel;
end;

procedure TDM.DeleteSport();
begin
  //
end;

procedure TDM.EditSport();
begin
  if self.ZtblSport.State  in [dsInsert,dsEdit] then exit;
  self.ZtblSport.edit;
end;

function TDM.ValidateSport(): Boolean;
begin
  try
     if NOT(self.IsEditOrInsertSport()) then exit;
     self.ZtblSport.post;
     result := True;
   except
     result := false;
   end;
end;

function TDM.IsEditOrInsertSport(): Boolean;
begin
  Result := (Self.ZtblSport.State in [dsEdit,dsInsert]);
end;

function TDM.RechercherSport(aRecherche: string): boolean;
begin
  Result := False;
  if  not self.ZtblSport.IsEmpty then
  Result :=  self.ZtblSport.Locate('label',trim(aRecherche),[loCaseInsensitive]);
end;

procedure TDM.CalculerDateFinAdhesion(aNombreMois: integer = 1);
begin
   if DM.IsEditOrInsertAdhesion() then
  begin
  self.ZtblAdhesion.FieldByName('fin').AsDateTime:=
       IncMonth( self.ZtblAdhesion.FieldByName('debut').AsDateTime,aNombreMois);

  self.ZtblAdhesion.FieldByName('montant').AsFloat:=
  self.ZtblAdhesion.FieldByName('prix').AsFloat * aNombreMois;
  end;
end;


function TDM.FiltrerAdhesiont(aRecherche: string): boolean;
begin
  Result := False;
  if  self.ZtblAdherent.IsEmpty then
  begin
   exit;
  end;
  Self.ZtblAdhesion.Filtered:=False;
  Self.ZtblAdhesion.Filter:= ' cin like'+ QuotedStr(aRecherche+'*');
  Self.ZtblAdhesion.Filtered:=True;
  Result := ( Self.ZtblAdhesion.RecordCount > 0);
end;

function TDM.ChargerPhotoAdherent(aphto: string): Boolean;
var FS: TFileStream;
begin
  Result := False;
  if self.ZtblAdherent.State = dsBrowse then exit;
  if OpenPictureAdherent.Execute then
  begin
     try
      FS := TFileStream.Create(OpenPictureAdherent.FileName, fmOpenRead);
      fs.Position:=0;
      TBlobField(self.ZtblAdherent.FieldByName('photo')).LoadFromStream(FS);
      Result := true;
     finally;
      FS.Free;
     end;
  end;
end;

procedure TDM.ZtblAdhesionprixChange(Sender: TField);
begin

end;

procedure TDM.ZtblAdhesionprixValidate(Sender: TField);
begin
 //
end;

procedure TDM.FirstAdhesion();
begin
  if Not self.IsBrowseAdhesion() then exit;
  self.ZtblAdhesion.First;
end;

procedure TDM.LastAdhesion();
begin
  if Not self.IsBrowseAdhesion() then exit;
  self.ZtblAdhesion.Last;
end;

procedure TDM.NextAdhesion();
begin
   if Not self.IsBrowseAdhesion() then exit;
   self.ZtblAdhesion.Next;
end;

procedure TDM.PriorAdhesion();
begin
   if Not self.IsBrowseAdhesion() then exit;
   self.ZtblAdhesion.Prior;
end;

procedure TDM.ZtblAdhesionCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('TotalInscription').AsFloat:=
  DataSet.FieldByName('montant').AsFloat +  DataSet.FieldByName('assurance').AsFloat;
end;

procedure TDM.ZtblAdhesionTotalInscriptionGetText(Sender: TField;var aText: string;
                                                                           DisplayText: Boolean);
var
  TotalInscription ,Echeance: string;
begin
  TotalInscription := FloatToStr(DM.GetTotalAdhesion());
  Echeance :=  DM.GetEcheance();
  aText :=  TotalInscription + ' Dirhame Pour ' + Echeance  ;
end;

function TDM.IsBrowseSport(): Boolean;
begin
   Result := (Self.ZtblSport.State = dsBrowse);
end;

procedure TDM.FirstSport();
begin
  if Not self.IsBrowseSport() then exit;
  self.ZtblSport.First;
end;

procedure TDM.LastSport();
begin
   if Not self.IsBrowseSport() then exit;
  self.ZtblSport.Last;
end;

procedure TDM.NextSport();
begin
   if Not self.IsBrowseSport() then exit;
  self.ZtblSport.Next;
end;

procedure TDM.PriorSport();
begin
  if Not self.IsBrowseSport() then exit;
  self.ZtblSport.Prior;
end;

procedure TDM.FirstAdherent();
begin
  if Not self.IsBrowseAdherent() then exit;
  self.ZtblAdherent.First;
end;

procedure TDM.LastAdherent();
begin
  if Not self.IsBrowseAdherent() then exit;
  self.ZtblAdherent.Last;
end;

procedure TDM.NextAdherent();
begin
   if Not self.IsBrowseAdherent() then exit;
  self.ZtblAdherent.Next;
end;

procedure TDM.PriorAdherent();
begin
  if Not self.IsBrowseAdherent() then exit;
  self.ZtblAdherent.Prior;
end;

function TDM.RechercherViewAdherent(aRecherche: string): boolean;
begin
  DM.Ztbl_view_adherents.Refresh;
  Result := DM.Ztbl_view_adherents.Locate('cin',aRecherche,[loCaseInsensitive]) ;
end;

function TDM.FiltrerPaiement(aRecherche: string): boolean;
begin
 Result:= false;
 dm.ZtblPaiement.Filtered:=false;
 dm.ZtblPaiement.Filter := 'cin = '+QuotedStr(aRecherche);
 dm.ZtblPaiement.Filtered:=True;
 Result := (DM.ZtblPaiement.RecordCount > 0);
end;

function TDM.AddSportToPaiement(aSport: string): Boolean;
begin

 try
 self.ZtblPaiement.Append;
 self.ZtblPaiement.FieldByName('cin').AsString:=dm.ZtblAdhesion.FieldByName('cin').AsString;
 self.ZtblPaiement.FieldByName('idsport').AsString:=dm.ZtblAdhesion.FieldByName('idsport').AsString;
 self.ZtblPaiement.FieldByName('label').AsString:=aSport;
 self.ZtblPaiement.FieldByName('date_paiement').AsDateTime:=date;
 self.ZtblPaiement.FieldByName('montant').AsFloat :=dm.ZtblAdhesion.FieldByName('prix').AsFloat;
 result:=True;
 except
   result := false
 end;

end;

function TDM.ValiderPaiement(aSolde:Boolean): Boolean;
begin
 if NOT (DM.ZtblPaiement.State in [dsInsert,dsEdit]) then exit ;
  try
  DM.ZtblPaiement.FieldByName('solde').AsBoolean:=aSolde;
    DM.ZtblPaiement.Post;
   DM.ZtblAdhesion.Refresh;
   Result := True;
  except
    Result := False;
  end;
end;

function TDM.CreditPaiement(aAdherent: string): Double;
begin
 result := 0;
 self.ZReadQryPaiement.Close;
 self.ZReadQryPaiement.SQL.Clear;
 self.ZReadQryPaiement.sql.Add('select * from credit_adhesion  where cin =:cin');
 self.ZReadQryPaiement.ParamByName('cin').AsString:=aAdherent;
 self.ZReadQryPaiement.Open;
 Result:=  self.ZReadQryPaiement.FieldByName('somme').AsFloat;
end;

function TDM.DebitPaiement(aAdherent: string): Double;

begin
   //Total des montants a payer
 result := 0;
 self.ZReadQryPaiement.Close;
 self.ZReadQryPaiement.SQL.Clear;
 self.ZReadQryPaiement.sql.Add('select * from debit_adhesion  where cin =:cin');
 self.ZReadQryPaiement.ParamByName('cin').AsString:=aAdherent;
 self.ZReadQryPaiement.Open;
 Result:=  self.ZReadQryPaiement.FieldByName('somme').AsFloat;
end;



function TDM.CreditPaiement_(aAdherent: string): Tdataset;

begin
 result := nil;
 self.ZReadQryPaiement.Close;
 self.ZReadQryPaiement.SQL.Clear;
 self.ZReadQryPaiement.sql.Add('select * from credit_adhesion  where cin =:cin');
 self.ZReadQryPaiement.ParamByName('cin').AsString:=aAdherent;
 self.ZReadQryPaiement.Open;
 Result:=  self.ZReadQryPaiement;

end;

function TDM.DebitPaiement_(aAdherent: string): Tdataset;
begin
 result := nil;
  self.ZReadQryPaiement.Close;
  self.ZReadQryPaiement.SQL.Clear;
  self.ZReadQryPaiement.sql.Add('select * from debit_adhesion_sport  where cin =:cin');
  self.ZReadQryPaiement.ParamByName('cin').AsString:=aAdherent;
  self.ZReadQryPaiement.Open;
  Result:=  self.ZReadQryPaiement;
end;

function TDM.SoldePaiement_(aAdherent, aSport: string): Double;
begin
   //pour sport  // pour adheren
end;


procedure TDM.ZtblPaiementsoldeGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
    if sender.AsInteger = 1 then aText:='Soldé' else  aText:='Non Soldé' ;
    DisplayText := true;
end;

function TDM.IsBrowsePaiement(): Boolean;
begin
  Result := (Self.ZtblPaiement.State = dsBrowse);
end;

function TDM.IsEditOrInsertPaiemnt(): Boolean;
begin
  Result := (Self.ZtblPaiement.State in [dsEdit,dsInsert]);
end;

procedure TDM.SportToAdhesion();
begin
    dm.ZtblAdhesion.FieldByName('prix').AsFloat:=
                                                    dm.ZtblSport.FieldByName('tarif').AsFloat ;
  dm.ZtblAdhesion.FieldByName('assurance').AsFloat:=
                                                    dm.ZtblSport.FieldByName('assurance').AsFloat ;
end;

function TDM.GetCinAdheren(): string;
begin
  Result :=  DM.ZtblAdhesion.FieldByName('cin').AsString;
end;

function TDM.FiltrerViewAdherent(aRecherche: string): boolean;
begin
   DM.Ztbl_view_adherents.Active:=true;
   DM.Ztbl_view_adherents.Filtered:=False;
   DM.Ztbl_view_adherents.Filter:='cin = '+QuotedStr(aRecherche);
   DM.Ztbl_view_adherents.Filtered:=true;

   Result := (DM.Ztbl_view_adherents.RecordCount > 0);
end;

function TDM.ModifierPaiement(): Boolean;
begin
  Result := False;
  if self.GetSoldePaiement() then exit ;
  if NOT self.IsEditOrInsertPaiemnt() then
  begin
  self.ZtblPaiement.Edit;
  Result := True;
  end;

end;

function TDM.GetSoldePaiement(): Boolean;
begin
    Result := self.ZtblPaiement.FieldByName('solde').AsBoolean;
end;

function TDM.GetTotalAdhesion(): Double;
begin
   Result := self.ZtblAdhesion.FieldByName('TotalInscription').AsFloat;
end;

function TDM.GetEcheance(): String;
begin
 Result := self.ZtblAdhesion.FieldByName('echeance').AsString;
end;




end.






