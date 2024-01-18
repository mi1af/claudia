unit unit2;

INTERFACE
uses
arch_conductores,crt;
TYPE
  t_dato_arbol=record
  clave:string[100];
  pos:cardinal;
  end;
  t_punt_arbol = ^T_NODO;
  T_NODO = RECORD
  INFO:T_DATO_arbol;
  SAI,SAD: t_punt_arbol;
  END;
PROCEDURE CREAR_ARBOL (VAR RAIZ:t_punt_arbol);
PROCEDURE AGREGAR_arbol(VAR RAIZ:t_punt_arbol; X:t_dato_arbol);
FUNCTION ARBOL_VACIO (var RAIZ:t_punt_arbol): BOOLEAN;
FUNCTION ARBOL_LLENO ( RAIZ:t_punt_arbol): BOOLEAN;
procedure suprime (var raiz:t_punt_arbol;x:t_dato_arbol);
FUNCTION PREORDEN(RAIZ:t_punt_arbol;BUSCADO:string):t_punt_arbol;
function preorden_2(var raiz:t_punt_arbol; buscado:string; var arch: t_arch_c):t_punt_arbol;

//PROCEDURE INORDEN FALTA CAMBIAR LOS NOMBRES DE LAS VARIABLES A CORDE A ESTA UNIT

implementation
PROCEDURE CREAR_ARBOL (VAR RAIZ:t_punt_arbol);
BEGIN
     RAIZ:= NIL;
END;
PROCEDURE AGREGAR_arbol (VAR RAIZ:t_punt_arbol; X:t_dato_arbol);
BEGIN
IF RAIZ = NIL THEN
BEGIN
  NEW (RAIZ);
  RAIZ^.INFO:= X;
  RAIZ^.SAI:= NIL;
  RAIZ^.SAD:= NIL;
END
ELSE
    IF RAIZ^.INFO.clave > X.clave THEN
       AGREGAR_arbol (RAIZ^.SAI,X)
    ELSE
       AGREGAR_arbol (RAIZ^.SAD,X);
END;
FUNCTION ARBOL_VACIO (var RAIZ:t_punt_arbol): BOOLEAN;
BEGIN
     ARBOL_VACIO:= RAIZ = NIL;
END;
FUNCTION ARBOL_LLENO (RAIZ:t_punt_arbol): BOOLEAN;
BEGIN
     ARBOL_LLENO:= GETHEAPSTATUS.TOTALFREE < SIZEOF (T_NODO);
END;
function suprime_min (var raiz:t_punt_arbol): t_dato_arbol;
begin
if RAIZ^.SAI = nil then
 begin
   suprime_min:= raiz^.info;
   raiz:=raiz^.sad
 end
 else
     suprime_min:= suprime_min (raiz^.sai)
end;
 procedure suprime (var raiz:t_punt_arbol; x:t_dato_arbol); //borra un nodo del arbol
 begin
 if raiz <> nil then
 if x.clave < raiz^.info.clave then
   suprime (raiz^.sai,x)
 else
 if x.clave > raiz^.info.clave then
   suprime (raiz^.sad,x)
 else
 if (raiz^.sai = nil) and (raiz^.sad = nil) then
   raiz:= nil
 else
 if (raiz^.sai = nil) then
   raiz:= raiz^.sad
 else
 if (raiz^.sad = nil) then
   raiz:= raiz^.sai
 else
   raiz^.info:= suprime_min (raiz^.sad)
 end;
 FUNCTION PREORDEN(RAIZ:t_punt_arbol;BUSCADO:string):t_punt_arbol;
 BEGIN
 IF (RAIZ = NIL) THEN PREORDEN := NIL
 ELSE
 IF ( RAIZ^.INFO.clave = BUSCADO) THEN
   PREORDEN:= RAIZ
 ELSE IF RAIZ^.INFO.clave > BUSCADO THEN
   PREORDEN := PREORDEN(RAIZ^.SAI,BUSCADO)
 ELSE
   PREORDEN := PREORDEN(RAIZ^.SAD,BUSCADO)
 END;
 {PROCEDURE INORDEN(VAR RAIZ:T_PUNT);
  BEGIN
  IF RAIZ <> NIL THEN BEGIN
  INORDEN (RAIZ^.SAI);
  WRITELN (RAIZ^.INFO);
  INORDEN (RAIZ^.SAD);
  end;
  END; }

  function preorden_2(var raiz: t_punt_arbol; buscado: string; var arch: t_arch_c): t_punt_arbol;
  var
    x: t_conductores;
  begin
    if (raiz = nil) then
      preorden_2 := nil
    else
          begin
            lee_reg_cond(arch, raiz^.info.pos, x);
            if raiz^.info.clave = buscado then
              preorden_2 := raiz
            else
              begin
                if raiz^.info.clave > buscado then
                  preorden_2 := preorden_2(raiz^.sai, buscado, arch)
                else
                  preorden_2 := preorden_2(raiz^.sad, buscado, arch);
              end;
          end;
      end;


begin
  end.
