

SELECT
	*
FROM grp;

-- 2.)



SELECT 
    SUM(CASE
        WHEN rating = 0 THEN 1
        ELSE 0
    END) '0_rating',
    SUM(CASE
        WHEN rating BETWEEN 1 AND 1.99 THEN 1
        ELSE 0
    END) '1_rating',
    SUM(CASE
        WHEN rating BETWEEN 2 AND 2.99 THEN 1
        ELSE 0
    END) '2_rating',
    SUM(CASE
        WHEN rating BETWEEN 3 AND 3.99 THEN 1
        ELSE 0
    END) '3_rating',
    SUM(CASE
        WHEN rating BETWEEN 4 AND 4.99 THEN 1
        ELSE 0
    END) '4_rating',
    SUM(CASE
        WHEN rating = 5 THEN 1
        ELSE 0
    END) '5_rating'
FROM
    grp;
    
    
-- 3.)    


SELECT 
    group_id, group_name, rating, who, members, description
FROM
    grp
WHERE
    rating = 5
ORDER BY members DESC
LIMIT 15;

SELECT 
    group_id, group_name, rating, who, members, description
FROM
    grp
WHERE
    rating = 4
ORDER BY members DESC
LIMIT 15;

-- 4.)



SELECT 
    group_name,
    rating,
    who,
    members,
    city,
    category_name,
    description
FROM
    grp
        JOIN
    city ON grp.city_id = city.city_id
        JOIN
    category ON grp.category_id = category.category_id
WHERE
    rating = 5
ORDER BY members DESC
LIMIT 50;

