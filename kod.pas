program DKR5;
uses crt, system;
var
  input: file of char;
  output: text;
  arr: array [1..10000] of char;
  start, start1, stop, stop1, n: integer;
  s: string;

function vstavsort: integer;
var
  i, j: integer;
  a: char;
begin
  for i := 2 to n do
  begin
    a := arr[i];
    j := i - 1;
    while (j >= 1) and (arr[j] > a) do
    begin
      arr[j + 1] := arr[j];
      j := j - 1;
    end;
    arr[j + 1] := a;
  end;
end;

function vstavsortub: integer;
var
  i, j: integer;
  a: char;
begin
  for i := 2 to n do
  begin
    a := arr[i];
    j := i - 1;
    while (j >= 1) and (arr[j] < a) do
    begin
      arr[j + 1] := arr[j];
      j := j - 1;
    end;
    arr[j + 1] := a;
  end;
end;

function poraz:integer;
var
  i, j:integer;
  a: char;
  begin
  for i := 2 to n do
     begin
  a :=arr[i];
  j := i - 1;
while (j>1) and (a < arr[j]) do
   begin
  arr[j+1] := arr[j];
  j := j-1;
  end;
  arr[j+1] := a;
  end;
end;

begin
  assign(input, 'D:input.txt'); assign(output, 'D:output.txt');
  rewrite(input); rewrite(output);
  writeln('Введите длинну массива');
  readln(n);
  writeln('Введите массив');
  for var i := 1 to n do
  begin
    readln(arr[i]);
    write(input, arr[i]);
  end;
  var st: integer;
  st := 1;
  while st <> 0 do
  begin
    clrscr;
    writeln('Выберите сортировку');
    writeln('Сортировка вставкой по возрастанию - 1');
    writeln('Сортировка поразрядным алгоритмом - 2');
    writeln('Сортировка вставкой по убыванию - 3');
    writeln('Выход из программы - 0');
    readln(st);
    start := DateTime.Now.Second;
    start1 := DateTime.Now.MilliSecond;
    case st of
      1: vstavsort;
      2: poraz;
      3: vstavsortub;
      0: exit;
    end;
    for var i := 1 to n do
      print(output, arr[i]);
    stop := DateTime.Now.Second;
    stop1 := DateTime.Now.MilliSecond;
    close(output);
    reset(output);
    read(output, s);
    close(output);
    rewrite(output);
    write(s);
    writeln;
    writeln('Время выполнения: ', stop - start, ' секнуд, ', abs(stop1 - start1), ' милисекунд');
    writeln('Для продолжения дважды нажмите enter');
    readln;
    readln;
  end;
end.

