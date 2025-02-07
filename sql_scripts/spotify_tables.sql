USE `spotify_project`;

SET GLOBAL local_infile = 'ON';
SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/album_df.csv'
INTO TABLE albums
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/demographics_df.csv'
INTO TABLE demographics
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/region_df.csv'
INTO TABLE region
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/music_festivals_df.csv'
INTO TABLE music_festivals
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/genre_df.csv'
INTO TABLE genres
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/dates_df.csv'
INTO TABLE dates
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

delete from rankings;

LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/rankings_df.csv'
INTO TABLE rankings
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from rankings;

LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/songs_features_df.csv'
INTO TABLE songs_features
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/festivals_genres_df.csv'
INTO TABLE festivals_genres
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/ricardogolding/Documents/Ironhack/Bootcamp/Week4/spotify_project/data/clean/songs_df.csv'
INTO TABLE songs
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



select count(*) from rankings;