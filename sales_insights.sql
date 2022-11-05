-- Answer the questions from the Sales team in this file.


-- Active Cities


SELECT 
    city
FROM
    grp_member
WHERE
    member_status = 'active'
GROUP BY city;

SELECT 
    *
FROM
    city
GROUP BY city;

/* 
1. What cities have active members?
2. Are there any cities listed in the city table with no active members? If so, what state are those cities in?   

San Fransisco, New York, Chicago, West New York, West Chicago, South San Francisco, North Chicago, Chicago Heights, East Chicago, and Chicago Ridge all have active members.

New York Mills and Chicago Park are in the city table and have no active members. These cities are in New York and California respectively.  
 */


-- Groups


SELECT 
    join_mode, COUNT(*)
FROM
    grp
GROUP BY join_mode;

/* How many groups are currentyly open, waiting for approval, and/or closed?

There are 3,602 open groups. 723 groups are waiting for approval and 15 are closed. Assuming all open groups are still active, there is a high success rate since only 15 groups have closed. 
*/


-- Categories


SELECT 
    category_name, COUNT(grp.category_id)
FROM
    category
        JOIN
    grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(grp.category_id) DESC;

/* What are the five categories that contain the most groups? What are the five categories that contain the least number of groups?  

Most groups belong to Tech, Career & Business, Socializing, Health & Wellbeing, and Language and Ethnic Identity. Tech and Career & Business each have more than double the amount of groups as the next leading category which is Socializing. The categories with the least amount of groups are Paranormal, Cars & Motorcycles, Sci-Fi & Fantasy, Lifestyle, and Hobbies & Crafts. Paranormal is the category with the least amount of groups at four. 
*/


-- Members


SELECT 
    *
FROM
    (SELECT 
        COUNT(DISTINCT (member_id)) number_of_members
    FROM
        grp_member) AS a,
    (SELECT 
        COUNT(DISTINCT (member_id)) members_in_chicago
    FROM
        grp_member
    WHERE
        city ="Chicago") AS b;

/*
1. How many members are there?
2. What percentage of members are in Chicago?

 There are 39,980 total members. About 21.2 percent of all members are from Chicago and the Chicago area, which represents a little over one fifth of all members. */