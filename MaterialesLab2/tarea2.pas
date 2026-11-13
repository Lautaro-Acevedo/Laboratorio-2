function sonIgualesPalabras(palabra1, palabra2: TPalabra): boolean;
var
    i : integer;
    iguales : boolean;
begin
    if palabra1.largo = palabra2.largo then
    begin
        iguales := True;
        for i := 1 to palabra1.largo do
            if palabra1.arreglo[i] <> palabra2.arreglo[i] then
            iguales := False;
        sonIgualesPalabras := iguales;
    end 
    else
    begin
        sonIgualesPalabras := False
    end;
end;

procedure buscarPalabraEnBanco(palabra: TPalabra; banco: TBancoPalabras; var encontre : boolean; var idBanco : integer);
var
    i , b : integer;
begin
    encontre := False;
    b := 1;
    while (banco.cantidad >= b ) and not encontre do
    begin
        if palabra.largo = banco.arreglo[b].palabra.largo then
        begin
            encontre := True;
            idBanco := b;
            for i := 1 to palabra.largo do
                if banco.arreglo[b].palabra.arreglo[i] <> palabra.arreglo[i] then
                encontre := False;
        end;
        b := b + 1;
    end;
end;


procedure insertarPalabra(pos: TPosicion; ori: TOrientacion; palabra: TPalabra; var partida : TPartida);
var
    seEncontro , encontreBanco : boolean;
    miIdTramo , idBanco , i : integer;
begin
    buscarTramoPorPosicion(pos, ori, partida.tramos , seEncontro, miIdTramo);
    buscarPalabraEnBanco(palabra, partida.banco, encontreBanco, idBanco);
    if seEncontro then
    begin
        partida.tramos.arreglo[miIdTramo].ocupado := True;
        partida.tramos.arreglo[miIdTramo].idBanco := idBanco;
        partida.banco.arreglo[idBanco].insertada := True;
        for i := 1 to palabra.largo do
            if ori = horizontal  then
            begin
                partida.tablero[pos.fila, pos.columna + i - 1].editable := True;
                partida.tablero[pos.fila, pos.columna + i - 1].escrita := True;
                partida.tablero[pos.fila, pos.columna + i - 1].letra := palabra.arreglo[i];
            end
            else
            begin
                partida.tablero[pos.fila + i - 1, pos.columna].editable := True;
                partida.tablero[pos.fila + i - 1, pos.columna].escrita := True;
                partida.tablero[pos.fila + i - 1, pos.columna].letra := palabra.arreglo[i];
            end;
    end;
end;


procedure buscarTramoPorIdBanco(idBanco: integer; tram: TTramos; var encontre: boolean; var idTramo: integer);
var
    i  : integer;
begin
    encontre := False;
    i := 1;
    while (tram.cantidad >= i ) and not encontre do
    begin
        if (tram.arreglo[i].ocupado = True) and (tram.arreglo[i].idBanco = idBanco) then
        begin
             encontre := True;
             idTramo := i;
        end;
        i := i + 1;
    end;
end;

procedure eliminarPalabra(idBanco: integer; var partida : TPartida);
var
    idT , i  : integer;
    encontre : boolean;
begin
    
    buscarTramoPorIdBanco(idBanco , partida.tramos , encontre , idT );
    if encontre then
    begin
        for i := 1 to partida.banco.arreglo[idBanco].palabra.largo do
            if partida.tramos.arreglo[idT].orientacion = horizontal  then
            begin
                partida.tablero[partida.tramos.arreglo[idT].posicion.fila , partida.tramos.arreglo[idT].posicion.columna + i -1].editable := True;
                partida.tablero[partida.tramos.arreglo[idT].posicion.fila, partida.tramos.arreglo[idT].posicion.columna + i - 1].multiplicidad := partida.tablero[partida.tramos.arreglo[idT].posicion.fila, partida.tramos.arreglo[idT].posicion.columna + i - 1].multiplicidad - 1;
                if partida.tablero[partida.tramos.arreglo[idT].posicion.fila , partida.tramos.arreglo[idT].posicion.columna + i -1].multiplicidad = 0 then
                begin
                    partida.tablero[partida.tramos.arreglo[idT].posicion.fila , partida.tramos.arreglo[idT].posicion.columna + i -1].escrita := False;    
                end;
            end
            else
            begin
                partida.tablero[partida.tramos.arreglo[idT].posicion.fila  + i -1, partida.tramos.arreglo[idT].posicion.columna].editable := True;
                partida.tablero[partida.tramos.arreglo[idT].posicion.fila  + i -1, partida.tramos.arreglo[idT].posicion.columna ].multiplicidad := partida.tablero[partida.tramos.arreglo[idT].posicion.fila  + i -1, partida.tramos.arreglo[idT].posicion.columna ].multiplicidad -1;
                if partida.tablero[partida.tramos.arreglo[idT].posicion.fila  + i -1, partida.tramos.arreglo[idT].posicion.columna].multiplicidad = 0 then
                begin
                    partida.tablero[partida.tramos.arreglo[idT].posicion.fila  + i -1, partida.tramos.arreglo[idT].posicion.columna].escrita := False;    
                end;
            end;
        partida.tramos.arreglo[idT].ocupado := False;
        partida.banco.arreglo[idBanco].insertada := False;
    end;
end;

function calcularPuntaje(tablero : TTablero) : TNatural;

begin
    { Reemplace este comentario y la instrucción siguiente por el código correspondiente a calcularPuntaje }
    calcularPuntaje := 0;
end;
