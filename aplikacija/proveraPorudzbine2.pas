unit proveraPorudzbine2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, dm;

type
  TformProveraPorudzbine2 = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    Rectangle1: TRectangle;
    podaciOPorudzbini: TLabel;
    labelVrstaTereta: TLabel;
    labelAdresaIsporuke: TLabel;
    labelDatumIsporuke: TLabel;
    labelTransportnaKompanija: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FRandomBroj: Integer;
    procedure LoadData;
  public
    { Public declarations }
    procedure SetRandomBroj(ARandomBroj: Integer);
  end;

var
  formProveraPorudzbine2: TformProveraPorudzbine2;

implementation

uses proveraPorudzbine;

{$R *.fmx}

procedure TformProveraPorudzbine2.SetRandomBroj(ARandomBroj: Integer);
begin
  FRandomBroj := ARandomBroj;
  LoadData;
end;

procedure TformProveraPorudzbine2.LoadData;
begin
  with dm.db.qtemp do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT vrstaTereta, adresaIsporuke, datumIsporuke ' +
                'FROM zakazaniTransport WHERE randomBroj = :randomBroj';
    Params.ParamByName('randomBroj').AsInteger := FRandomBroj;
    Open;
    if not IsEmpty then
    begin
      labelVrstaTereta.Text := 'Vrsta tereta: ' + FieldByName('vrstaTereta').AsString;
      labelAdresaIsporuke.Text := 'Adresa isporuke: ' +  FieldByName('adresaIsporuke').AsString;
      labelDatumIsporuke.Text := 'Datum isporuke: ' +  FieldByName('datumIsporuke').AsString;
    end
    else
    begin
      ShowMessage('No data found for the provided random number.');
    end;
    Close;
  end;
end;

procedure TformProveraPorudzbine2.Button1Click(Sender: TObject);
begin
  formProveraPorudzbine2.Hide;
  formProveraPorudzbine.Show;
end;

end.

