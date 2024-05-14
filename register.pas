unit register;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit;

type
  TformRegister = class(TForm)
    slika: TLayout;
    bot: TLayout;
    Label1: TLabel;
    buttonLogin: TButton;
    top: TLayout;
    center: TLayout;
    Rectangle1: TRectangle;
    Text1: TText;
    Button1: TButton;
    Layout1: TLayout;
    Line1: TLine;
    editImePrezime: TEdit;
    Image1: TImage;
    Layout2: TLayout;
    Line2: TLine;
    editEmail: TEdit;
    Image2: TImage;
    Layout3: TLayout;
    Line3: TLine;
    editPassword: TEdit;
    Image3: TImage;
    Layout4: TLayout;
    Line4: TLine;
    editConfirm: TEdit;
    Image4: TImage;
    buttonRegister: TButton;
    procedure Button1Click(Sender: TObject);
    procedure buttonLoginClick(Sender: TObject);
    procedure buttonRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRegister: TformRegister;

implementation

uses SignUp,login,dm;

{$R *.fmx}

procedure TformRegister.Button1Click(Sender: TObject);
begin
    formRegister.Hide;
    formSignUp.show;
end;

procedure TformRegister.buttonLoginClick(Sender: TObject);
begin
    formRegister.hide;
    formlogin.show;
end;

procedure TformRegister.buttonRegisterClick(Sender: TObject);
var
  sifra, imePrezime, email: string;
begin
  //provera da li su podaci uneti
  if Trim(editpassword.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite sifru!');
    editpassword.SetFocus;
    Exit;
  end;
  if Trim(editEmail.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite email!');
    editEmail.SetFocus;
    Exit;
  end;
  if Trim(EditImePrezime.Text) = '' then
  begin
    ShowMessage('Molimo vas unesite ime!');
    EditImePrezime.SetFocus;
    Exit;
  end;

  // Dohvaćanje unesenih podataka
  sifra := editpassword.Text;
  imePrezime := editimePrezime.Text;
  email := editemail.Text;

  with db do
  begin
    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'SELECT * FROM korisnici WHERE email = :email';
    qtemp.ParamByName('email').AsString := email;
    qtemp.Open;

    if qtemp.Fields[0].AsInteger > 0 then
    begin
      ShowMessage('Email adresa već postoji. Molimo izaberite drugu.');
      qtemp.Close;
      Exit;
    end;

    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'INSERT INTO korisnici (imePrezime, password, email) ' +
                      'VALUES (:imePrezime, :sifra, :email)';
    qtemp.Params.ParamByName('imePrezime').AsString := imePrezime;
    qtemp.Params.ParamByName('sifra').AsString := sifra;
    qtemp.Params.ParamByName('email').AsString := email;
    qtemp.ExecSQL;

    ShowMessage('Uspešno ste se registrovali!');

    formRegister.Hide;
    formLogin.Show;
  end;
end;


end.
