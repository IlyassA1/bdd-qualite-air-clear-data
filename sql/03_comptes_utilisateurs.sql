-- Comptes utilisateurs (optionnel) : un administrateur et un utilisateur limité.
-- Remplacer les mots de passe avant exécution.
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'MOT_DE_PASSE_ADMIN';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'MOT_DE_PASSE_USER';

-- Droits de l'administrateur : tous les droits sur la base
GRANT ALL PRIVILEGES ON livrable2.* TO 'admin'@'localhost' WITH GRANT OPTION;

-- Droits de l'utilisateur : lecture, insertion et modification uniquement
GRANT SELECT, INSERT, UPDATE ON livrable2.* TO 'user'@'localhost';

FLUSH PRIVILEGES;
