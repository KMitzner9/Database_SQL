
/*** ZOO_DB ASSIGNMENT 1 ***/

USE db_zoo;

SELECT * FROM tbl_habitat;


/*** ZOO_DB ASSIGNMENT 2 ***/

SELECT species_name
FROM tbl_species
WHERE species_order = 3;


/*** ZOO_DB ASSIGNMENT 3 ***/

SELECT nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <= 600;


/*** ZOO_DB ASSIGNMENT 4 ***/

SELECT species_name
FROM tbl_species
WHERE species_nutrition BETWEEN 2202 AND 2206;


/*** ZOO_DB ASSIGNMENT 5 ***/

SELECT tbl_species.species_name AS 'Species Name:', tbl_nutrition.nutrition_type AS 'Nutrition Type:'
FROM tbl_species INNER JOIN tbl_nutrition ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;


/*** ZOO_DB ASSIGNMENT 6 ***/

/* took a break and needed to get back into the dB, and then used the SELECT * to view all databases necessary to fulfill request */
USE db_zoo;
SELECT * FROM tbl_species;
SELECT * FROM tbl_specialist;
SELECT * FROM tbl_care;

/* creating an inner join on three tables, but only displaying info from two of them */
SELECT tbl_species.species_name, tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.specialist_contact
FROM tbl_care
INNER JOIN tbl_species ON tbl_species.species_care = tbl_care.care_id
INNER JOIN tbl_specialist ON tbl_care.care_specialist = tbl_specialist.specialist_id
WHERE species_name = 'penguin';


/*** DB ASSIGNMENT 7 ***/

CREATE DATABASE circus_db;
USE circus_db;

CREATE TABLE tbl_artists (
	artist_id INT PRIMARY KEY NOT NULL IDENTITY(100, 1),
	artist_name VARCHAR(50) NOT NULL,
	artist_exp INT NOT NULL,
	artist_media VARCHAR(100)
);

CREATE TABLE tbl_acts (
	act_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	act_name VARCHAR(100) NOT NULL,
	act_artist VARCHAR(50) NOT NULL,
	act_type VARCHAR(50) NOT NULL,
	act_length VARCHAR (20) NOT NULL,
	act_artist_id INT NOT NULL CONSTRAINT fk_artist_id FOREIGN KEY REFERENCES tbl_artists(artist_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO tbl_artists (artist_name, artist_exp, artist_media)
	VALUES
	('Grace Good', 12, 'www.GraceGoodEntertainment.com'),
	('Tera Zera', 8, 'Instagram: @StrongWoman'),
	('Nicolo Kehrwald', 22, 'www.LittleHandbalancingBook.com'),
	('Molly Moo', 5, 'FaceBook: Molly Moo Rolls'),
	('Amy Hazel', 14, 'www.AmyHazelPole.com');

SELECT * FROM tbl_artists;
SELECT * FROM tbl_acts;

INSERT INTO tbl_acts (act_name, act_artist, act_type, act_length, act_artist_id)
	VALUES
	('Grace in Flames', 'Grace Good', 'multi-prop fire dance', '15 min', 100),
	('Strongest Lady in the PACNW', 'Tera Zera', 'strong woman', '25 min', 101),
	('Tilted', 'Nicolo Kehrwald', 'aerial rope', '6 min', 102),
	('They See Me Rollin', 'Molly Moo', 'german wheel', '8 min', 103),
	('Pony Express', 'Amy Hazel', 'poledance', '5 min', 104);

INSERT INTO tbl_acts (act_name, act_artist, act_type, act_length, act_artist_id)
	VALUES
	('There Be Clowns', 'Molly Moo', 'clown', '30 min', 103),
	('There Be Clowns', 'Tera Zera', 'clown', '30 min', 101);

SELECT tbl_acts.act_name, tbl_artists.artist_media
FROM tbl_acts
INNER JOIN tbl_artists ON tbl_acts.act_artist_id = tbl_artists.artist_id
WHERE tbl_acts.act_name = 'There Be Clowns';
