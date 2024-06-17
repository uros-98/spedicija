unit loginDispicer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TformLoginDispicer = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    center: TLayout;
    Button1: TButton;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLoginDispicer: TformLoginDispicer;

implementation

uses loginDispicer2;

{$R *.fmx}

procedure TformLoginDispicer.Button1Click(Sender: TObject);
begin
    FormloginDispicer.hide;
    formLoginDispicer2.show;
end;

end.
