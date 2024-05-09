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
    Edit1: TEdit;
    Label2: TLabel;
    Layout2: TLayout;
    Line2: TLine;
    Edit2: TEdit;
    Label3: TLabel;
    buttonLogIn: TButton;
    buttonSignIn: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

{$R *.fmx}

end.
