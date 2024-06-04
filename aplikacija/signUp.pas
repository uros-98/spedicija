unit signUp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts;

type
  TformSignUp = class(TForm)
    Image1: TImage;
    slika: TLayout;
    bot: TLayout;
    top: TLayout;
    center: TLayout;
    buttonRegister: TButton;
    Label1: TLabel;
    buttonLogin: TButton;
    buttonZaposleni: TButton;
    procedure Label1Click(Sender: TObject);
    procedure buttonLoginClick(Sender: TObject);
    procedure buttonRegisterClick(Sender: TObject);
    procedure buttonZaposleniClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSignUp: TformSignUp;

implementation

uses login,register,loginZaposleni;
{$R *.fmx}


procedure TformSignUp.buttonZaposleniClick(Sender: TObject);
begin
    formSignUp.hide;
    formLoginZaposleni.show;
end;

procedure TformSignUp.buttonLoginClick(Sender: TObject);
begin
    formSignUp.Hide;
    formLogin.Show;

end;

procedure TformSignUp.buttonRegisterClick(Sender: TObject);
begin
    formSignup.Hide;
    formregister.show;
end;

procedure TformSignUp.Label1Click(Sender: TObject);
begin
    formSignUp.Hide;
    formLogin.show;
end;

end.
