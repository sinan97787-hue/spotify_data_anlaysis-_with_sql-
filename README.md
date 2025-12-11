# Spotify SQL Analysis (PostgreSQL)

A SQL project analyzing Spotify + YouTube music data using PostgreSQL.

---

## 📌 Table Schema

```sql
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
```

---

## 📥 Import Data

```sql
COPY spotify
FROM 'C:/path/spotify.csv'
DELIMITER ','
CSV HEADER;
```

---

## 🧠 SQL Queries

### 1. Tracks with more than 1B streams
```sql
SELECT track, stream
FROM spotify
WHERE stream > 1000000000;
```

### 2. Unique albums with artists
```sql
SELECT DISTINCT album, artist
FROM spotify;
```

### 3. Total comments for licensed tracks
```sql
SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed = TRUE;
```

### 4. Tracks where album_type = 'single'
```sql
SELECT track, album_type
FROM spotify
WHERE album_type = 'single';
```

### 5. Count tracks per artist
```sql
SELECT artist, COUNT(*)
FROM spotify
GROUP BY artist;
```

### 6. Average danceability per album
```sql
SELECT album, AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album
ORDER BY avg_danceability DESC;
```

### 7. Top 5 high-energy tracks
```sql
SELECT track, MAX(energy) AS max_energy
FROM spotify
GROUP BY track
ORDER BY max_energy DESC
LIMIT 5;
```

### 8. Tracks with official videos
```sql
SELECT track, SUM(views), SUM(likes)
FROM spotify
WHERE official_video = TRUE
GROUP BY track
ORDER BY SUM(views) DESC;
```

### 9. Total views per album
```sql
SELECT album, SUM(views) AS total_views
FROM spotify
GROUP BY album
ORDER BY total_views DESC;
```

### 10. Tracks streamed more on Spotify than YouTube
```sql
SELECT track, stream, most_played_on
FROM spotify
WHERE most_played_on = 'spotify';
```

### 11. Top 3 tracks by views (RANK)
```sql
SELECT track, artist, SUM(views) AS total_views,
       RANK() OVER (ORDER BY SUM(views) DESC) AS rnk
FROM spotify
GROUP BY track, artist
ORDER BY total_views DESC
LIMIT 3;
```

### 12. Tracks with liveness above average
```sql
SELECT track, liveness
FROM spotify
WHERE liveness > (SELECT AVG(liveness) FROM spotify);
```

---

## 📁 Project Files

```
📦 postgresql-spotify-project
 ┣ 📜 postgresql (spotify).sql
 ┣ 📜 spotify.csv
 ┗ 📜 README.md
```

---

## 👤 Author
Sinan  




