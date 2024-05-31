unit meni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformMeni = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    top: TLayout;
    center: TLayout;
    Button1: TButton;
    ButtonZTransport: TButton;
    buttonPTransport: TButton;
    buttonCarina: TButton;
    buttonRSkladiste: TButton;
    Image2: TImage;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonZTransportClick(Sender: TObject);
    procedure buttonPTransportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMeni: TformMeni;

implementation

uses login, zakaziTransport, pratiTransport;

{$R *.fmx}

procedure TformMeni.Button1Click(Sender: TObject);
begin
    formMeni.hide;
    formLogin.show;
end;

procedure TformMeni.buttonPTransportClick(Sender: TObject);
begin
    formMeni.hide;
    formPratiTransport.show;
end;

procedure TformMeni.ButtonZTransportClick(Sender: TObject);
begin
    formMeni.Hide;
    formZakaziTransport.show;
end;

end.
