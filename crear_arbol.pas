unit crear_arbol;

{$mode ObjFPC}{$H+}

interface

uses
 manejo_arch_cond,crt, Classes, SysUtils;
type
  t_dato_arbol_cond=record
    clave: string[100];
    pos: byte;
  end;
  t_punt_arbol=^t_nodo;
  t_nodo=record
    info:conductores;
    SAI,SAD:t_punt_arbol;
  end;
procedure insertar_arbol (var nodo:t_punt_arbol; persona: conductores);
procedure crear_arbol (var raiz:t_punt_arbol; var arch_cond:t_arch; var persona:conductores);
function buscar_minimo (var nodo:t_punt_arbol):t_nodo;
procedure eliminar (var nodo:t_punt_arbol; var x:t_dato_arbol_cond);
function preorden (raiz:t_punt_arbol; buscado:string): t_punt_arbol;
procedure guarda_reg_cond (var arch:t_arch; raiz_nombre, raiz_dni:t_punt_arbol; pos:byte; reg:conductores);
implementation
procedure insertar_arbol(var nodo:t_punt_arbol; persona: conductores);
begin
  if nodo= nil then
  begin
    new(nodo);
    nodo^.info:= persona;
    nodo^.SAI:= nil;
    nodo^.SAD:=nil;
  end
  else if persona.nomyape< nodo^.info.nomyape then
  insertar_arbol(nodo^.SAI, persona)
  else if persona.nomyape>nodo^.info.nomyape then
  insertar_arbol(nodo^.SAD,persona);
end;

procedure crear_arbol (var raiz:t_punt_arbol;var arch_cond:t_arch; var persona:conductores); {se deberia crear un arbol desde archivo, o el arbol se debe de ir construyendo y despues gusradr eso en el archivo}
begin
  abrir (arch_cond);
  while not EOF(arch_cond)do
        begin
//          read(arch_cond,conductores);
          insertar_arbol(raiz,persona);
end;

end;

function buscar_minimo (var nodo:t_punt_arbol):t_punt_arbol;
var
v:t_punt_arbol;
begin
  if nodo=nil then
  v:=nil
  else if nodo^.SAI=nil then
     begin
          v:=nodo;
          nodo:= nodo^.SAD;
     end
  else
   buscar_minimo:=buscar_minimo(nodo^.SAI);
end;
procedure eliminar (var nodo:t_punt_arbol; var x:t_dato_arbol_cond);
var
punt_temp:t_punt_arbol;
begin
  if nodo<>nil then
  begin
    if x.clave<nodo^.info.dni then
       eliminar(nodo^.SAI,x)
    else if x.clave>nodo^.info.DNI then
       eliminar(nodo^.SAD, x)
    else
    begin
         if nodo^.SAI=nil then
         begin
              punt_temp:=nodo;
              nodo:=nodo^.SAD;
              dispose(punt_temp);
         end
         else
         if nodo^.SAD=nil then
         begin
              punt_temp:= nodo;
              nodo:= nodo^.SAI;
              dispose(punt_temp);
         end
         else
         begin
           punt_temp:= buscar_minimo(nodo^.SAD);
           nodo^.info:= punt_temp^.info;
           dispose(punt_temp);
         end;
    end;
  end;
end;

end.

