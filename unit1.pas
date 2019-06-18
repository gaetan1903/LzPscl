unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

  Voi = record
    typeV: String;
    Marque: String;
    CIN_propri: Integer;
  end;

  Pers = record
    Nom, Prenom, Adresse: String;
    CIN: Integer;
  end;

  tab_V = array [1..50] of Voi;
  tab_P = array [1..50] of Pers;

var
  Form1: TForm1;

  Personne: tab_P;
  Voiture: tab_V;
  nbrPersonne: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin


end;

end.

