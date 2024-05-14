unit zakaziTransport;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.DateTimeCtrls, FMX.Edit;

type
  TformZakaziTransport = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    Rectangle1: TRectangle;
    Text1: TText;
    Layout1: TLayout;
    Line1: TLine;
    editVrsta: TEdit;
    Label1: TLabel;
    Layout2: TLayout;
    Line2: TLine;
    editIsporuka: TEdit;
    Label2: TLabel;
    Layout3: TLayout;
    Line3: TLine;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Layout4: TLayout;
    Line4: TLine;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZakaziTransport: TformZakaziTransport;

implementation

uses meni;

{$R *.fmx}

procedure TformZakaziTransport.Button1Click(Sender: TObject);
begin
    formZakaziTransport.hide;
    formMeni.show;
end;

end.
