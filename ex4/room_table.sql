create table Room AS(
	Select
	id, 
	accommodates, 
	bathrooms, 
	bedrooms, 
	beds, 
	bed_type,
	amenities, 
	square_feet, 
	price, 
	weekly_price, 
	monthly_price, 
	security_deposit
	from Listings
);

alter table Room
rename id to listing_id;

alter table Room
add foreign key(listing_id) references Listings(id);

alter table Listings
drop accommodates, 
drop bathrooms, 
drop bedrooms, 
drop beds, 
drop bed_type,
drop amenities, 
drop square_feet, 
drop price, 
drop weekly_price, 
drop monthly_price, 
drop security_deposit;