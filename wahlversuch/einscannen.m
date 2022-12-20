function scan = einscannen()
% bewegt den Scanner zeilenweise über das Papier und
% speichert das Ergebnis in einer Matrix

scan = zeros(laenge, breite);
resetPos();

while y_Pos <= laenge
    while x_pos <= breite
        scan(y_Pos, x_Pos) = takeSample();
        moveRight();
    end
    moveDown();
    while x_pos > 1
        moveLeft();
    end
end
end

