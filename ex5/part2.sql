/*
Find all neighbourhoods with properties_neighbourhood>'Γ' and the neighbourhood
on neighbourhood is equal to the properties_neighbourhood on geolocation.Also the output is
sorted with properties_neighbourhood on geolocation .
Output: 35 rows.
*/
SELECT geolocation.properties_neighbourhood
FROM geolocation
FULL OUTER JOIN neighbourhood 
ON neighbourhood.neighbourhood=geolocation.properties_neighbourhood
WHERE geolocation.properties_neighbourhood>'Γ'
group by geolocation.properties_neighbourhood;






/*
Find all since from host and name from listing where the id on host is greater than 
the id on listing and the since from host is equal to '2011-09-15'.Also the output
is sorted with since in host and name in listing.
Output: 183 rows.
*/
SELECT host.since,listing.name
FROM host
FULL OUTER JOIN listing
ON host.id>listing.id
WHERE host.since='2011-09-15'
group by host.since,listing.name;






/*
Find all listing_id on room and amenity_id on room_amenity_connection where the listing 
id on room is equal to the listing_id on room_amenity_connection and the amenity_id is 
equal to 25.
Output: 943 rows.
*/
SELECT room.listing_id,room_amenity_connection.amenity_id
FROM room
INNER JOIN room_amenity_connection
ON room.listing_id=room_amenity_connection.listing_id
WHERE room_amenity_connection.amenity_id=25;






/*
Find all prices on price and minimumu nights on listing summary where
the minimum nights on listing_summary and the minimumu nights on price are equal and the 
columns on price is less than 14.
Output: 64 rows.
*/

SELECT price.price,listing_summary.minimum_nights
FROM price
INNER JOIN listing_summary
ON listing_summary.minimum_nights=price.minimum_nights
GROUP BY price.price,listing_summary.minimum_nights
HAVING COUNT(price.price)<14;





/*
Find all neighbourhood on location and state on location where the neighbourhood on location is 
equal to the neighbourhood on neighbourhood and the columns on location.state is greater than 50.
Output: 6 rows.
*/
SELECT location.neighbourhood,location.state
FROM location
FULL OUTER JOIN neighbourhood
ON location.neighbourhood=neighbourhood.neighbourhood
GROUP BY location.neighbourhood,location.state
HAVING count(location.state)>50;