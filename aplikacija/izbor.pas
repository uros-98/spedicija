unit izbor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FireDAC.Comp.Client; // Dodato za TFDQuery

type
  TformIzbor = class(TForm)
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
    Layout3: TLayout;
    Line3: TLine;
    editDuzina: TEdit;
    Label3: TLabel;
    Layout4: TLayout;
    Line4: TLine;
    editSirina: TEdit;
    Label4: TLabel;
    Layout6: TLayout;
    Line6: TLine;
    editNosivost: TEdit;
    Label6: TLabel;
    Layout5: TLayout;
    Line5: TLine;
    editVisina: TEdit;
    Label5: TLabel;
    Layout7: TLayout;
    Line7: TLine;
    editRegOznaka: TEdit;
    Label7: TLabel;
    buttonPotvrdi: TButton;
    procedure buttonPotvrdiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure InsertDataIntoDatabase;
    function GenerateRandomVozac: string;
  public
    { Public declarations }
  end;

var
  formIzbor: TformIzbor;

implementation

uses dm, dispicerMeni; // Assuming dm is your data module unit where the database connection is defined

{$R *.fmx}

procedure TformIzbor.Button1Click(Sender: TObject);
begin
    formizbor.hide;
    formDispicerMeni.show;
end;

procedure TformIzbor.buttonPotvrdiClick(Sender: TObject);
begin
  InsertDataIntoDatabase;
  ShowMessage('Vozilo je izabrano! ' + GenerateRandomVozac);
end;

procedure TformIzbor.InsertDataIntoDatabase;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := dm.db.dbSpedicija; // Use the connection from the data module
    query.SQL.Text := 'INSERT INTO izborVozila (duzina, sirina, visina, nosivost, regOznaka) ' +
                      'VALUES (:duzina, :sirina, :visina, :nosivost, :regOznaka)';
    query.ParamByName('duzina').AsString := editDuzina.Text;
    query.ParamByName('sirina').AsString := editSirina.Text;
    query.ParamByName('visina').AsString := editVisina.Text;
    query.ParamByName('nosivost').AsString := editNosivost.Text;
    query.ParamByName('regOznaka').AsString := editRegOznaka.Text;
    query.ExecSQL;
  finally
    query.Free;
  end;
end;

function TformIzbor.GenerateRandomVozac: string;
var
  randomVozac: Integer;
begin
  Randomize;
  randomVozac := Random(20) + 1; // Generate a random number between 1 and 20
  Result := 'Vozač ' + IntToStr(randomVozac);
end;

end.

