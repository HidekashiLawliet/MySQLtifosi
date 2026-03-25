
USE tifosi;

-- ============================
-- 1
-- ============================

SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;

-- ============================
-- 2
-- ============================
SELECT COUNT(*) AS total_ingredients
FROM ingredient;

-- ============================
-- 3
-- ============================
SELECT AVG(prix) AS prix_moyen
FROM focaccia;

-- ============================
-- 4
-- ============================
SELECT b.nom_boisson, m.nom_marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom_boisson ASC;

-- ============================
-- 5
-- ============================
SELECT i.nom_ingredient
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE f.nom_focaccia = 'Raclaccia';

-- ============================
-- 6
-- ============================

SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia
ORDER BY nb_ingredients DESC;


-- ============================
-- 7
-- ============================

SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom_focaccia
ORDER BY nb_ingredients DESC
LIMIT 1;


-- ============================
-- 8
-- ============================
SELECT f.nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
WHERE fi.id_ingredient = 1;  -- Ail


-- ============================
-- 9
-- ============================ i.nom_ingredient
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_ingredient IS NULL;


-- ============================
-- 10
-- ============================
SELECT f.nom_focaccia
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT fi.id_focaccia
    FROM focaccia_ingredient fi
    WHERE fi.id_ingredient = 7  -- Champignon
);