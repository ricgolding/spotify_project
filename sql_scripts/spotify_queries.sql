-- Analyzing the spotify dataset


-- Top 5 most economically impactful festivals by country and genre

SELECT country, genre, format(total_economic_impact,2) as total_economic_impact from (
SELECT r.country, g.genre, SUM(m.economic_impact) AS total_economic_impact
FROM genres AS g
JOIN festivals_genres AS f ON g.genre_id = f.genre_id
JOIN music_festivals AS m ON f.festival_id = m.festival_id
JOIN region AS r ON m.country_id = r.country_id
GROUP BY r.country, g.genre
ORDER BY total_economic_impact DESC) AS s3
limit 5;



-- Which countries host the most music festivals by attendance? United Kingdom, Belgium, and Spain.

SELECT r.country, SUM(m.attendance) AS total_attendance
FROM music_festivals as m
join region as r on m.country_id = r.country_id
group by r.country
order by total_attendance DESC;

-- What are the economic impacts of music festivals in different regions? United Kingdom, Belgium, Germany


SELECT country, FORMAT(total_impact, "#,###") AS formatted_impact, currency
FROM (
    SELECT r.country, SUM(m.economic_impact) AS total_impact, r.currency
    FROM music_festivals AS m
    JOIN region AS r ON m.country_id = r.country_id
    GROUP BY r.country, currency
    ORDER BY total_impact DESC
) AS s
limit 10;

-- Is there a relationship between genre type and the economic impact of festivals?

SELECT genre, country, currency, FORMAT(total_impact, 2) AS total_impact, format(total_attendance,2) as total_attendance, number_of_festivals
FROM (
    SELECT 
        CASE 
            WHEN g.genre = 'Electronic/Indie' THEN 'Indie/Electronic'
            WHEN g.genre = 'Rock/Pop' THEN 'Pop/Rock'
            WHEN g.genre = 'Rock/Electronic' THEN 'Electronic/Rock'
            ELSE g.genre 
        END AS genre,
        r.country,
        SUM(m.economic_impact) AS total_impact,
        SUM(m.attendance) AS total_attendance,
        COUNT(m.festival_id) AS number_of_festivals,
        r.currency
    FROM music_festivals AS m
    JOIN festivals_genres AS f ON m.festival_id = f.festival_id
    JOIN genres AS g ON f.genre_id = g.genre_id
    JOIN region AS r ON m.country_id = r.country_id
    GROUP BY genre, r.country, r.currency
    ORDER BY total_impact DESC
) AS s2
WHERE country IN ('Romania')
LIMIT 10;


SELECT genre, country, currency, FORMAT(total_impact, 2) AS total_impact, format(total_attendance,2) as total_attendance, number_of_festivals
FROM (
    SELECT 
        CASE 
            WHEN g.genre = 'Electronic/Indie' THEN 'Indie/Electronic'
            WHEN g.genre = 'Rock/Pop' THEN 'Pop/Rock'
            WHEN g.genre = 'Rock/Electronic' THEN 'Electronic/Rock'
            ELSE g.genre 
        END AS genre,
        r.country,
        SUM(m.economic_impact) AS total_impact,
        SUM(m.attendance) AS total_attendance,
        COUNT(m.festival_id) AS number_of_festivals,
        r.currency
    FROM music_festivals AS m
    JOIN festivals_genres AS f ON m.festival_id = f.festival_id
    JOIN genres AS g ON f.genre_id = g.genre_id
    JOIN region AS r ON m.country_id = r.country_id
    GROUP BY genre, r.country, r.currency
    ORDER BY total_impact DESC
) AS s2
WHERE country IN ('Hungary', 'Spain')
LIMIT 10;

SELECT genre, country, currency, FORMAT(total_impact, 2) AS total_impact, format(total_attendance,2) as total_attendance, number_of_festivals
FROM (
    SELECT 
        CASE 
            WHEN g.genre = 'Electronic/Indie' THEN 'Indie/Electronic'
            WHEN g.genre = 'Rock/Pop' THEN 'Pop/Rock'
            WHEN g.genre = 'Rock/Electronic' THEN 'Electronic/Rock'
            ELSE g.genre 
        END AS genre,
        r.country,
        SUM(m.economic_impact) AS total_impact,
        SUM(m.attendance) AS total_attendance,
        COUNT(m.festival_id) AS number_of_festivals,
        r.currency
    FROM music_festivals AS m
    JOIN festivals_genres AS f ON m.festival_id = f.festival_id
    JOIN genres AS g ON f.genre_id = g.genre_id
    JOIN region AS r ON m.country_id = r.country_id
    GROUP BY genre, r.country, r.currency
    ORDER BY total_impact DESC, total_attendance DESC
) AS s2
LIMIT 10;

-- USER PREFERENCES:


-- Most amount of songs trending by country.


SELECT s.artist_name, re.country, COUNT(DISTINCT s.name) AS song_count 
FROM songs AS s
JOIN rankings AS r ON s.spotify_id = r.spotify_id
JOIN region AS re ON r.country_id = re.country_id
GROUP BY s.artist_name, re.country
order by song_count desc
limit 10;

SELECT s.artist_name, re.country, COUNT(DISTINCT s.name) AS song_count 
FROM songs AS s
JOIN rankings AS r ON s.spotify_id = r.spotify_id
JOIN region AS re ON r.country_id = re.country_id
where re.country in ('Spain','Hungary')
GROUP BY s.artist_name, re.country
order by song_count desc
limit 10;

-- Most amount of songs trending in Spain -- A festival with Quevedo, Bad Bunny, Rauw Alejandro and other streamed artists has potential to have economic impact

SELECT s.artist_name, re.country, COUNT(DISTINCT s.name) AS song_count 
FROM songs AS s
JOIN rankings AS r ON s.spotify_id = r.spotify_id
JOIN region AS re ON r.country_id = re.country_id
WHERE country = 'Spain'
GROUP BY s.artist_name, re.country
order by song_count desc;

-- Most amount of songs trending by country -- a concert starring DESH with hip hop will work in a underserved market

SELECT s.artist_name, re.country, COUNT(DISTINCT s.name) AS song_count 
FROM songs AS s
JOIN rankings AS r ON s.spotify_id = r.spotify_id
JOIN region AS re ON r.country_id = re.country_id
where country = 'Hungary'
GROUP BY s.artist_name, re.country
order by song_count desc;


-- Most amount of times an artist has had a daily rank of 10 or less
SELECT artist_name, country, popularity_count 
FROM (
SELECT 
	CASE
		WHEN s.artist_name like '%DESH%' THEN 'DESH'
        WHEN s.artist_name like '%Myke Towers%' THEN 'DESH'
        ELSE s.artist_name
    END as artist_name, 
    re.country, 
    COUNT(r.popularity) AS popularity_count
FROM rankings AS r
JOIN region AS re ON re.country_id = r.country_id
JOIN songs AS s ON r.spotify_id = s.spotify_id
GROUP BY s.artist_name, re.country) as s4
order by popularity_count desc;


-- Most popular artist by country

SELECT 
    s4.artist_name, 
    s4.country, 
    COUNT(s4.daily_rank) AS count_rank
FROM (
    SELECT 
        CASE
            WHEN s.artist_name LIKE '%DESH%' THEN 'DESH'
            WHEN s.artist_name LIKE '%Myke Towers%' THEN 'DESH'
            ELSE s.artist_name
        END AS artist_name, 
        re.country, 
        r.daily_rank
    FROM rankings AS r
    JOIN region AS re ON re.country_id = r.country_id
    JOIN songs AS s ON r.spotify_id = s.spotify_id
    WHERE r.daily_rank = 1
) AS s4
WHERE s4.country in ('Romania')
GROUP BY s4.artist_name, s4.country
ORDER BY count_rank DESC;

SELECT 
    s4.artist_name, 
    s4.country, 
    COUNT(s4.daily_rank) AS count_rank
FROM (
    SELECT 
        CASE
            WHEN s.artist_name LIKE '%DESH%' THEN 'DESH'
            WHEN s.artist_name LIKE '%Myke Towers%' THEN 'DESH'
            ELSE s.artist_name
        END AS artist_name, 
        re.country, 
        r.daily_rank
    FROM rankings AS r
    JOIN region AS re ON re.country_id = r.country_id
    JOIN songs AS s ON r.spotify_id = s.spotify_id
    WHERE r.daily_rank = 1
) AS s4
WHERE s4.country in ('Hungary')
GROUP BY s4.artist_name, s4.country
ORDER BY count_rank DESC;
