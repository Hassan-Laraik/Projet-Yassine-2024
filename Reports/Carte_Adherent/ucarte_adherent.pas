unit uCarte_Adherent;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport, RLBarcode,
  RLPDFFilter, db;

type

  { TFrmCarteAdherent }

  TFrmCarteAdherent = class(TForm)
    RLReport1: TRLReport;
    DataSource1: TDataSource;
    RLLabelPrenom: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLBand1: TRLBand;
    RLLabelCin: TRLLabel;
    RLLabelNom: TRLLabel;
    RLLabelDebut1: TRLLabel;
    RLLabelDebut4: TRLLabel;
    RLLabelDebut5: TRLLabel;
    RLLabelDebut6: TRLLabel;
    RLLabelSexe: TRLLabel;
    Picture1: TRLImage;
    RLDraw1: TRLDraw;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLBand3: TRLBand;
    RLLabelDebut2: TRLLabel;
    RLLabelDebut3: TRLLabel;
    RLLabelDebut7: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabelDebut8: TRLLabel;
    RLBand4: TRLBand;

    procedure Picture1BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: boolean);
  private

  public

  end;

var
  FrmCarteAdherent: TFrmCarteAdherent;

implementation
    uses UDM;
{$R *.lfm}

    { TFrmCarteAdherent }




procedure TFrmCarteAdherent.Picture1BeforePrint(Sender: TObject;var PrintIt: boolean);
begin
end;

procedure TFrmCarteAdherent.RLReport1BeforePrint(Sender: TObject;var PrintIt: boolean);
 var
   imgPrt: TStream;
 begin

     imgPrt := TMemoryStream.Create;
     Picture1.Picture.Clear;
     imgPrt:=
     DM.Ztbl_view_adherents.CreateBlobStream(DM.Ztbl_view_adherents.FieldByName('photo'), bmRead);
     Picture1.Picture.LoadFromStream(imgPrt);

     RLLabelCin.Caption:=DM.Ztbl_view_adherents.FieldByName('cin').AsString;
     RLLabelNom.Caption:=DM.Ztbl_view_adherents.FieldByName('nom').AsString +'   '+DM.Ztbl_view_adherents.FieldByName('prenom').AsString;
     RLLabelSexe.Caption:=DM.Ztbl_view_adherents.FieldByName('sexe').AsString;
    // RLLabelDebut.Caption:=DM.Ztbl_view_adherents.FieldByName('debut').AsString;
     //RLLabelFin.Caption:=DM.Ztbl_view_adherents.FieldByName('fin').AsString;

     imgPrt.Free;
end;




end.

