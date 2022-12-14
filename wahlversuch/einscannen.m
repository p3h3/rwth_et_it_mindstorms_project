%% bewegt den Scanner zeilenweise über das Papier und speichert das Ergebnis in einer Matrix mit vorgegebener Größe
function scan = einscannen(laenge, breite)

    scan = zeros(laenge, breite);
    resetPos();

    for y=1:laenge
        moveDown();
        for x=1:breite
            moveRight();
            scan(y_Pos, x_Pos) = takeSample();
        end
        for x=1:breite
            moveLeft();
        end
    end

    for y=1:laenge
        moveUp();
    end
end

