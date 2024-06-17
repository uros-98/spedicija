unit dispicerMeni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformDispicerMeni = class(TForm)
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
    procedure ButtonZTransportClick(Sender: TObject);
    procedure buttonPTransportClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure buttonCarinaClick(Sender: TObject);
    procedure buttonRSkladisteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDispicerMeni: TformDispicerMeni;

implementation

uses dispicerKomunikacija, dispicerTransport, loginDispicer, dispicerBerza, izbor;

{$R *.fmx}

procedure TformDispicerMeni.Button1Click(Sender: TObject);
begin
    formDispicerMeni.hide;
    formLoginDispicer.show;
end;

procedure TformDispicerMeni.buttonCarinaClick(Sender: TObject);
begin
    formDispicerMeni.hide;
    formDispicerBerza.show;
end;

procedure TformDispicerMeni.buttonPTransportClick(Sender: TObject);
begin
    formDispicerMeni.hide;
    formDispicerTransport.show;
end;

procedure TformDispicerMeni.buttonRSkladisteClick(Sender: TObject);
begin
    formDispicerMeni.hide;
    formIzbor.show;
end;

procedure TformDispicerMeni.ButtonZTransportClick(Sender: TObject);
begin
    formDispicerMeni.hide;
    formDispicerKomunikacija.show;
end;

end.
