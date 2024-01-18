unit menu_cond;

{$mode ObjFPC}{$H+}

interface
uses
  Classes, SysUtils, crt, manejo_arch_cond, abcm;

procedure menu_conductores;

implementation
procedure menu_conductores;
var
opcion: byte;
arch_cond: t_arch;
begin
crear_abrir(arch_cond);
repeat
  clrscr;
  gotoxy(40,8);
  writeln('1-alta');
  gotoxy(40,10);
  writeln('2-baja');
  gotoxy(40,12);
  writeln('3-consulta (listado)');
  gotoxy(40,14);
  writeln('4-modificar');
  gotoxy(40,16);
  writeln('0-salir');
  gotoxy(40,18);
  writeln('INGRESE OPCION');
  readln(opcion);

  {case opcion of
  1: ALTA();
  2: BAJA();
  3: CONSULTA();
  4: MODIFICACION();
  end;}
until opcion=0;
cerrar (arch_cond);
end;

end.

