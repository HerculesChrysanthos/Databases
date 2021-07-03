create table Price AS(
	SELECT
	id, 
	price, 
	weekly_price, 
	monthly_price, 
	security_deposit, 
	cleaning_fee,
	guests_included, 
	extra_people, 
	minimum_nights, 
	maximum_nights,
	minimum_minimum_nights, 
	maximum_minimum_nights, 
	minimum_maximum_nights,
	maximum_maximum_nights, 
	minimum_nights_avg_ntm, 
	maximum_nights_avg_ntm
	from Listings
);

alter table Price
rename id to listing_id;

Update Price
Set price = replace(price,'$','');

Update Price
Set price = replace(price,',','');

Alter table Price
alter price type numeric Using price::numeric;

Update Price
Set weekly_price = replace(weekly_price,'$','');

Update Price
Set weekly_price = replace(weekly_price,',','');

Alter table Price
alter weekly_price type numeric Using weekly_price::numeric;

Update Price
Set monthly_price = replace(monthly_price,'$','');

Update Price
Set monthly_price = replace(monthly_price,',','');

Alter table Price
alter monthly_price type numeric Using monthly_price::numeric;

Update Price
Set security_deposit = replace(security_deposit,'$','');

Update Price
Set security_deposit = replace(security_deposit,',','');

Alter table Price
alter security_deposit type numeric Using security_deposit::numeric;

Update Price
Set cleaning_fee = replace(cleaning_fee,'$','');

Update Price
Set cleaning_fee = replace(cleaning_fee,',','');

Alter table Price
alter cleaning_fee type numeric Using cleaning_fee::numeric;

Update Price
Set extra_people = replace(extra_people,'$','');

Update Price
Set extra_people = replace(extra_people,',','');

Alter table Price
alter extra_people type numeric Using extra_people::numeric;

alter table Listings
drop price, 
drop weekly_price, 
drop monthly_price, 
drop security_deposit, 
drop cleaning_fee,
drop guests_included, 
drop extra_people, 
drop minimum_nights, 
drop maximum_nights,
drop minimum_minimum_nights, 
drop maximum_minimum_nights, 
drop minimum_maximum_nights,
drop maximum_maximum_nights, 
drop minimum_nights_avg_ntm, 
drop maximum_nights_avg_ntm;

alter table Price
add foreign key(listing_id) references Listings(id);
