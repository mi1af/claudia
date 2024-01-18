unit USA_ABB_DNI;

{$codepage UTF8}

interface
uses CRT,unit2, arch_conductores,USA_ABB_NOMBRE;

PROCEDURE CARGAR_ARBOL_DNI(VAR RAIZ:t_punt_arbol; VAR ARCH: t_arch_c);
PROCEDURE MUESTRA_DATOS_DNI (POS: t_punt_arbol; VAR ARCH: t_arch_c);
FUNCTION PREORDEN_DNI( RAIZ:t_punt_arbol;BUSCADO:string; VAR ARCH: t_arch_c):t_punt_arbol;
PROCEDURE AGREGAR_NODO_DNI (VAR RAIZ:t_punt_arbol;X:cardinal; VAR ARCH: t_arch_c);
PROCEDURE GUARDA_REG_cond(VAR arch:t_arch_c; VAR RAIZ_nombre:t_punt_arbol; VAR RAIZ_dni:t_punt_arbol; POS:CARDINAL; REG:T_conductores);

implementation


    PROCEDURE AGREGAR_NODO_DNI (VAR RAIZ:t_punt_arbol;X:cardinal; VAR ARCH: t_arch_c);
      var
       Z: T_DATO_ARBOL;
       dato: t_conductores;
      BEGIN
       CLRSCR;
       lee_reg_cond(ARCH,X,dato);

       Z.clave:=dato.dni ;
       Z.pos:=X;

       AGREGAR_arbol(RAIZ, Z);
     end;

  PROCEDURE MUESTRA_DATOS_DNI (POS: t_punt_arbol; VAR ARCH: t_arch_c);
  VAR
  dato: t_conductores;
  BEGIN
  lee_reg_cond(ARCH,POS^.INFO.pos,dato);
    muesta_reg_cond(dato);
    END;


  PROCEDURE CARGAR_ARBOL_DNI(VAR RAIZ:t_punt_arbol; VAR ARCH: t_arch_c);
    BEGIN
    CLRSCR;
    RESET(ARCH);
    WHILE NOT (ARBOL_LLENO (RAIZ)) AND (NOT(EOF(ARCH))) DO
       BEGIN
          CLRSCR;
          AGREGAR_NODO_DNI(RAIZ,filepos(ARCH),ARCH);
       end;
   END;

 FUNCTION PREORDEN_DNI( RAIZ:t_punt_arbol;BUSCADO:string; VAR ARCH: t_arch_c):t_punt_arbol;
  var
   dato: t_conductores;
   pos:string;
   BEGIN
        IF (RAIZ =  NIL) THEN  PREORDEN_DNI := NIL
                         ELSE begin
                lee_reg_cond(ARCH, RAIZ^.INFO.pos, dato);
                 IF (( RAIZ^.INFO.clave  = BUSCADO)and(dato.habilitado)) THEN
                                     PREORDEN_DNI:= RAIZ
                                    ELSE IF RAIZ^.INFO.clave > BUSCADO THEN
                                     PREORDEN_DNI := PREORDEN_DNI(RAIZ^.SAI,BUSCADO,ARCH)
                                                ELSE
                                                PREORDEN_DNI := PREORDEN_DNI(RAIZ^.SAD,BUSCADO,ARCH)
             end;
        END;
 PROCEDURE GUARDA_REG_cond(VAR arch:t_arch_c; VAR RAIZ_nombre:t_punt_arbol; VAR RAIZ_dni:t_punt_arbol; POS:CARDINAL; REG:T_conductores);
BEGIN
 SEEK(ARCH, POS);
 WRITE(ARCH, REG);
 AGREGAR_NODO_DNI(RAIZ_dni,POS, ARCH);
 AGREGAR_NODO_NOMBRE(RAIZ_nombre,POS, ARCH);
END;

end.
