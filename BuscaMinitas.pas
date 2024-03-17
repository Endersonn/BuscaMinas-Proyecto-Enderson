program BuscaMinitas;
uses crt;
var i2 , j2 : integer;
const
  FacilFilas = 8;
  FacilColumnas = 8;
  FacilMinas = 10;
  
   MedioFilas = 8;
  MedioColumnas = 8;
  MedioMinas = 25;

  DificilFilas = 8;
  DificilColumnas = 8;
  DificilMinas = 40;


type
  Tablero = array[1..FacilFilas, 1..FacilColumnas] of char;
  CasillasDescubiertas = array[1..FacilFilas, 1..FacilColumnas] of boolean;
var
  modo: integer;
  tablero1: Tablero;
  casillasDescubiertas1: CasillasDescubiertas;
  
  procedure InicializarTablero(var tablero: Tablero; filas, columnas, minas: integer);
var
  i, j, minasColocadas: integer;
begin
  // Inicializar el tablero con ceros (casillas vacias)
  for i := 1 to filas do
    for j := 1 to columnas do
      tablero[i][j] := '0';

  // Colocar las minas en posiciones aleatorias
  minasColocadas := 0;
  while minasColocadas < minas do
  begin
    i := random(filas) + 1;
    j := random(columnas) + 1;
    if tablero[i][j] <> '*' then
    begin
      tablero[i][j] := '*';
      minasColocadas := minasColocadas + 1;
    end;
  end;
end;

procedure MostrarTablero(tablero: Tablero; filas, columnas: integer; mostrarMinas: boolean);
var
  i, j: integer;
begin
  for i := 1 to filas do
  begin
    for j := 1 to columnas do
    begin
      if (mostrarMinas and (tablero[i][j] = '*')) then
        write('* ')
      else if casillasDescubiertas1[i,j] then
        write(tablero[i][j], ' ')
      else
        write('# '); // Representacion de una casilla no descubierta
    end;
    writeln;
  end;
end;

procedure Jugar(var tablero: Tablero; filas, columnas: integer);
var
  fila, columna: integer;
begin


  repeat
    writeln('Ingresa una fila y una columna [Primero la fila y luego la comulna] ');
    readln(fila, columna);

    if (fila < 1) or (fila > filas) or (columna < 1) or (columna > columnas) then
      writeln('Fila o Columna invadilas. Intentalo de nuevo con posiciones que existan.')
    else if casillasDescubiertas1[fila,columna] then
      writeln('Esta casilla ya ha sido seleccionada y revelada. Intentalo de nuevo con otra posicion.')
    else if tablero[fila][columna] = '*' then
    begin
      clrscr;
      writeln('PERDISTE.... Has presionado una mina');
       // Revela todas las minas en el tablero del jugador
	MostrarTablero(tablero, filas, columnas, true); // Mostrar todas las minas
      exit;
    end
    else
    begin
      writeln('Has encontrado una casilla segura! vuelva a intentarlo');
      // Marcar la casilla como descubierta
      casillasDescubiertas1[fila][columna] := true;
      MostrarTablero(tablero, filas, columnas, false); // Mostrar el tablero actualizado
    end;
  until false;
end;


begin
repeat
clrscr;
  randomize; // Inicializar el generador de numeros aleatorios

  // Inicializar todas las casillas como no descubiertas
  for i2 := 1 to FacilFilas do
    for j2 := 1 to FacilColumnas do
      casillasDescubiertas1[i2,j2] := false;
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
    clrscr;
    InicializarTablero(tablero1, FacilFilas, FacilColumnas, FacilMinas); 
    // Mostrar el tablero inicial (sin revelar las minas)
  MostrarTablero(tablero1, FacilFilas, FacilColumnas, false);

  // Empezar el juego
  Jugar(tablero1, FacilFilas, FacilColumnas);
  writeln;
  writeln('preciona Enter para volver a el menu');
  readln;
    end;
    
    
    
    2: begin 
    clrscr;
    InicializarTablero(tablero1, MedioFilas, MedioColumnas, MedioMinas); 
    
      MostrarTablero(tablero1, MedioFilas, MedioColumnas, false);

  // Empezar el juego
      Jugar(tablero1, MedioFilas, MedioColumnas);
      writeln;
	writeln('preciona Enter para volver a el menu');
	readln;
    
   
    end;
    3: begin
     clrscr;
    InicializarTablero(tablero1, DificilFilas, DificilColumnas, DificilMinas);
    
     // Mostrar el tablero inicial (sin revelar las minas)
	MostrarTablero(tablero1, DificilFilas, DificilColumnas, false);

  // Empezar el juego
	Jugar(tablero1, DificilFilas, DificilColumnas);
     writeln;
     writeln('preciona Enter para volver a el menu');
     readln;
 
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
