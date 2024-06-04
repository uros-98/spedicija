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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZaposleniMeni: TformZaposleniMeni;

implementation

uses loginZaposleni2;
{$R *.fmx}

procedure TformZaposleniMeni.Button1Click(Sender: TObject);
begin
    formZaposleniMeni.hide;
    formLoginZaposleni2.show;
end;

end.
