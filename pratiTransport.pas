unit pratiTransport;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, Data.DB, FireDAC.Comp.Client;

type
  TformPratiTransport = class(TForm)
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
  public
    { Public declarations }
  end;

var
  formPratiTransport: TformPratiTransport;

implementation

uses meni, dm;  // Pretpostavimo da je sledeća forma nazvana sledecaForma

{$R *.fmx}

procedure TformPratiTransport.Button1Click(Sender: TObject);
begin
  formPratiTransport.Hide;
  formMeni.Show;
end;

procedure TformPratiTransport.Button3Click(Sender: TObject);
begin
  if KodPostojiUKodi then
  begin
    ShowMessage('Kod postoji u bazi. Preusmeravam na sledeći prozor...');
    formPratiTransport.Hide;
    //formSledecaForma.Show;  // Pretpostavimo da je sledeća forma nazvana formSledecaForma
  end
  else
  begin
    ShowMessage('Kod ne postoji u bazi. Pokušajte ponovo.');
  end;
end;

function TformPratiTransport.KodPostojiUKodi: Boolean;
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

end.

