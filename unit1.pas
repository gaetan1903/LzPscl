unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
    CIN, voitures: integer;
  end;

  tab_V = array [1..50] of Voi;
  tab_P = array [1..50] of Pers;

var
  Form1: TForm1;

  Personne: tab_P;
  Voiture: tab_V;
  nbrPersonne: Integer = 0;
  nbrVoiture: integer = 0;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  nbrPersonne += 1;
  Personne[nbrPersonne].Nom:= Edit1.Text;
  Personne[nbrPersonne].Prenom:= Edit3.Text;
  Personne[nbrPersonne].Adresse:= Edit2.Text;
  Personne[nbrPersonne].CIN:= StrToInt(Edit4.Text);
  ShowMessage('Ajout avec Succees');
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
  tsisy : Boolean = False;
begin
  nbrVoiture += 1;
  Voiture[nbrVoiture].typeV:=Edit5.Text;
  Voiture[nbrVoiture].Marque:=Edit6.Text;
  Voiture[nbrVoiture].CIN_propri:=StrToInt(Edit7.Text);
  for i:= 1 to nbrPersonne do
  begin
       if (Personne[i].CIN = Voiture[nbrVoiture].CIN_propri) then
       begin
           Personne[i].voitures += 1;
           ShowMessage('Voiture de ' + Personne[i].Nom + ' ' + Personne[i].Prenom + ' ajouter avec succes');
           Edit5.Text := '';
           Edit6.Text := '';
           Edit7.Text := '';
           break;
       end
       else
       begin
            Tsisy := True;
       end;
  end;

  if tsisy then
  begin
      nbrPersonne -= 1;
      ShowMessage('Aucun correspondance pour' + Edit5.Text + '. Veuiller choisir un propriétaire');
  end;

end;

end.

