unit dispicerKomunikacija;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformDispicerKomunikacija = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDispicerKomunikacija: TformDispicerKomunikacija;

implementation

uses dispicerMeni;

{$R *.fmx}

procedure TformDispicerKomunikacija.Button1Click(Sender: TObject);
begin
    formDispicerKomunikacija.hide;
    formDispicerMeni.show;
end;

end.
