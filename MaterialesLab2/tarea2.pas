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

begin

end;


procedure buscarTramoPorIdBanco(idBanco: integer; tram: TTramos; var encontre: boolean; var idTramo: integer);
begin

end;

procedure eliminarPalabra(idBanco: integer; var partida : TPartida);
begin

end;

function calcularPuntaje(tablero : TTablero) : TNatural;

begin
    { Reemplace este comentario y la instrucción siguiente por el código correspondiente a calcularPuntaje }
    calcularPuntaje := 0;
end;
