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
  pratiTransport in 'pratiTransport.pas' {formPratiTransport},
  pratiTransport2 in 'pratiTransport2.pas' {formPratiTransport2},
  carina in 'carina.pas' {formCarina},
  kontakt in 'kontakt.pas' {formKontakt},
  loginZaposleni in 'loginZaposleni.pas' {formLoginZaposleni},
  loginZaposleni2 in 'loginZaposleni2.pas' {formLoginZaposleni2},
  zaposleniMeni in 'zaposleniMeni.pas' {formZaposleniMeni};

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
  Application.CreateForm(TformPratiTransport2, formPratiTransport2);
  Application.CreateForm(TformCarina, formCarina);
  Application.CreateForm(TformKontakt, formKontakt);
  Application.CreateForm(TformLoginZaposleni, formLoginZaposleni);
  Application.CreateForm(TformLoginZaposleni2, formLoginZaposleni2);
  Application.CreateForm(TformZaposleniMeni, formZaposleniMeni);
  Application.Run;
end.
