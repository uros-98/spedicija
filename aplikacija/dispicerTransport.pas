unit dispicerTransport;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TformDispicerTransport = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    editKod: TEdit;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function KodPostojiUKodi: Boolean;
  public
    { Public declarations }
  end;

var
  formDispicerTransport: TformDispicerTransport;

implementation

uses dm, dispicerTransport2, dispicerMeni;

{$R *.fmx}

procedure TformDispicerTransport.Button1Click(Sender: TObject);
begin
    formDispicerTransport.hide;
    formdispicerMEni.show;
end;

procedure TformDispicerTransport.Button3Click(Sender: TObject);
begin
  if KodPostojiUKodi then
  begin
    ShowMessage('Kod postoji u bazi. Preusmeravam na sledeći prozor...');
    formDispicerTransport.Hide;
    formDispicerTransport2.show;
  end
  else
  begin
    ShowMessage('Kod ne postoji u bazi. Pokušajte ponovo.');
  end;
end;

function TformDispicerTransport.KodPostojiUKodi: Boolean;
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
