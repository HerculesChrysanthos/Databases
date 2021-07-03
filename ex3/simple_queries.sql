/*
Find all rentings from all houses with the neighbourhood 'ΑΚΡΟΠΟΛΗ'
and the neighbourhood on listings_summary is equal with the neighbourhood on
neighbourhoods.
Output: 386 rows.
*/
SELECT listings_summary.neighbourhood,listings_summary.name
FROM listings_summary
INNER JOIN neighbourhoods
ON listings_summary.neighbourhood= neighbourhoods.neighbourhood
WHERE neighbourhoods.neighbourhood='ΑΚΡΟΠΟΛΗ';






/*
Find the max host_listings_count where the host_name is 'Irene' from the table
listings.
Output: 1 row.
*/
SELECT MAX(host_listings_count)
FROM listings
WHERE host_name='Irene';






/*
Find the min price whre the neighbourhood is 'ΑΜΠΕΛΟΚΗΠΟΙ' from the table
listings_summary.
Output: 1 row.
*/
SELECT MIN(price)
FROM listings_summary
WHERE neighbourhood='ΑΜΠΕΛΟΚΗΠΟΙ';






/*
Find all the distinct rentings from all houses that took place in the 23 of March 2020 
and the id on reviews is equal to the id on calendar.
Output: 2 rows.
*/
SELECT DISTINCT reviews.date,reviews.reviewer_name,calendar.available
FROM reviews
INNER JOIN calendar
ON reviews.id= calendar.listing_id
WHERE calendar.date='2020-03-23'






/*
Find all the distinct rentings from all houses and the neighbourhood names are printed 
alphabetically(abc..yz) and the host_name printed the opposite way(z..cba).Where the host_name on listings_summary is equal to the the host_name in listings.
We also limited our search to the first 12 results.
Output: 12 rows.
*/
SELECT DISTINCT listings.neighbourhood,listings.host_name
FROM listings
INNER JOIN listings_summary
ON listings_summary.host_name=listings_host_name
ORDER BY listings.neighbourhood ASC, listings.host_name DESC limit 12;






/*
Find all the distinct prices,calendar available and id, where the listing_id on calendar
 is equal to the id on listings and available='true'.We also limited our search to the first
 50 results.

Output: 50 rows.
*/
SELECT DISTINCT calendar.price,calendar.available,calendar.listing_id
FROM calendar
INNER JOIN listings
ON calendar.listing_id=listings.id
WHERE calendar.available='true' limit 50;








/*
Find all the coordinates and the neighbourhood where the neighbourhood on neighbourhoods is equal
to the properties_neighbourhood on geolocation.Also we included only the properties_neighbourhood that 
starts with the letter 'Α'.

Output: 8 rows.
*/
SELECT geolocation.geometry_coordinates_0_0_7_1,neighbourhoods.neighbourhood
FROM geolocation
INNER JOIN neighbourhoods
ON neighbourhoods.neighbourhood=geolocation.properties_neighbourhood
WHERE properties_neighbourhood LIKE 'Α__%';










/*
Find all the prices and the reviewer_name with id='80955'

Output: 365 rows.
*/
SELECT calendar.price,reviews.reviewer_name
FROM calendar
INNER JOIN reviews
ON calendar.listing_id = reviews.listing_id
WHERE reviews.reviewer_id = 80955;







/*
Find all prices and reviewer_name where the listing_id on calendar is equal to the listing_id on reviews
but only the listing_id where the id's are between the numbers 82595 and 102722

Output: 26280 rows.
*/
SELECT calendar.price,reviews.reviewer_name
FROM calendar
INNER JOIN reviews
ON calendar.listing_id = reviews.listing_id
WHERE reviews.listing_id BETWEEN 82595 AND 102722;





/*
Find all neighbourhoods and minimum nights where the id on listings is equal to the id on 
listings_summary.Also we have included only the ones where the reviews per month on listings
is less than 7.
Output: 255 rows.
*/

SELECT DISTINCT listings.neighbourhood,listings_summary.minimum_nights
FROM listings
INNER JOIN listings_summary
ON listings.id = listings_summary.id
WHERE listings.reviews_per_month<'7';







/*
Find all the ids on reviews and the calculated_host_listings_count on listings summary
where the reviewer_name is equal to the host_name on listings_summary.
Output:67025 rows.
*/

SELECT DISTINCT reviews.listing_id,listings_summary.calculated_host_listings_count
FROM reviews
FULL OUTER JOIN listings_summary
ON reviews.reviewer_name = listings_summary.host_name;







/*
 Find all rentings from all houses that the id on
 listings is the same with the id on summary_listings.
Output:  11541 rows
*/
SELECT listings.name,summary_listings.availability_365
FROM listings
FULL OUTER JOIN summary_listings
ON listings.id = summary_listings.id;
