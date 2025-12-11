-- create table
DROP TABLE IF EXISTS spotify;
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

  select * from spotify;

  -- retreive the names of all track that have more than one billion streams ?
   select track ,stream from spotify 
   where stream > 100000000
   group by track , stream;

 -- list all albums thier respective artist

 select distinct album ,artist
 from spotify;
  select distinct artist from spotify;
  select distinct album from spotify;

-- total number of comments for tracks where licenced = true?
 select* from spotify ;
 select licensed ,sum(comments) as total_comments from spotify 
 where licensed = 'true'
 group by licensed;

 -- find all tracks belong to the album type single ?
 select * from spotify;
 select track,album_type from spotify
 where album_type like 'single'
 group by track , album_type ;

-- count the total number of track by each artist?
 select * from spotify;
 select artist ,count(*) from spotify
 group by artist;

-- calculate the average dencibility of track in each album ?
select * from spotify;
select album ,avg(danceability) as avg_danceebility from spotify
group by album order by avg(danceability) desc 

-- find the top 5 tracks with highest energy values ?
select * from spotify;
select distinct track ,max(energy) as maximum_energy from spotify
group by distinct track order by max(energy) desc limit 5

-- list all tracks along with their views and likes where official_video = true ?
select * from spotify;
   select track,sum(views),sum(likes) from spotify 
   where official_video = 'true'
   group by track order by sum(views)desc

-- for each album calculate the total views of all associated tracks ?
  select * from spotify ;
   select  distinct album ,track, sum(views)as total_views from spotify
   group by distinct album,track order by sum(views) desc;
   
-- retreive the track name that have been streamed on spotify more than youtube ?
select * from spotify;
select track ,stream,most_played_on from spotify 

-- find the top 3 most views track each artist using window functions ?

 select  track ,artist ,sum(views) as sum_of_views,rank() over(order by sum(views)desc)
 from spotify 
 group by track, artist limit 5 

-- find the tracks where the livness score is abouve the average ?
select * from spotify ;
select avg(liveness) from spotify ;
 select track ,liveness from spotify
 where liveness > ( select avg(liveness) from spotify)
 group by track, liveness 
 order by avg(liveness) desc ;        
 
 