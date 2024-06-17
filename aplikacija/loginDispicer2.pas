unit loginDispicer2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TformLoginDispicer2 = class(TForm)
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
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure buttonLogInClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoginDispicer2: TformLoginDispicer2;

implementation

uses meni, dm, dispicerMeni;

{$R *.fmx}

procedure TformLoginDispicer2.Button2Click(Sender: TObject);
begin
    formLoginDispicer2.hide;
    formMeni.show;
end;

procedure TformLoginDispicer2.buttonLogInClick(Sender: TObject);
var
  pwd: string;
  zaposleni: Integer;
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
        zaposleni := qtemp.FieldByName('zaposleni').AsInteger;
        if zaposleni <> 2 then
        begin
          ShowMessage('Nemate pristup ovom delu sistema!');
          editEmail.SetFocus;
        end
        else if pwd = editPassword.Text then
        begin
          formLoginDispicer2.Hide;
          formDispicerMeni.Show;
        end
        else
        begin
          ShowMessage('Pogresna sifra!');
          editPassword.SetFocus;
        end;
      end;
      qtemp.Close;
    end;
  end;
end;
end.
