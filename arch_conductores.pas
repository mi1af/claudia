unit arch_conductores;

{$mode ObjFPC}{$H+}

interface

 uses
   validacion;

const
  Ruta_C='C:\Archivo proy final\CONDUCTORES.dat.txt';
  n=5;
  p=20;

type
  t_conductores=record
    dni:t_dni;
    AYP:string[100];
    f_nac:fecha;
    tel:string[10];
    email:string[100];
    scoring:byte;
    habilitado:boolean;
    f_hab:fecha;
    cant_rein:0..n;
    end;
  t_arch_c=file of t_conductores;

procedure crea_AC(var arch:t_arch_c);
procedure abre_AC(var arch:t_arch_c);
procedure cierra_AC(var arch:t_arch_c);
procedure lee_reg_cond(var arch:t_arch_c; pos:cardinal; var reg:t_conductores);
procedure carga_reg_cond(var x:t_conductores; dni:t_dni);
procedure muesta_reg_cond(x:t_conductores);



implementation

procedure crea_AC(var arch:t_arch_c);
begin
  assign(arch,ruta_c);
  rewrite(arch);
end;
procedure abre_AC(var arch:t_arch_c);
begin
  assign(arch,ruta_c);
  reset(arch);
end;
procedure cierra_AC(var arch:t_arch_c);
begin
  close(arch);
end;
procedure lee_reg_cond(var arch:t_arch_c; pos:cardinal; var reg:t_conductores);
begin
  seek(arch,pos);
  read(arch,reg);
end;
  procedure carga_reg_cond(var x:t_conductores; dni:t_dni);
begin
  x.dni:=dni;
  writeln('numero de dni');
  readln(x.dni);
  writeln('apellido y nombre');
  readln(x.AYP);
 { writeln('fecha de nacimiento');
  readln(cargo_f(x.f_nac)); }
  writeln('telefono');
  readln(x.tel);
  writeln('email');
  readln(x.email);
 x.scoring:=20;
  x.habilitado:=true;
  x.cant_rein:=0;
end;
  procedure muesta_reg_cond(x:t_conductores);
  begin
   with x do
   begin
     writeln('dni: ',dni);
     writeln('apellido y nombre: ',AYP);
    { writeln('fecha de nacimiento: ', f_nac);  }
     writeln('telefono: ',tel);
     writeln('email: ',email);
     writeln('scoring: ',scoring);
     writeln('habilitado: ',habilitado);
    { writeln('fecha de habilitacion: ',f_hab); }
     writeln('cantidad de reincidencias: ',cant_rein);
   end;
  end;


end.
