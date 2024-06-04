unit loginZaposleni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformLoginZaposleni = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    top: TLayout;
    center: TLayout;
    Button1: TButton;
    Image2: TImage;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoginZaposleni: TformLoginZaposleni;

implementation

uses signUp, loginZaposleni2;

{$R *.fmx}

procedure TformLoginZaposleni.Button1Click(Sender: TObject);
begin
    formLoginZaposleni.hide;
    formLoginZaposleni2.show;
end;

procedure TformLoginZaposleni.Button2Click(Sender: TObject);
begin
    formLoginZaposleni.hide;
    formSignUp.show;
end;

end.
