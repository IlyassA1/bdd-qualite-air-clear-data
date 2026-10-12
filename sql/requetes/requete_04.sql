-- Requête n°4 : Titre et date des rapports publiés entre 2018 et 2022.
SELECT titre_rapport, date_publication
FROM rapport
WHERE date_publication BETWEEN '2018-01-01' AND '2022-12-31';
