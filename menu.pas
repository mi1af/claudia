unit menu;

{$codepage UTF8}

interface

uses CRT,ABMC_C2,arch_conductores,unit2,USA_ABB_NOMBRE,USA_ABB_DNI;

procedure menu2;

implementation

procedure menu2;


var
  arch_c:T_arch_c;
  {arch_i:T_arch_i;}
  ARBOLBB_DNI,ARBOLBB_NOMBRE:T_PUNT_arbol;
  salir:boolean;
  opc:string;

begin

{crea_AC(arch);     //Creación de los archivos, usada solo una vez

cierra_AC(arch);
 }

abre_AC (arch_c);      //inicializando programa
{abre_AI(arch_i);}
CREAR_ARBOL(ARBOLBB_DNI);
{crea_arbol_c(ARBOLBB_NOMBRE);}
CARGAR_ARBOL_DNI(ARBOLBB_DNI,arch_c);
CARGAR_ARBOL_NOMBRE(ARBOLBB_NOMBRE,arch_c);

salir:=false;

while not salir do
 begin

   repeat
    CLRSCR;
    writeln('1) ABMC conductor');
    writeln('2) ABMC infraccion');
    writeln('3) Listado ordenado por apellido y nombre de conductores');  //
    writeln('4) Listado ordenado por fecha de todas las infraciones en el primer cuatrimeste');  //
    writeln('5) Listado ordenado por fecha de todas las infraciones de un conductor en el primer cuatrimeste');  //
    writeln('6) Listado ordenado de conductores con scoring en cero');  //
    writeln('7) Estadísticas');
    writeln('8) actualizacion del scoring ante una infracion');
    writeln('9) SALIR');
    readln(opc);
      case opc of
        '1':                                                            //1) ABMC
          begin
          ABMC_c( ARBOLBB_DNI, ARBOLBB_NOMBRE, arch_c);
          end;

      {  '2':begin                                                                        // 2) ABMC atención

        end;   }

       { '3':begin
          listado_ayn_cond(arch_c);
        readkey;
        end;
        '4':begin
           infracion_conductor (arch_i);
        end;
        '5':begin
           infracion_un_conductor (arch_i);
        end;
        '6':begin
         listado_cond_0sco(arch_c);
        end;

        '7':begin                                           // 7) Estadísticas (se abre submenú)
          menu_estadisticas(ARCH_c,ARCH_i);
        end; }
        '8':
          salir:=true;
      end;
   until salir;
 end;


end;

end.

