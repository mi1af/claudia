unit abmc_c2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, arch_conductores, unit2,crt,validacion, USA_ABB_NOMBRE, USA_ABB_DNI;
 procedure ABMC_C(var ARBOLBB_DNI: t_punt_arbol; var ARBOLBB_NOMBRE: t_punt_arbol; var arch_c: T_arch_c);
 PROCEDURE ALTA_c(VAR ARCH:T_ARCH_c;var ARBOLBB_NOMBRE:T_PUNT_arbol; VAR RAIZ_dni:T_PUNT_arbol;dni:t_dni);
 PROCEDURE MODIFICACION_c(VAR ARCH:T_ARCH_c;r:T_conductores;pos:cardinal);

implementation
PROCEDURE ALTA_c(VAR ARCH:T_ARCH_c;var ARBOLBB_NOMBRE:t_punt_arbol; VAR RAIZ_dni:T_PUNT_arbol;dni:t_dni);
var
  r:T_conductores;
  POS:cardinal;
begin
  CARGA_REG_cond(r,dni);
  POS:=filesize(ARCH);
  GUARDA_REG_cond(ARCH,ARBOLBB_NOMBRE,RAIZ_dni,POS,r);

  // Agregar nodo al árbol por DNI
  AGREGAR_NODO_DNI(RAIZ_dni, POS, ARCH);

  // Agregar nodo al árbol por nombre
 AGREGAR_NODO_NOMBRE(ARBOLBB_NOMBRE, POS, ARCH);
end;


PROCEDURE MODIFICACION_c(VAR ARCH:T_ARCH_c;r:T_conductores;pos:cardinal);
begin

      seek(ARCH,pos);
      write(ARCH,r);
end;
procedure ABMC_C(var ARBOLBB_DNI: t_punt_arbol; var ARBOLBB_NOMBRE: t_punt_arbol; var arch_c: T_arch_c);
var
  clave: string;
  punt_aux: t_punt_arbol;
  reg: t_conductores;
  opc2: char; // Cambiado a char
begin
  Write('Ingrese el D.N.I: ');
  Readln(clave);

 { if ((PREORDEN_DNI(ARBOLBB_DNI,clave,arch_c)=nil) and (preorden_nombre(ARBOLBB_NOMBRE,clave, arch_c)=nil)) then  }
  begin
    if dni_aprobado(clave) then
    begin
      ALTA_c(arch_c, ARBOLBB_NOMBRE, ARBOLBB_DNI, clave);
      Writeln('Carga exitosa, presione cualquier tecla para continuar');
      Readkey;
    end
    else
    begin
      Writeln('conductor inexistente, presione cualquier tecla para continuar');
      Readkey;
    end;
 { end
  else  }
  begin
    if dni_aprobado(clave) then
      punt_aux := preorden_2(ARBOLBB_DNI, clave, arch_c)
    else
      punt_aux := preorden_2(ARBOLBB_NOMBRE, clave, arch_c);

    lee_reg_cond(arch_c, punt_aux^.info.pos, reg);

    if reg.habilitado then
    begin
      muesta_reg_cond(reg);
      Writeln(' ');
      Writeln('¿Desea dar de baja o modificar?');
      Writeln('1: BAJA');
      Writeln('2: MODIFICACIÓN');
      Writeln('3: SALIR');
      Readln(opc2);

      case opc2 of
        '1': begin
          lee_reg_cond(arch_c, punt_aux^.info.pos, reg);
          reg.habilitado := False;
          SEEK(arch_c, punt_aux^.info.pos);
          WRITE(arch_c, reg);
          Writeln('Baja exitosa, presione cualquier tecla para continuar');
          Readkey;
        end;

        '2': begin
          lee_reg_cond(arch_c, punt_aux^.info.pos, reg);
          MODIFICACION_C(arch_C, reg, punt_aux^.info.pos);
          Writeln('Modificación exitosa, presione cualquier tecla para continuar');
          Readkey;
        end;
      end;
    end
    else
    begin
      if dni_aprobado(clave) then
      begin
        ALTA_c(arch_c, ARBOLBB_NOMBRE, ARBOLBB_DNI, clave);
        Writeln('Carga exitosa, presione cualquier tecla para continuar');
        Readkey;
      end
      else
      begin
        Writeln('conductor inexistente, presione cualquier tecla para continuar');
        Readkey;
      end;
    end;
  end;
 { end; }


end;

end;
begin

end.

