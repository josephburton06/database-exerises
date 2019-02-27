USE albums_db;
SHOW TABLES;
DESCRIBE albums;
SELECT *
FROM albums;
SELECT name
FROM albums
WHERE artist = 'Pink Floyd';
SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
SELECT name, genre
FROM albums
WHERE name = 'Nevermind';
SELECT name, release_date
FROM albums 
WHERE release_date BETWEEN 1990 AND 1999;
SELECT name, sales
FROM albums 
WHERE sales < 20.0;
SELECT name, genre 
FROM albums 
WHERE genre = 'Rock'; -- Does not include 'Hard Rock' or 'Progressive Rock' as this search is looking specifically to match the string 'Rock' exactly is queried.


