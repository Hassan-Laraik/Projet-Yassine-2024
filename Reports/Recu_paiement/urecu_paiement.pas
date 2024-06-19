unit uRecu_Paiement;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRecu }

  TFrmRecu = class(TForm)
    RLReportRecu: TRLReport;
    RLBand1: TRLBand;
    RLDraw2: TRLDraw;
    RLDraw1: TRLDraw;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel8: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLDraw3: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel11: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel10: TRLLabel;
    RLLabel4: TRLLabel;
  private

  public

  end;

var
  FrmRecu: TFrmRecu;

implementation
uses Udm;
{$R *.lfm}

end.

