--select * from film
with 
DocumentaryFilms as ( select * from film where description LIKE '% Documentary %' )
, 
DramaFilms as (select * from film where description LIKE '% Drama %' )
,
PanoramaFilms as (select * from film where description LIKE '% Panorama %' )
,
StoryFilms as (select * from film where description LIKE '% Story %' )

,
FilmTypeTemp as (
select 'Documentary' as FilmType , count(*) from DocumentaryFilms
union
select 'Drama' as FilmType, count(*) from DramaFilms
union
select 'Panorama' as FilmType, count(*) from PanoramaFilms
union
select 'Story' as FilmType, count(*) from StoryFilms
order by count desc
)

select *,DENSE_RANK() OVER (ORDER BY COUNt DESC) AS FilmType_Rank
from FilmTypeTemp