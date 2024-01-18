unit USA_ABB_NOMBRE;

{$codepage UTF8}

interface
uses CRT,unit2, arch_conductores;

 PROCEDURE CARGAR_ARBOL_NOMBRE(VAR RAIZ:t_punt_arbol; VAR ARCH: t_arch_c);
 FUNCTION PREORDEN_NOMBRE( RAIZ:t_punt_arbol;BUSCADO:string; VAR ARCH: t_arch_c):t_punt_arbol;
 PROCEDURE AGREGAR_NODO_NOMBRE (VAR RAIZ:t_punt_arbol;X:cardinal; VAR ARCH: t_arch_c);

implementation

    PROCEDURE AGREGAR_NODO_NOMBRE (VAR RAIZ:t_punt_arbol;X:cardinal; VAR ARCH: t_arch_c);
      var
       Z: T_DATO_ARBOL;
       dato: t_conductores;
      BEGIN
       CLRSCR;
       lee_reg_cond(ARCH,X,dato);

       Z.clave:=dato. AYP ;
       Z.pos:=X;

       AGREGAR_arbol(RAIZ, Z);
     end;


  PROCEDURE CARGAR_ARBOL_NOMBRE(VAR RAIZ:t_punt_arbol; VAR ARCH: t_arch_c);
    BEGIN
    CLRSCR;
    RESET(ARCH);
    WHILE NOT (ARBOL_LLENO (RAIZ)) AND (NOT(EOF(ARCH))) DO
       BEGIN
          CLRSCR;
          AGREGAR_NODO_NOMBRE(RAIZ,filepos(ARCH),ARCH);
       end;
   END;

  FUNCTION PREORDEN_NOMBRE( RAIZ:t_punt_arbol;BUSCADO:string; VAR ARCH: t_arch_c):t_punt_arbol;
  var
   dato: t_conductores;
   BEGIN
        IF (RAIZ =  NIL) THEN  PREORDEN_NOMBRE := NIL
                         ELSE  begin
                 lee_reg_cond(ARCH, RAIZ^.INFO.POS, dato);
                 IF (( RAIZ^.INFO.clave  = BUSCADO)and(dato.habilitado)) THEN
                                     PREORDEN_NOMBRE:= RAIZ
                                    ELSE IF RAIZ^.INFO.clave > BUSCADO THEN
                                     PREORDEN_NOMBRE := PREORDEN_NOMBRE(RAIZ^.SAI,BUSCADO,ARCH)
                                                ELSE
                                                PREORDEN_NOMBRE := PREORDEN_NOMBRE(RAIZ^.SAD,BUSCADO,ARCH)
                 end;

        END;

end.
