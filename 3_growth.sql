

SELECT
	*
FROM grp_member;

-- 2.)

-- -- Growth of LetsMeet based on the # of members who joined each year


SELECT 
    year_joined, COUNT(member_id) AS members_joined
FROM
    (SELECT 
        member_id, YEAR(MIN(joined)) AS year_joined
    FROM
        grp_member
    GROUP BY member_id) AS min_year
GROUP BY year_joined
ORDER BY year_joined;

-- 3.)


-- Renaming smaller cities to the name of their larger urban areas



SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member 
SET 
    city = 'Chicago'
WHERE
    city IN ('East Chicago' , 'West Chicago',
        'North Chicago',
        'Chicago Heights',
        'Chicago Ridge',
        'Chicago');

UPDATE grp_member 
SET 
    city = 'San Francisco'
WHERE
    city IN ('San Francisco' , 'South San Francisco');

UPDATE grp_member 
SET 
    city = 'New York'
WHERE
    city IN ('New York' , 'West New York');

SELECT 
    city
FROM
    grp_member
GROUP BY city;


-- 4.)


-- Differences in year over year growth by city (SUBQUERY)



SELECT 
    year_, COUNT(member_id) AS members_joined_chicago
FROM
    (SELECT 
        member_id, YEAR(MIN(joined)) AS year_
    FROM
        grp_member
    WHERE
        city = 'Chicago'
    GROUP BY member_id) AS min_year
GROUP BY year_
ORDER BY year_;

SELECT 
    year_, COUNT(member_id) AS members_joined_SF
FROM
    (SELECT 
        member_id, YEAR(MIN(joined)) AS year_
    FROM
        grp_member
    WHERE
        city = 'San Francisco'
    GROUP BY member_id) AS min_year
GROUP BY year_
ORDER BY year_;

SELECT 
    year_, COUNT(member_id) AS members_joined_NY
FROM
    (SELECT 
        member_id, YEAR(MIN(joined)) AS year_
    FROM
        grp_member
    WHERE
        city = 'New York'
    GROUP BY member_id) AS min_year
GROUP BY year_
ORDER BY year_;


-- 5.)

-- Membership growth in 2017



SELECT 
    month_, COUNT(member_id) members_joined
FROM
    (SELECT 
        member_id, MONTH(MIN(joined)) AS month_
    FROM
        grp_member
    WHERE
        YEAR(joined) = '2017'
    GROUP BY member_id) AS min_month
GROUP BY month_
ORDER BY month_;


    












