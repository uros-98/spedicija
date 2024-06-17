unit dispicerBerza;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox,
  Data.DB, FireDAC.Comp.Client;

type
  TformDispicerBerza = class(TForm)
    slika: TLayout;
    Image1: TImage;
    bot: TLayout;
    top: TLayout;
    Button1: TButton;
    Image2: TImage;
    center: TLayout;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadData;
  public
    { Public declarations }
  end;

var
  formDispicerBerza: TformDispicerBerza;

implementation

uses dm; // Assuming dm is your data module unit where the database connection is defined

{$R *.fmx}

procedure TformDispicerBerza.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TformDispicerBerza.LoadData;
var
  query: TFDQuery;
  listItem: TListBoxItem;
begin
  ListBox1.Clear;
  query := TFDQuery.Create(nil);
  try
    query.Connection := dm.db.dbSpedicija; // Use the connection from the data module
    query.SQL.Text := 'SELECT randomBroj, vrstaTereta, adresaIsporuke, datumIsporuke FROM zakazaniTransport';
    query.Open;

    while not query.Eof do
    begin
      listItem := TListBoxItem.Create(ListBox1);
      listItem.Text := Format('%s - %s - %s', [query.FieldByName('vrstaTereta').AsString,
                                               query.FieldByName('adresaIsporuke').AsString,
                                               query.FieldByName('datumIsporuke').AsString]);
      listItem.Tag := query.FieldByName('randomBroj').AsInteger;
      ListBox1.AddObject(listItem);
      query.Next;
    end;
  finally
    query.Free;
  end;
end;

procedure TformDispicerBerza.ListBox1Change(Sender: TObject);
var
  listItem: TListBoxItem;
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    listItem := ListBox1.ListItems[ListBox1.ItemIndex];
    ShowMessage(Format('Ponuda evidentirana! Random broj: %d', [listItem.Tag]));
  end;
end;

procedure TformDispicerBerza.ListBox1Click(Sender: TObject);
var
  listItem: TListBoxItem;
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    listItem := ListBox1.ListItems[ListBox1.ItemIndex];
    ShowMessage(Format('Ponuda evidentirana! Random broj: %d', [listItem.Tag]));
  end;
end;

end.

