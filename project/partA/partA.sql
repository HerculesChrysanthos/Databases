/*Movies_Metadata*/

create table Movies_Metadata(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue bigint,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);

Delete From Movies_Metadata Where id in(
With cte AS(
     Select id, Row_Number() over(Partition By id) row_num
     From Movies_Metadata)
Select id
From cte
Where row_num>1);

alter table Movies_Metadata
add primary key(id);


/*Credits*/

create table Credits(
   casts text,
   crew text,
   id int
);

Delete From Credits Where id in(
With cte AS(
     Select id, Row_Number() over (Partition By id) row_num
     From Credits)
Select id
From cte
Where row_num>1);

alter table Credits
add primary key(id);

Delete From Credits
Where id Not in (Select id From Movies_Metadata);

Alter Table Credits
Add Foreign Key(id) References Movies_metadata(id);


/*Keywords*/

create table Keywords(
   id int,
   keywords text
);


Delete From Keywords Where id in(
With cte AS(
     Select id, Row_Number() over (Partition By id) row_num
     From Keywords)
Select id
From cte
Where row_num>1);

alter table Keywords
add primary key(id);

Delete From Keywords
Where id Not in (Select id From Movies_Metadata);

Alter Table Keywords
Add Foreign Key(id) References Movies_Metadata(id);



/*Links*/

create table Links(
   movieId int,
   imdbId int,
   tmdbId int
);

Delete From Links Where movieId in(
With cte AS(
     Select movieId, Row_Number() over (Partition By movieId) row_num
     From Links)
Select movieId
From cte
Where row_num>1);

Delete From Links
Where tmdbId Not in (Select id From Movies_Metadata);

Delete From Links
Where tmdbId is null;

alter table Links
add primary key(tmdbId);

Alter Table Links
Add Foreign Key(tmdbId) References Movies_Metadata(id);


/*Ratings_Small*/

create table Ratings_Small(
   userId int,
   movieId int,
   rating varchar(10),
   timestamp int
);

alter table Ratings_Small
add primary key(userId,movieId);

Delete From Ratings_Small
Where movieId Not in (Select id From Movies_Metadata);

Alter Table Ratings_Small
Add Foreign Key(movieId) References Movies_Metadata(id);

/*copyMovies: Χρειάζεται για το μέρος Β*/

create table copyMovies as(
	select regexp_split_to_table(genres,',') as genres,release_date,id
	from movies_metadata);

delete from copymovies
where not genres like '%name%';

UPDATE copymovies SET genres = replace(genres::TEXT,']','');
UPDATE copymovies SET genres = replace(genres::TEXT,'}','');
UPDATE copymovies SET genres = replace(genres::TEXT,':','');
UPDATE copymovies SET genres = replace(genres::TEXT,'''','');
UPDATE copymovies SET genres = replace(genres::TEXT,'name','');	

Alter Table copymovies
Add Foreign Key(id) References Movies_metadata(id);