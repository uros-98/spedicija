unit infoTeret;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, Data.DB, FireDAC.Comp.Client;

type
  TformInfoTeret = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    C: TRectangle;
    Text1: TText;
    Layout1: TLayout;
    Line1: TLine;
    vrstaTereta: TLabel;
    Layout2: TLayout;
    Line2: TLine;
    tezinaTereta: TLabel;
    Layout3: TLayout;
    Line3: TLine;
    brojPaketa: TLabel;
    Layout4: TLayout;
    Line4: TLine;
    vrednostTereta: TLabel;
    Layout6: TLayout;
    Line6: TLine;
    datumIsporuke: TLabel;
    Layout5: TLayout;
    Line5: TLine;
    porekloRobe: TLabel;
    Layout7: TLayout;
    Line7: TLine;
    MestoIstovara: TLabel;
    buttonPrikazi: TButton;
    procedure buttonPrikaziClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formInfoTeret: TformInfoTeret;

implementation

uses dm, zaposleniMeni; // Assuming dm is your data module unit where the database connection is defined

{$R *.fmx}

procedure TformInfoTeret.Button1Click(Sender: TObject);
begin
  formInfoTeret.Hide;
  formZaposleniMeni.Show;
end;

procedure TformInfoTeret.buttonPrikaziClick(Sender: TObject);
begin
  with db do
  begin
    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'SELECT z.vrstaTereta, c.kolicina AS brojPaketa, c.vrednostRobe AS vrednostTereta, ' +
                      'c.porekloRobe, z.datumIsporuke, z.adresaIsporuke AS mestoIstovara ' +
                      'FROM zakazaniTransport z ' +
                      'JOIN carinskaPrijava c ON z.randomBroj = c.randomBroj ' +
                      'WHERE z.randomBroj = :randomBroj';
    qtemp.ParamByName('randomBroj').AsInteger := 1284;
    qtemp.Open;

    if not qtemp.IsEmpty then
    begin
      vrstaTereta.Text := 'Vrsta tereta: ' + qtemp.FieldByName('vrstaTereta').AsString;
      brojPaketa.Text := 'Broj paketa: ' + qtemp.FieldByName('brojPaketa').AsString;
      vrednostTereta.Text := 'Vrednost tereta: ' + qtemp.FieldByName('vrednostTereta').AsString + '$';
      porekloRobe.Text := 'Poreklo robe: ' + qtemp.FieldByName('porekloRobe').AsString;
      datumIsporuke.Text := 'Datum isporuke: ' + qtemp.FieldByName('datumIsporuke').AsString;
      MestoIstovara.Text := 'Mesto istovara: ' + qtemp.FieldByName('mestoIstovara').AsString;
      tezinaTereta.Text := 'Tezina tereta: 5t';
    end
    else
    begin
      ShowMessage('Nema podataka za zadati random broj.');
    end;

    qtemp.Close;  // Close the query after use
  end;
end;

end.

