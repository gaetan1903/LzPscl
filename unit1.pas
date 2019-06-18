unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
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
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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

procedure AfficherPersonne(nbrP:integer; Pers:tab_P);
var
  i: integer;
begin
  Form1.StringGrid1.RowCount:= nbrP + 1;
  for i:=1 to nbrP do
  begin
      Form1.StringGrid1.Cells[0, i] := IntToStr(Pers[i].CIN);
      Form1.StringGrid1.Cells[1, i] := Pers[i].Nom;
      Form1.StringGrid1.Cells[2, i] := Pers[i].Prenom;
      Form1.StringGrid1.Cells[3, i] := Pers[i].Adresse;
      Form1.StringGrid1.Cells[4, i] := IntToStr(Pers[i].voitures);
  end;
end;

procedure AffichageVoiture(nbrV: integer; Voit: tab_V);
var
  i, j: integer;
begin
  Form1.StringGrid2.RowCount := nbrv + 1;
  for i:= 1 to nbrV do
  begin
      if (Form1.ComboBox1.caption = IntToStr(Voit[i].CIN_propri))then
      begin
           j += 1;
           Form1.StringGrid2.Cells[0, j]:= Voit[i].typeV;
           Form1.StringGrid2.Cells[1, j]:= Voit[i].Marque;
      end;
  end;
  Form1.StringGrid2.RowCount:= j + 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  nbrPersonne += 1;
  Personne[nbrPersonne].Nom:= Edit1.Text;
  Personne[nbrPersonne].Prenom:= Edit3.Text;
  Personne[nbrPersonne].Adresse:= Edit2.Text;
  Personne[nbrPersonne].CIN:= StrToInt(Edit4.Text);
  ShowMessage('Ajout avec Succees');
  AfficherPersonne(nbrPersonne, Personne);
  Form1.ComboBox1.Items.Add(IntToStr(Personne[nbrPersonne].CIN));
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
  tsisy : integer = 0;
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
           AfficherPersonne(nbrPersonne, Personne);
           break;
       end
       else
       begin
            tsisy := tsisy + 1;
       end;
  end;

  if (tsisy = nbrPersonne) then
  begin
      nbrVoiture -= 1;
      ShowMessage('Aucun correspondance pour ' + Edit7.Text + ', Veuiller choisir un propriétaire');
  end;

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  i: integer;
  value: integer;
begin
     for i:= 1 to nbrPersonne do
     begin
          if (Form1.ComboBox1.Caption = IntToStr(Personne[i].CIN)) then
          begin
              value := i;
              break
          end;
     end;
     if (value <> 0) then
     begin
         label13.Caption:= Personne[value].Nom;
         label14.Caption:= Personne[value].Prenom;
         AffichageVoiture(nbrVoiture, Voiture);
     end;
end;

end.

