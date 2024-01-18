unit validacion;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,crt;

type
  fecha=record
    dd:string[2];
    mm:string[2];
    aaaa:string[4];
  end;
  T_dni=string[8];

 function dni_aprobado(d:string):boolean;
 procedure a_valido (var aaaa:string);
 procedure m_valido (var mm:string);
 procedure d_valido (var dd:string);
{ procedure fech (var x:fecha);}
 procedure cargo_f(var x:fecha);
 procedure cargo_d (var x:T_dni);

implementation

  function dni_aprobado(d:string):boolean;
  var
    x,y:integer;
  begin
    val(d,x,y);
    dni_aprobado:=((y=0) and (length(d)<=8) and (length(d)>=7));
  end;
   procedure a_valido (var aaaa:string);
   var
    x,y:integer;
   begin
      writeln ('ingrese año');
     readln (aaaa);
     val (aaaa,x,y);
     while ((y<>0) or (length (aaaa)<>4)) do
           begin
             writeln('ingrese un año valido por favor');
             readln (aaaa);
             val (aaaa,x,y);
           end;
   end;
     procedure m_valido (var mm:string);
   var
    x,y:integer;
   begin
     writeln ('ingrese mes');
     readln (mm);
     val (mm,x,y);
     while ((y<>0) or (length (mm)>2) or (x<1) or (x>12)) do
           begin
             writeln('ingrese un mes valido por favor');
             readln (mm);
             val (mm,x,y);
           end;
   end;
     procedure d_valido (var dd:string);
   var
    x,y:integer;
   begin
      writeln ('ingrese dia');
     readln (dd);
     val (dd,x,y);
     while ((y<>0) or (length (dd)>2) or (x<1) or (x>31) )do
           begin
             writeln('ingrese un dia valido por favor');
             readln (dd);
             val (dd,x,y);
           end;
   end;
 {  procedure fech (var x:fecha);
   var
    a,m,d:word;
    aux:string;
   begin
    decodedate(date,a,m,d);
    str(a,aux);
    x.aaaa:=aux;
    str(m,aux);
    if length(aux)=1 then
       x.m:=('0',aux)
    else
       x,m:=aux;

    str(d,aux);
     if length(aux)=1 then
       x,d:=('0'+aux)
    else
       x,d:=aux;
   end;
          }
  procedure cargo_f(var x:fecha);
  var
   aux:string;
  begin
    d_valido(aux);
    if length(aux)=1 then
       x.dd:=('0'+aux)
    else
       x.dd:=aux;

    m_valido(aux);
    if length(aux)=1 then
       x.mm:=('0'+aux)
    else
       x.mm:=aux;

    a_valido(aux);
    x.aaaa:=(aux);
  end;

 procedure cargo_d (var x:t_dni);
 var
  aux:string;
  z,y: integer;
 begin
  writeln ('ingrese dni');
  readln (aux);
  val(aux,z,y);
  while ((y<>0) or (length(aux)>8) or (length(aux)<7)) do
        begin
        writeln('dni invalido, ingrese nuevamente');
        readln (aux);
        val(aux,z,y);
        end;
   x:=aux
 end;
end.
