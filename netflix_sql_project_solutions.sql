
----------------------- 15 Business Problems & Solutions---------------------------

----1. Count the number of Movies vs TV Shows
select type,
count(*)  as tv_movie from netflix
group by type;



----2. Find the most common rating for movies and TV shows
SELECT 
type, rating
from (
select type,
rating,
count(*),
RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
from netflix
group by 1,2
order by 1,3
)
as t1
where ranking=1;



---3. List all movies released in a specific year (e.g., 2020)

SELECT  type FROM netflix
where type='Movie'
AND release_year='2020';




----4. Find the top 5 countries with the most content on Netflix


SELECT * 
FROM
(
	SELECT 
		-- country,
		UNNEST(STRING_TO_ARRAY(country, ',')) as country,
		COUNT(*) as total_content
	FROM netflix
	GROUP BY 1
)as t1
WHERE country IS NOT NULL
ORDER BY total_content DESC
LIMIT 5;



----5. Identify the longest movie

select *
from netflix
where type='Movie'
AND duration=(select max(duration)from netflix);




----6. Find content added in the last 5 years

select *from
netflix
where to_date(date_added ,'Month DD, YYYY')>=current_date -interval '5 years';



----7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

select  type, director
from netflix
where
director like '%Rajiv Chilaka%';



---8. List all TV shows with more than 5 seasons

select *from netflix;

select type, 
duration
from netflix
WHERE type = 'TV Show'
AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 5;



---9. Count the number of content items in each genre

SELECT 
	
		UNNEST(STRING_TO_ARRAY(listed_in, ',')) as listed,
		COUNT(*) as total_content
	FROM netflix
	GROUP BY 1;

	

---10.Find each year and the average numbers of content release in India on Netflix.return the top 5 year with highest avg content release!

SELECT 
	country,
	release_year,
	COUNT(show_id) as total_release,
	ROUND(
		COUNT(show_id)::numeric/
								(SELECT COUNT(show_id) FROM netflix WHERE country = 'India')::numeric * 100 
		,2
		)
		as avg_release
FROM netflix
WHERE country = 'India' 
GROUP BY country, 2
ORDER BY avg_release DESC 
LIMIT 5;




---11. List all movies that are documentaries

SELECT * FROM netflix
WHERE listed_in LIKE '%Documentaries' ;




---12. Find all content without a director

SELECT *FROM netflix
where director is null;


---13. Find how many movies actor 'Salman Khan' appeared in last 10 years!


SELECT * FROM netflix
WHERE 
	casts LIKE '%Salman Khan%'
	AND 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;
	

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

select 
unnest(string_to_array(casts ,'')) as actor,
count(*)
from netflix
where country='India'
group by 1
order by 2 desc
limit 10;


--15.
--Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
--the description field. Label content containing these keywords as 'Bad' and all other 
--content as 'Good'. Count how many items fall into each category.


SELECT 
    category,
    COUNT(*) AS content_count
FROM (
    SELECT 
        CASE 
            WHEN description ILIKE '%kill%' 
              OR description ILIKE '%violence%'
            THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY category
ORDER BY content_count DESC;





