unit UPrancipalepas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls;

type

  { TFrmprancipale }

  TFrmprancipale = class(TForm)
    Label1: TLabel;
    BtnSports: TLabel;
    BtnAdherents: TLabel;
    BtnInscription: TLabel;
    Image1: TImage;
    procedure BtnSportsClick(Sender: TObject);
    procedure BtnInscriptionClick(Sender: TObject);
    procedure BtnSportsMouseEnter(Sender: TObject);
    procedure BtnSportsMouseLeave(Sender: TObject);
    procedure BtnAdherentsMouseEnter(Sender: TObject);
    procedure BtnAdherentsMouseLeave(Sender: TObject);
    procedure BtnInscriptionMouseEnter(Sender: TObject);
    procedure BtnInscriptionMouseLeave(Sender: TObject);
    procedure BtnAdherentsClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
  private

  public

  end;

var
  Frmprancipale: TFrmprancipale;

implementation
uses Uadhesion;

{$R *.lfm}

{ TFrmprancipale }

procedure TFrmprancipale.BtnSportsClick(Sender: TObject);
begin
   FrmAdhesion.PnlSide.Visible:=false;
  FrmAdhesion.PageControl1.ActivePage := FrmAdhesion.TabSport;
  FrmAdhesion.ShowModal;
  FrmAdhesion.PnlSide.Visible:=True;
end;

procedure TFrmprancipale.BtnInscriptionClick(Sender: TObject);
begin
  FrmAdhesion.PageControl1.ActivePage := FrmAdhesion.TabListeAdhesion;
   FrmAdhesion.Show;
   FrmAdhesion.ShowOnTop;
end;

procedure TFrmprancipale.BtnSportsMouseEnter(Sender: TObject);
begin
   BtnSports.Cursor:=crHandPoint ;
  TLabel(sender).Font.Color:=$009568C0;
   TLabel(sender).Transparent:=true;
end;



procedure TFrmprancipale.BtnSportsMouseLeave(Sender: TObject);
begin
  TLabel(sender).Font.Color:=clWhite;
   TLabel(sender).Transparent:=true;
end;

procedure TFrmprancipale.BtnAdherentsMouseEnter(Sender: TObject);
begin
   BtnAdherents.Cursor:=crHandPoint ;
  TLabel(sender).Font.Color:=$009568C0;
   TLabel(sender).Transparent:=true;
end;

procedure TFrmprancipale.BtnAdherentsMouseLeave(Sender: TObject);
begin
  TLabel(sender).Font.Color:=clWhite;
   TLabel(sender).Transparent:=true;
end;

procedure TFrmprancipale.BtnInscriptionMouseEnter(Sender: TObject);
begin
   BtnInscription.Cursor:=crHandPoint ;
   TLabel(sender).Font.Color:=$009568C0;
   TLabel(sender).Transparent:=true;
end;

procedure TFrmprancipale.BtnInscriptionMouseLeave(Sender: TObject);
begin
   TLabel(sender).Font.Color:=clWhite;
   TLabel(sender).Transparent:=true;
end;

procedure TFrmprancipale.BtnAdherentsClick(Sender: TObject);
begin
  FrmAdhesion.PageControl1.ActivePage := FrmAdhesion.TabListeAdherents;
  FrmAdhesion.PnlAppliquerAdherentToAdhesion.Visible:=false;
  FrmAdhesion.BtnPaiement.Visible:=False;
  FrmAdhesion.ShowModal;
  FrmAdhesion.PnlAppliquerAdherentToAdhesion.Visible:=True;
  FrmAdhesion.BtnPaiement.Visible:=True;
end;

procedure TFrmprancipale.FormPaint(Sender: TObject);
//var
  //mypic: TBitMap;
begin
  //mypic := TBitMap.Create;
  //try
  //  mypic.LoadFromFile('./images/bodyfit.bmp');
  //  Frmprancipale.Canvas.Draw(0, 0, mypic);
  //finally
  //  FreeAndNil(mypic);
  //end;

end;

procedure TFrmprancipale.FormMouseEnter(Sender: TObject);
begin

end;

end.

