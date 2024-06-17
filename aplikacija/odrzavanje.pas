unit odrzavanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts;

type
  TformOdrzavanje = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    ListBoxItem1: TListBoxItem;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox2: TComboBox;
    ListBoxItem2: TListBoxItem;
    Label9: TLabel;
    Rectangle2: TRectangle;
    ComboBox3: TComboBox;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    Edit1: TEdit;
    Rectangle3: TRectangle;
    Button3: TButton;
    Rectangle4: TRectangle;
    Label10: TLabel;
    Rectangle5: TRectangle;
    Label11: TLabel;
    Rectangle6: TRectangle;
    Label12: TLabel;
    Label13: TLabel;
    Line1: TLine;
    Label14: TLabel;
    Label15: TLabel;
    Rectangle7: TRectangle;
    Label16: TLabel;
    Label17: TLabel;
    Line2: TLine;
    Label18: TLabel;
    Label19: TLabel;
    Rectangle8: TRectangle;
    Label20: TLabel;
    Label21: TLabel;
    Line3: TLine;
    Label22: TLabel;
    Label23: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOdrzavanje: TformOdrzavanje;

implementation

uses zaposleniMeni;

{$R *.fmx}

procedure TformOdrzavanje.Button1Click(Sender: TObject);
begin
    formOdrzavanje.Hide;
    formZaposleniMeni.show;
end;

end.
