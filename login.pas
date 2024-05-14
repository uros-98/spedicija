unit login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TformLogin = class(TForm)
    slika: TLayout;
    Image1: TImage;
    top: TLayout;
    center: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Layout1: TLayout;
    Line1: TLine;
    editEmail: TEdit;
    Label2: TLabel;
    Layout2: TLayout;
    Line2: TLine;
    editPassword: TEdit;
    Label3: TLabel;
    buttonLogIn: TButton;
    buttonSignIn: TButton;
    procedure buttonLogInClick(Sender: TObject);
    procedure buttonSignInClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

uses dm, register, meni;

{$R *.fmx}

procedure TformLogin.buttonLogInClick(Sender: TObject);
var
  pwd: string;
begin
  if Trim(editEmail.Text) = '' then
  begin
    Showmessage('Molimo unesite email!');
    editEmail.SetFocus;
  end
  else if Trim(editPassword.Text) = '' then
  begin
    Showmessage('Molimo unesite sifru!');
    editPassword.SetFocus;
  end
  else
  begin
    // Validacija
    with db do
    begin
      dbSpedicija.Open;
      qtemp.SQL.Clear;
      qtemp.SQL.Text := 'SELECT * FROM korisnici WHERE email=' + QuotedStr(editEmail.Text);
      qtemp.Open;
      if qtemp.RecordCount = 0 then
      begin
        ShowMessage('Email ne postoji!');
        editEmail.SetFocus;
      end
      else
      begin
        pwd := qtemp.FieldByName('password').AsString;
        if pwd = editPassword.Text then
        begin

          formLogin.Hide;
          formMeni.Show;
        end
        else
        begin
          ShowMessage('Pogresna sifra!');
          editPassword.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TformLogin.buttonSignInClick(Sender: TObject);
begin
    formLogin.hide;
    formRegister.show;
end;

end.
