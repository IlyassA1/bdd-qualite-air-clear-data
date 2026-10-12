-- Requête n°11 : Rapports liés à un gaz donné (variable @gaz_recherche).
SET @gaz_recherche = 'CH4';

SELECT DISTINCT
    r.id_rapport,
    r.titre_rapport,
    r.date_publication,
    g.nom_gaz,
    g.sigle_gaz
FROM rapport r
JOIN contient co ON co.id_rapport = r.id_rapport
JOIN mesure m ON m.id_mesure = co.id_mesure
JOIN capteur c ON c.id_capteur = m.id_capteur
JOIN gaz g ON g.id_gaz = c.id_gaz
WHERE g.sigle_gaz = @gaz_recherche
   OR g.nom_gaz = @gaz_recherche
ORDER BY r.date_publication DESC;
