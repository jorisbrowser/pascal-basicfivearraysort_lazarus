unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    zufallsbutton: TButton;
    bubblesortbutton: TButton;
    quicksortbutton: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    procedure bubblesortbuttonClick(Sender: TObject);
    procedure quicksortbuttonClick(Sender: TObject);
    procedure zahlenAnzeigen();
    procedure BubbleSort();
    procedure Quicksort(anfang, ende: integer);
    procedure zufallsbuttonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  zahlen: Array [1..6] of Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.zahlenAnzeigen();
begin
   Edit1.Text:= IntToStr(zahlen[1]);
   Edit2.Text:= IntToStr(zahlen[2]);
   Edit3.Text:= IntToStr(zahlen[3]);
   Edit4.Text:= IntToStr(zahlen[4]);
   Edit5.Text:= IntToStr(zahlen[5]);
   Edit6.Text:= IntToStr(zahlen[6]);
end;

procedure TForm1.zufallsbuttonClick(Sender: TObject);
  var i: integer;
begin
  for i:=1 to 6 do
  begin
     zahlen[i] := Random(6);
  end;
  zahlenAnzeigen();  //Zeigt für jedes Edit Feld das Element im Array an.
end;

procedure TForm1.BubbleSort();
var i: integer;
    j: integer;
    buffer: Integer;
begin
   for i:= 6-1 downto 1 do //Vom Letzten Element bis zum Ersten Element im Array
   begin
       for j:=1 to i do //Vom ersten bis Zum letzten Element im Array
       begin
           if zahlen[j] > zahlen[j+1] then //Wenn jetziges größer als Nachfolger -> Tausch
           begin
             buffer := zahlen[j]; // jetzige Zahl Merken bsp. 5
             zahlen[j] := zahlen[j+1]; //jetzige Zahl auf Nachfolger Setzen  bsp. 5 -> 3
             zahlen[j+1] := buffer; //Nachfolger auf die gemerkte jetzige Zahl setzen  3 -> 5
           end;
       end;
   end;
end;

procedure TForm1.Quicksort(anfang, ende: integer);
var l,r,Mitte,Merke: integer;
begin
 l:=anfang;
 r:=ende;
 Mitte:= zahlen[(anfang+ende) div 2];
 repeat
   while zahlen[l]<Mitte do Inc(l);   //Gibt zurück den Index der Zahl Links die Größer als der Pivot ist

   while zahlen[r]>Mitte do Dec(r);    //Gibt zurück den Index der Zahl rechts die Kleiner als der Pivot ist

   if l <= r then
   begin
      Merke := zahlen[l];
      zahlen[l] := zahlen[r];
      zahlen[r] := Merke;
      Inc(l); //L ist jetzt eins größer als die Mitte
      Dec(r); //R ist jetzt eins kleiner als die Mitte
   end;
 until l>r;

 if anfang<r then Quicksort(anfang, r); //Sortiert demnach den array rechts vom Pivot
 if l<ende then Quicksort(l, ende);    //Sortiert demnach den array links vom Pivot
end;

procedure TForm1.bubblesortbuttonClick(Sender: TObject);
begin
  BubbleSort();
  zahlenAnzeigen();
end;

procedure TForm1.quicksortbuttonClick(Sender: TObject);
begin
 Quicksort(1, 6); //Quicksort in range  1-6
 zahlenAnzeigen();
end;


end.

