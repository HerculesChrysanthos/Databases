create table Location AS(
	Selecet
	id, 
	street, 
	neighbourhood, 
	neighbourhood_cleansed, 
	city, 
	state,
	zipcode, 
	market, 
	smart_location, 
	country_code, 
	country, 
	latitude, 
	longitude,
	is_location_exact
	from Listings
);

alter table Location
rename id to listing_id;

alter table Listings
drop street, 
drop neighbourhood, 
drop neighbourhood_cleansed, 
drop city, 
drop state,
drop zipcode, 
drop market, 
drop smart_location, 
drop country_code, 
drop country, 
drop latitude, 
drop longitude,
drop is_location_exact;

alter table Location
add foreign key(listing_id) references Listings(id);

alter table Location
add foreign key(neighbourhood_cleansed) references Neighbourhoods(neighbourhood);