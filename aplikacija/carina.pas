unit carina;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, Data.DB, FireDAC.Comp.Client, System.Math;

type
  TformCarina = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    C: TRectangle;
    Text1: TText;
    Layout1: TLayout;
    Line1: TLine;
    editUvoznik: TEdit;
    Label1: TLabel;
    Layout2: TLayout;
    Line2: TLine;
    editIzvoznik: TEdit;
    Label2: TLabel;
    Layout3: TLayout;
    Line3: TLine;
    editOpisRobe: TEdit;
    Label3: TLabel;
    Layout4: TLayout;
    Line4: TLine;
    editVrednostRobe: TEdit;
    Label4: TLabel;
    Layout6: TLayout;
    Line6: TLine;
    editDokaziOPoreklu: TEdit;
    Label6: TLabel;
    Layout5: TLayout;
    Line5: TLine;
    editPorekloRobe: TEdit;
    Label5: TLabel;
    Layout7: TLayout;
    Line7: TLine;
    editKolicinaRobe: TEdit;
    Label7: TLabel;
    Layout8: TLayout;
    Line8: TLine;
    editBrojVrstaPaketa: TEdit;
    Label8: TLabel;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCarina: TformCarina;

implementation

uses dm, meni;

{$R *.fmx}

procedure TformCarina.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TformCarina.Button1Click(Sender: TObject);
begin
    formCarina.hide;
    formMeni.show;
end;

procedure TformCarina.Button3Click(Sender: TObject);
var
  uvoznik, izvoznik, opisRobe, vrednostRobe, porekloRobe, dokazi: string;
  kolicina, brojVrsta, randomBroj: Integer;
begin
  // Provera da li su svi podaci uneti
  if Trim(editUvoznik.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite uvoznika!');
    editUvoznik.SetFocus;
    Exit;
  end;
  if Trim(editIzvoznik.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite izvoznika!');
    editIzvoznik.SetFocus;
    Exit;
  end;
  if Trim(editOpisRobe.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite opis robe!');
    editOpisRobe.SetFocus;
    Exit;
  end;
  if Trim(editVrednostRobe.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite vrednost robe!');
    editVrednostRobe.SetFocus;
    Exit;
  end;
  if Trim(editPorekloRobe.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite poreklo robe!');
    editPorekloRobe.SetFocus;
    Exit;
  end;
  if Trim(editDokaziOPoreklu.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite dokaze o poreklu!');
    editDokaziOPoreklu.SetFocus;
    Exit;
  end;
  if Trim(editKolicinaRobe.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite količinu robe!');
    editKolicinaRobe.SetFocus;
    Exit;
  end;
  if Trim(editBrojVrstaPaketa.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite broj vrsta paketa!');
    editBrojVrstaPaketa.SetFocus;
    Exit;
  end;

  // Dohvaćanje unesenih podataka
  uvoznik := editUvoznik.Text;
  izvoznik := editIzvoznik.Text;
  opisRobe := editOpisRobe.Text;
  vrednostRobe := editVrednostRobe.Text;
  porekloRobe := editPorekloRobe.Text;
  dokazi := editDokaziOPoreklu.Text;
  kolicina := StrToInt(editKolicinaRobe.Text);
  brojVrsta := StrToInt(editBrojVrstaPaketa.Text);

  // Generisanje četvorocifrenog nasumičnog broja
  randomBroj := RandomRange(1000, 10000);

  // Rad sa bazom podataka
  with dm.db.qtemp do
  begin
    SQL.Clear;
    SQL.Text := 'INSERT INTO carinskaPrijava (uvoznik, izvoznik, opisRobe, vrednostRobe, porekloRobe, dokazi, kolicina, brojVrsta, randomBroj) ' +
                'VALUES (:uvoznik, :izvoznik, :opisRobe, :vrednostRobe, :porekloRobe, :dokazi, :kolicina, :brojVrsta, :randomBroj)';
    Params.ParamByName('uvoznik').AsString := uvoznik;
    Params.ParamByName('izvoznik').AsString := izvoznik;
    Params.ParamByName('opisRobe').AsString := opisRobe;
    Params.ParamByName('vrednostRobe').AsString := vrednostRobe;
    Params.ParamByName('porekloRobe').AsString := porekloRobe;
    Params.ParamByName('dokazi').AsString := dokazi;
    Params.ParamByName('kolicina').AsInteger := kolicina;
    Params.ParamByName('brojVrsta').AsInteger := brojVrsta;
    Params.ParamByName('randomBroj').AsInteger := randomBroj;
    ExecSQL;

   ShowMessage('Podaci su uspešno uneti u bazu podataka i vaš kod je: ' + IntToStr(randomBroj));
  end;
end;

end.

