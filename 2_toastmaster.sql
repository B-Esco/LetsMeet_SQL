

-- 2.) "The total number of Toastmaster events on LetsMeet"



SELECT 
    COUNT(*)
FROM
    event
WHERE
    event_name LIKE ('%toastmaster%')
        OR ('%Toastmaster%');


-- 3.) "Toastmaster events alongside cities in which they are hosted"


SELECT 
    event_name, city
FROM
    event
        JOIN
    grp ON event.group_id = grp.group_id
        JOIN
    city ON grp.city_id = city.city_id
WHERE
    event_name LIKE ('%Toastmaster%')
        OR ('%toastmaster%');
        
	
    
 -- 4.) "Exact counts for how particular cities host toastmasters events"
 
 

SELECT 
    city, COUNT(event_id)
FROM
    event
        JOIN
    grp ON event.group_id = grp.group_id
        JOIN
    city ON grp.city_id = city.city_id
WHERE
    event_name LIKE ('%Toastmaster%')
        OR ('%toastmaster%')
GROUP BY city;
