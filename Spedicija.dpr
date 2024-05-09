program Spedicija;

uses
  System.StartUpCopy,
  FMX.Forms,
  signUp in 'signUp.pas' {formSignUp},
  login in 'login.pas' {formLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformSignUp, formSignUp);
  Application.CreateForm(TformLogin, formLogin);
  Application.Run;
end.
