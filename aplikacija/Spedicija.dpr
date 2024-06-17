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
  zaposleniMeni in 'zaposleniMeni.pas' {formZaposleniMeni},
  proveraPorudzbine in 'proveraPorudzbine.pas' {formProveraPorudzbine},
  proveraPorudzbine2 in 'proveraPorudzbine2.pas' {formProveraPorudzbine2},
  infoTeret in 'infoTeret.pas' {formInfoTeret},
  komunikacija in 'komunikacija.pas' {formKomunikacija},
  odrzavanje in 'odrzavanje.pas' {formOdrzavanje},
  potvrdaDostave in 'potvrdaDostave.pas' {formPotvrdaDostave},
  loginDispicer in 'loginDispicer.pas' {formLoginDispicer},
  loginDispicer2 in 'loginDispicer2.pas' {formLoginDispicer2},
  dispicerMeni in 'dispicerMeni.pas' {formDispicerMeni},
  dispicerKomunikacija in 'dispicerKomunikacija.pas' {formDispicerKomunikacija},
  dispicerTransport in 'dispicerTransport.pas' {formDispicerTransport},
  dispicerTransport2 in 'dispicerTransport2.pas' {formDispicerTransport2},
  dispicerBerza in 'dispicerBerza.pas' {formDispicerBerza},
  izbor in 'izbor.pas' {formIzbor};

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
  Application.CreateForm(TformProveraPorudzbine, formProveraPorudzbine);
  Application.CreateForm(TformProveraPorudzbine2, formProveraPorudzbine2);
  Application.CreateForm(TformInfoTeret, formInfoTeret);
  Application.CreateForm(TformKomunikacija, formKomunikacija);
  Application.CreateForm(TformOdrzavanje, formOdrzavanje);
  Application.CreateForm(TformPotvrdaDostave, formPotvrdaDostave);
  Application.CreateForm(TformLoginDispicer, formLoginDispicer);
  Application.CreateForm(TformLoginDispicer2, formLoginDispicer2);
  Application.CreateForm(TformDispicerMeni, formDispicerMeni);
  Application.CreateForm(TformDispicerKomunikacija, formDispicerKomunikacija);
  Application.CreateForm(TformDispicerTransport, formDispicerTransport);
  Application.CreateForm(TformDispicerTransport2, formDispicerTransport2);
  Application.CreateForm(TformDispicerBerza, formDispicerBerza);
  Application.CreateForm(TformIzbor, formIzbor);
  Application.Run;
end.
