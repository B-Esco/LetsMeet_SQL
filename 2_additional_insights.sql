
-- venue_


SELECT 
    *
FROM
    venue_;

SELECT 
    city, COUNT(venue_id)
FROM
    venue_
GROUP BY city;

SELECT 
    state, COUNT(venue_id)
FROM
    venue_
GROUP BY state;

/* Events are held in many different venues throughout the participating cities on LetsMeet. New York is the city which easily leads the way 
in the amount of venues it has, followed by Illinois and California. California only has a little over one third of the amount of venues that 
New York does.        */


-- grp


SELECT 
    join_mode, SUM(members)
FROM
    grp
GROUP BY join_mode;

SELECT 
    visibility, SUM(members)
FROM
    grp
GROUP BY visibility;

/* The three "join modes" are Open, Approval, and Closed. 90 percent of all members belong to groups with an "open" join mode. 
89.86 percent of all members belong to groups with "public" visiibility. Groups that are completley inclusive and open to all members contain the
bulk of all activity throughout the platform.   */


-- grp_member


SELECT 
    *
FROM
    grp_member;

SELECT 
    grp_member.group_id,
    COUNT(DISTINCT (member_id)),
    group_name,
    grp_member.city,
    category_name
FROM
    grp_member
        JOIN
    grp ON grp_member.group_id = grp.group_id
        JOIN
    category ON grp.category_id = category.category_id
GROUP BY group_id
ORDER BY COUNT(DISTINCT (member_id)) DESC;

/* When we look at the top groups in the participating cities, we can see that nine out the top ten groups with the most members are
in Chicago and New York. The lone group in the top ten from San Francisco (SF Free School) has 222 members. The group with the most amount of members
on the platform is a Socializing group from Chicago and has 436 members.    */


-- city


SELECT 
    *
FROM
    city;

SELECT 
    state, COUNT(zip), SUM(member_count)
FROM
    city
GROUP BY state
ORDER BY COUNT(zip) DESC;

/* The states and cities on the platform contain groups and members in various zip codes.  Illinois is the state with the most extensive geographic
reach in terms of zip codes with groups in them. They have five distinct zip codes with members. New York is by far the state with the most members.     */
    

-- event


SELECT 
    *
FROM
    event;

SELECT 
    event_id, yes_rsvp_count, duration
FROM
    event
GROUP BY event_id
ORDER BY yes_rsvp_count DESC;

SELECT 
    event_id, duration
FROM
    event
GROUP BY event_id
ORDER BY duration DESC;

SELECT 
    how_to_find_us, COUNT(how_to_find_us), COUNT(event_id)
FROM
    event
WHERE
    how_to_find_us = 'not_found';

SELECT 
    COUNT(DISTINCT (event_id))
FROM
    event;

SELECT 
    *
FROM
    event
WHERE
    how_to_find_us = 'not_found';

/* There are many diverse events being held through the platform. Out of the 5,807 distinct events, 2,735 have a "not_found" value under the
column named "how_to_find_us". This means almost have of the groups are not directing their members to the events through LetsMeet. Many groups are
instructing its members on how to find the events through the event description.     */


-- category


SELECT 
    *
FROM
    category;

SELECT 
    category_name, SUM(members)
FROM
    category
        JOIN
    grp ON category.category_id = grp.category_id
GROUP BY category_name
ORDER BY SUM(members) DESC;

SELECT 
    category_name, city, SUM(members)
FROM
    category
        JOIN
    grp ON category.category_id = grp.category_id
        JOIN
    city ON grp.city_id = city.city_id
WHERE
    category_name = 'tech'
GROUP BY city
ORDER BY SUM(members) DESC;

/* LetsMeet has a diverse variety of categories of which groups belong to. Tech is by far the most popular category throughout the platform but
more specifically, Tech in New York is the category and city with the most amount of members out of all those on LetsMeet.        */


