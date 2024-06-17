unit proveraPorudzbine;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TformProveraPorudzbine = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    editKod: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    function KodPostojiUKodi: Boolean;
    function GetRandomBroj: Integer;
  public
    { Public declarations }
  end;

var
  formProveraPorudzbine: TformProveraPorudzbine;

implementation

uses meni, dm, proveraPorudzbine2;

{$R *.fmx}

procedure TformProveraPorudzbine.Button1Click(Sender: TObject);
begin
  formProveraPorudzbine.Hide;
  formMeni.Show;
end;

function TformProveraPorudzbine.KodPostojiUKodi: Boolean;
begin
  with dm.db.qtemp do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT COUNT(*) FROM zakazaniTransport WHERE randomBroj = :randomBroj';
    Params.ParamByName('randomBroj').AsString := editKod.Text;
    Open;
    Result := Fields[0].AsInteger > 0;
    Close;
  end;
end;

function TformProveraPorudzbine.GetRandomBroj: Integer;
begin
  Result := StrToIntDef(editKod.Text, 0);
end;

procedure TformProveraPorudzbine.Button3Click(Sender: TObject);
var
  randomBroj: Integer;
begin
  if KodPostojiUKodi then
  begin
    randomBroj := GetRandomBroj;
    formProveraPorudzbine2.SetRandomBroj(randomBroj);
    formProveraPorudzbine.Hide;
    formProveraPorudzbine2.Show;
  end
  else
  begin
    ShowMessage('Kod ne postoji u bazi. Pokušajte ponovo.');
  end;
end;

end.

