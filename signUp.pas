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
    procedure Label1Click(Sender: TObject);
    procedure buttonLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSignUp: TformSignUp;

implementation

uses login;
{$R *.fmx}

procedure TformSignUp.buttonLoginClick(Sender: TObject);
begin
    formSignUp.Hide;
    formLogin.Show;

end;

procedure TformSignUp.Label1Click(Sender: TObject);
begin
    formSignUp.Hide;
    formLogin.show;
end;

end.
