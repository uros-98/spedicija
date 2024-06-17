unit potvrdaDostave;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.DateTimeCtrls, FMX.StdCtrls, FMX.Edit, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts, Data.DB, FireDAC.Comp.Client;

type
  TformPotvrdaDostave = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    Button2: TButton;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    C: TRectangle;
    Text1: TText;
    Layout2: TLayout;
    Line2: TLine;
    editImeDostavljaca: TEdit;
    Label2: TLabel;
    Layout3: TLayout;
    Line3: TLine;
    editTezinaTereta: TEdit;
    Label3: TLabel;
    Layout4: TLayout;
    Line4: TLine;
    editBrojPaketa: TEdit;
    Label4: TLabel;
    Layout6: TLayout;
    Line6: TLine;
    editRegOznaka: TEdit;
    Label6: TLabel;
    Layout5: TLayout;
    Line5: TLine;
    editVrednostTereta: TEdit;
    Label5: TLabel;
    Layout7: TLayout;
    Line7: TLine;
    Label7: TLabel;
    buttonPotvrdi: TButton;
    DateEdit1: TDateEdit;
    procedure Button1Click(Sender: TObject);
    procedure buttonPotvrdiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPotvrdaDostave: TformPotvrdaDostave;

implementation

uses dm, zaposleniMeni;

{$R *.fmx}

procedure TformPotvrdaDostave.Button1Click(Sender: TObject);
begin
    formPotvrdaDostave.Hide;
    formZaposleniMeni.Show;
end;

procedure TformPotvrdaDostave.buttonPotvrdiClick(Sender: TObject);
begin
  with db do
  begin
    qtemp.SQL.Clear;
    qtemp.SQL.Text := 'INSERT INTO dostavljenTeret (imePrezime, tezina, brojPaketa, vrednost, regOznaka, datum) ' +
                      'VALUES (:imePrezime, :tezina, :brojPaketa, :vrednost, :regOznaka, :datum)';
    qtemp.ParamByName('imePrezime').AsString := editImeDostavljaca.Text;
    qtemp.ParamByName('tezina').AsString := editTezinaTereta.Text;
    qtemp.ParamByName('brojPaketa').AsString := editBrojPaketa.Text;
    qtemp.ParamByName('vrednost').AsString := editVrednostTereta.Text;
    qtemp.ParamByName('regOznaka').AsString := editRegOznaka.Text;
    qtemp.ParamByName('datum').AsDate := DateEdit1.Date;
    try
      qtemp.ExecSQL;
      ShowMessage('Teret je uspešno dostavljen!');
    except
      on E: Exception do
        ShowMessage('Došlo je do greške: ' + E.Message);
    end;
  end;
end;

end.

