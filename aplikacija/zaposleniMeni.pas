unit zaposleniMeni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformZaposleniMeni = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    ButtonZTransport: TButton;
    buttonPTransport: TButton;
    buttonCarina: TButton;
    buttonRSkladiste: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonZTransportClick(Sender: TObject);
    procedure buttonPTransportClick(Sender: TObject);
    procedure buttonCarinaClick(Sender: TObject);
    procedure buttonRSkladisteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZaposleniMeni: TformZaposleniMeni;

implementation

uses loginZaposleni2, infoTeret, komunikacija, odrzavanje, potvrdaDostave;
{$R *.fmx}

procedure TformZaposleniMeni.Button1Click(Sender: TObject);
begin
    formZaposleniMeni.hide;
    formLoginZaposleni2.show;
end;

procedure TformZaposleniMeni.buttonCarinaClick(Sender: TObject);
begin
    formZaposleniMeni.hide;
    formOdrzavanje.show;

end;

procedure TformZaposleniMeni.buttonPTransportClick(Sender: TObject);
begin
    formZaposleniMeni.hide;
    formKomunikacija.show;
end;

procedure TformZaposleniMeni.buttonRSkladisteClick(Sender: TObject);
begin
    formZaposleniMeni.hide;
    formPotvrdaDostave.show;
end;

procedure TformZaposleniMeni.ButtonZTransportClick(Sender: TObject);
begin
    formZaposleniMeni.Hide;
    formInfoTeret.show;
end;

end.
