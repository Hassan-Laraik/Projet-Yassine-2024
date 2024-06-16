unit uPersoAlertDialog;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TFrmPersoAlertDialog }

  TFrmPersoAlertDialog = class(TForm)
    PnlMessage: TPanel;
    BtnAvorter: TButton;
    BtnContinuer: TButton;
  private

  public
    procedure IntializePesoAlertDialog(Titre, Message, TitreAvorter,TitreContinu: string);
  end;

var
  FrmPersoAlertDialog: TFrmPersoAlertDialog;

implementation

{$R *.lfm}

{ TFrmPersoAlertDialog }

procedure TFrmPersoAlertDialog.IntializePesoAlertDialog(Titre,Message,TitreAvorter,TitreContinu:string);
begin
  self.Caption := Titre;
  self.PnlMessage .Caption:=  Message;
  self.BtnAvorter.Caption:= TitreAvorter;
  self.BtnContinuer.Caption:= TitreContinu;
end;

end.

