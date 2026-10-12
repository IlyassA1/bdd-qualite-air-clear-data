-- Requête n°2 : Nom et prénom des agents techniques de l'agence de Bordeaux.
SELECT a.nom_agent, a.prenom_agent
FROM agent a
JOIN agent_technique t ON a.id_agent = t.id_agent
JOIN agence ag ON a.id_agence = ag.id_agence
WHERE ag.nom_agence = 'Agence Bordeaux';
