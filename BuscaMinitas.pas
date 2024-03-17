program BuscaMinitas;
const
  FacilFilas = 8;
  FacilColumnas = 8;
  FacilMinas = 10;
  
   MedioFilas = 16;
  MedioColumnas = 16;
  MedioMinas = 40;

  DificilFilas = 16;
  DificilColumnas = 30;
  DificilMinas = 99;


type
  Tablero = array[1..FacilFilas, 1..FacilColumnas] of char;
  CasillasDescubiertas = array[1..FacilFilas, 1..FacilColumnas] of boolean;
var
  modo: integer;
  tablero1: Tablero;
  casillasDescubiertas1: CasillasDescubiertas;
begin
repeat
  writeln('[][][][][][][][][][][][][][][][][][]');
  writeln('[]                                []');
  writeln('[]      Elige el modo de juego    []');
  writeln('[]                                []');
  writeln('[][][][][][][][][][][][][][][][][][]');
  writeln('[]                                []');
  writeln('[] 1. Facil (8x8 con 10 minas)    []');
  writeln('[]                                []');
  writeln('[] 2. Medio (16x16 con 40 minas)  []');
  writeln('[]                                []');
  writeln('[] 3. Dificil (16x30 con 99 minas)[]');
  writeln('[]                                []');
  writeln('[] 4. Salir                       []');
  writeln('[][][][][][][][][][][][][][][][][][]');
  readln(modo);

  case modo of
    1: begin 
   
    end;
    
    
    2: begin 
   
    end;
    3: begin
 
    end;
    4: begin 
	writeln('GRACIAS POR JUGARLO ;)');
    
    exit; 
    
    end;
  else
    writeln('Modo no valido');
  end;
until modo = 4;
  
end.
