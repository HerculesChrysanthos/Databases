--QUERY 1
CREATE INDEX index1 on Listing(host_id);

--QUERY 2
CREATE INDEX index2 on Price(price,guests_included);

--QUERY 3
CREATE INDEX index3 on Geolocation(properties_neighbourhood);

--QUERY 4
CREATE INDEX index5 on Host(since);
CREATE INDEX index6 on Listing(name);

--QUERY 5
CREATE INDEX index8 on Room_Amenity_Connection(amenity_id);

--QUERY 6
CREATE INDEX index9 on Price(price);
CREATE INDEX index10 on Listing_Summary(minimum_nights);

--QUERY 7
CREATE INDEX index11 on Location(state,neighbourhood);