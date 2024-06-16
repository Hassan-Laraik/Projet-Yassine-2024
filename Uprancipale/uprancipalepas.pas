unit UPrancipalepas;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TFrmprancipale }

  TFrmprancipale = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    BtnSports: TLabel;
    BtnAdherents: TLabel;
    BtnInscription: TLabel;
    procedure BtnSportsClick(Sender: TObject);
    procedure BtnInscriptionClick(Sender: TObject);
    procedure BtnSportsMouseEnter(Sender: TObject);
    procedure BtnSportsMouseLeave(Sender: TObject);
    procedure BtnAdherentsMouseEnter(Sender: TObject);
    procedure BtnAdherentsMouseLeave(Sender: TObject);
    procedure BtnInscriptionMouseEnter(Sender: TObject);
    procedure BtnInscriptionMouseLeave(Sender: TObject);
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

end;

procedure TFrmprancipale.BtnInscriptionClick(Sender: TObject);
begin
   FrmAdhesion.Show;
   FrmAdhesion.ShowOnTop;
end;

procedure TFrmprancipale.BtnSportsMouseEnter(Sender: TObject);
begin
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
  TLabel(sender).Font.Color:=$009568C0;
   TLabel(sender).Transparent:=true;
end;

procedure TFrmprancipale.BtnInscriptionMouseLeave(Sender: TObject);
begin
  TLabel(sender).Font.Color:=clWhite;
   TLabel(sender).Transparent:=true;
end;

end.

