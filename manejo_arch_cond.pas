unit manejo_arch_cond;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
const
  ruta= 'C:\archivos\CONDUCTORES\conductor.dat'  ;
  type
    conductores = record
      DNI: string [8];
      nomyape: string [100];
      fechNac: string [10];
      nTelefono: string [20];
      email: string [100];
      scoring: byte;
      habilitado: string[2];
      fechHabil: string [10];
      cantReinc: byte;
    end;
    t_arch= file of conductores;
    t_punt_cond=^conductores;
  var
      arch_cond: t_arch;
  procedure crear_abrir(var arch_cond:t_arch);
  procedure crear (var arch_cond:t_arch);
  procedure abrir (var arch_cond:t_arch);
  procedure cerrar (var arch_cond:t_arch);
implementation
procedure crear_abrir (var arch_cond:t_arch);
begin
  assign (arch_cond,ruta);
  {$I-}
  reset(arch_cond);
  {$I+}
  if IOresult<>0 then rewrite(arch_cond);
end;
procedure crear (var arch_cond:t_arch);
 begin
   assign(arch_cond,ruta);
   rewrite(arch_cond);
   end;
procedure abrir (var arch_cond:t_arch);
begin
  assign(arch_cond,ruta);
  reset(arch_cond);
end;
procedure cerrar (var arch_cond:t_arch);
begin
  close(arch_cond);
end;
end.












