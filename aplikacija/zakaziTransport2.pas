unit zakaziTransport2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit;

type
  TformZakaziTransport2 = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    Rectangle1: TRectangle;
    Text1: TText;
    Layout1: TLayout;
    Line1: TLine;
    editNaziv: TEdit;
    Label1: TLabel;
    Layout2: TLayout;
    Line2: TLine;
    Edit1: TEdit;
    Label2: TLabel;
    Layout3: TLayout;
    Line3: TLine;
    Edit2: TEdit;
    Label3: TLabel;
    Layout4: TLayout;
    Line4: TLine;
    Edit3: TEdit;
    Label4: TLabel;
    Layout5: TLayout;
    Line5: TLine;
    Edit4: TEdit;
    Label5: TLabel;
    Layout6: TLayout;
    Line6: TLine;
    Edit5: TEdit;
    Label6: TLabel;
    Text2: TText;
    Layout7: TLayout;
    Line7: TLine;
    Edit6: TEdit;
    Label7: TLabel;
    Layout8: TLayout;
    Line8: TLine;
    Edit7: TEdit;
    Label8: TLabel;
    Layout9: TLayout;
    Line9: TLine;
    Edit8: TEdit;
    Label9: TLabel;
    Layout10: TLayout;
    Line10: TLine;
    Edit9: TEdit;
    Label10: TLabel;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    transportID: integer
  end;

var
  formZakaziTransport2: TformZakaziTransport2;

implementation

uses dm, zakaziTransport;

{$R *.fmx}

procedure TformZakaziTransport2.Button1Click(Sender: TObject);
begin
    formZakaziTransport2.hide;
    formZakaziTransport.Show;
end;

procedure TformZakaziTransport2.Button3Click(Sender: TObject);
var
  naziv, zemlja, grad, ulicaBroj, PIB, maticniBroj, nazivPred, punoIme, telefon, email: string;
  NoviTransportID: Integer;
begin
  // Provera da li su svi podaci uneti
  if Trim(editNaziv.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite naziv!');
    editNaziv.SetFocus;
    Exit;
  end;
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite zemlju!');
    Edit1.SetFocus;
    Exit;
  end;
  if Trim(Edit2.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite grad!');
    Edit2.SetFocus;
    Exit;
  end;
  if Trim(Edit3.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite ulicu i broj!');
    Edit3.SetFocus;
    Exit;
  end;
  if Trim(Edit4.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite PIB!');
    Edit4.SetFocus;
    Exit;
  end;
  if Trim(Edit5.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite matični broj!');
    Edit5.SetFocus;
    Exit;
  end;
  if Trim(Edit6.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite naziv preduzeća!');
    Edit6.SetFocus;
    Exit;
  end;
  if Trim(Edit7.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite puno ime!');
    Edit7.SetFocus;
    Exit;
  end;
  if Trim(Edit8.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite telefon!');
    Edit8.SetFocus;
    Exit;
  end;
  if Trim(Edit9.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite email!');
    Edit9.SetFocus;
    Exit;
  end;

  // Dohvaćanje unesenih podataka
  naziv := editNaziv.Text;
  zemlja := Edit1.Text;
  grad := Edit2.Text;
  ulicaBroj := Edit3.Text;
  PIB := Edit4.Text;
  maticniBroj := Edit5.Text;
  nazivPred := Edit6.Text;
  punoIme := Edit7.Text;
  telefon := Edit8.Text;
  email := Edit9.Text;

  // Rad sa bazom podataka
  with db do
  begin
    try
      // Unos podataka u bazu
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'INSERT INTO transportnaKomp (naziv, zemlja, grad, ulicaBroj, PIB, maticniBroj, nazivPred, punoIme, telefon, email) ' +
                        'VALUES (:naziv, :zemlja, :grad, :ulicaBroj, :PIB, :maticniBroj, :nazivPred, :punoIme, :telefon, :email)';
      qtemp.Params.ParamByName('naziv').AsString := naziv;
      qtemp.Params.ParamByName('zemlja').AsString := zemlja;
      qtemp.Params.ParamByName('grad').AsString := grad;
      qtemp.Params.ParamByName('ulicaBroj').AsString := ulicaBroj;
      qtemp.Params.ParamByName('PIB').AsString := PIB;
      qtemp.Params.ParamByName('maticniBroj').AsString := maticniBroj;
      qtemp.Params.ParamByName('nazivPred').AsString := nazivPred;
      qtemp.Params.ParamByName('punoIme').AsString := punoIme;
      qtemp.Params.ParamByName('telefon').AsString := telefon;
      qtemp.Params.ParamByName('email').AsString := email;
      qtemp.ExecSQL;

      // Preuzimanje poslednje ubačenog ID-a
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT last_insert_rowid() AS NewID';
      qtemp.Open;
      NoviTransportID := qtemp.FieldByName('NewID').AsInteger;
      qtemp.Close;

      ShowMessage('Uspešno ste uneli podatke!');

      transportID := NoviTransportID;

      //za zakazi transport 1
      formZakaziTransport.noviTransportID := transportID;

      // Sakrivanje trenutne forme (ako je potrebno)
      formZakaziTransport2.Hide;
      formZakaziTransport.Show;
    except
      on E: Exception do
      begin
        ShowMessage('Došlo je do greške prilikom unosa podataka: ' + E.Message);
      end;
    end;
  end;
end;

end.
