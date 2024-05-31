program Spedicija;

uses
  System.StartUpCopy,
  FMX.Forms,
  signUp in 'signUp.pas' {formSignUp},
  login in 'login.pas' {formLogin},
  register in 'register.pas' {formRegister},
  dm in 'dm.pas' {db},
  meni in 'meni.pas' {formMeni},
  zakaziTransport in 'zakaziTransport.pas' {formZakaziTransport},
  zakaziTransport2 in 'zakaziTransport2.pas' {formZakaziTransport2},
  pratiTransport in 'pratiTransport.pas' {formPratiTransport};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformSignUp, formSignUp);
  Application.CreateForm(TformLogin, formLogin);
  Application.CreateForm(TformRegister, formRegister);
  Application.CreateForm(Tdb, db);
  Application.CreateForm(TformMeni, formMeni);
  Application.CreateForm(TformZakaziTransport, formZakaziTransport);
  Application.CreateForm(TformZakaziTransport2, formZakaziTransport2);
  Application.CreateForm(TformPratiTransport, formPratiTransport);
  Application.Run;
end.
