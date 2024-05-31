unit zakaziTransport;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.DateTimeCtrls, FMX.Edit, Data.DB, FireDAC.Comp.Client;

type
  TformZakaziTransport = class(TForm)
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
    editVrsta: TEdit;
    Label1: TLabel;
    Layout2: TLayout;
    Line2: TLine;
    editIsporuka: TEdit;
    Label2: TLabel;
    Layout3: TLayout;
    Line3: TLine;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Layout4: TLayout;
    Line4: TLine;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure buttonPotvrdiClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FTransportID: integer;
    function GenerateRandomNumber: Integer;
  public
    { Public declarations }
    property noviTransportID: integer read FTransportID write FTransportID;
  end;

var
  formZakaziTransport: TformZakaziTransport;

implementation

uses meni, zakaziTransport2, dm;

{$R *.fmx}

procedure TformZakaziTransport.Button1Click(Sender: TObject);
begin
  formZakaziTransport.Hide;
  formMeni.Show;
end;

procedure TformZakaziTransport.Button3Click(Sender: TObject);
begin
  formZakaziTransport.Hide;
  formZakaziTransport2.Show;
end;

function TformZakaziTransport.GenerateRandomNumber: Integer;
begin
  Result := 1000 + Random(9000); // Generiše četvorocifreni broj između 1000 i 9999
end;

procedure TformZakaziTransport.buttonPotvrdiClick(Sender: TObject);
var
  vrstaTereta, adresaIsporuke: string;
  datumIsporuke: TDateTime;
  randomBroj: Integer;
begin
  // Provera da li su svi podaci uneti
  if Trim(editVrsta.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite vrstu tereta!');
    editVrsta.SetFocus;
    Exit;
  end;
  if Trim(editIsporuka.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite adresu isporuke!');
    editIsporuka.SetFocus;
    Exit;
  end;
  if DateEdit1.Date = 0 then
  begin
    ShowMessage('Molimo vas unesite datum isporuke!');
    DateEdit1.SetFocus;
    Exit;
  end;

  // Dohvaćanje unesenih podataka
  vrstaTereta := editVrsta.Text;
  adresaIsporuke := editIsporuka.Text;
  datumIsporuke := DateEdit1.Date;

  // Generisanje nasumičnog četvorocifrenog broja
  randomBroj := GenerateRandomNumber;

  // Rad sa bazom podataka
  with db do
  begin
    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'INSERT INTO zakazaniTransport (vrstaTereta, adresaIsporuke, datumIsporuke, transportnaKompID, randomBroj) ' +
                      'VALUES (:vrstaTereta, :adresaIsporuke, :datumIsporuke, :transportnaKompID, :randomBroj)';
    qtemp.Params.ParamByName('vrstaTereta').AsString := vrstaTereta;
    qtemp.Params.ParamByName('adresaIsporuke').AsString := adresaIsporuke;
    qtemp.Params.ParamByName('datumIsporuke').AsDateTime := datumIsporuke;
    qtemp.Params.ParamByName('transportnaKompID').AsInteger := FTransportID;
    qtemp.Params.ParamByName('randomBroj').AsInteger := randomBroj;
    qtemp.ExecSQL;

    // Prikaz poruke sa nasumičnim brojem
    ShowMessage('Vaš termin je zakazan! Vaš kod za praćenje je: ' + IntToStr(randomBroj));

    // Sakrivanje trenutne forme (ako je potrebno)
    formZakaziTransport.Hide;
    formMeni.Show;
  end;
end;

end.

