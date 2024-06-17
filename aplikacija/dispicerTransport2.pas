unit dispicerTransport2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TformDispicerTransport2 = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDispicerTransport2: TformDispicerTransport2;

implementation

uses dispicerTransport;

{$R *.fmx}

procedure TformDispicerTransport2.Button1Click(Sender: TObject);
begin
    formDispicerTransport2.hide;
    formDispicerTransport.show;
end;

end.
