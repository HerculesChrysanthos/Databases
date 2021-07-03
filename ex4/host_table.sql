create table Host AS(
	select distinct
	host_id, 
	host_url, 
	host_name, 
	host_since, 
	host_location,
	host_about,
	host_response_time, 
	host_response_rate, 
	host_acceptance_rate, 
	host_is_superhost,
	host_thumbnail_url, 
	host_picture_url, 
	host_neighbourhood,
	host_listings_count,
	host_total_listings_count, 
	host_verifications, 
	host_has_profile_pic, 
	host_identity_verified,
	calculated_host_listings_count	
	from Listings
);

alter table Host
rename host_id to id;

alter table Host
rename host_url to url;

alter table Host
rename host_name to name;

alter table Host
rename host_since to since;

alter table Host
rename host_location to location;

alter table Host
rename host_about to about;

alter table Host
rename host_response_time to rensponse_time;

alter table Host
rename host_response_rate to rensponse_rate;

alter table Host
rename host_acceptance_rate to acceptance_rate;

alter table Host
rename host_is_superhost to is_superhost;

alter table Host
rename host_thumbnail_url to thumbnail_url;

alter table Host
rename host_picture_url to picture_url;

alter table Host
rename host_neighbourhood to neighbourhood;

alter table Host
rename host_listings_count to listings_count;

alter table Host
rename host_total_listings_count to total_listings_count;

alter table Host
rename host_verifications to verifications;

alter table Host
rename host_has_profile_pic to has_profile_pic;

alter table Host 
rename host_identity_verified to identity_verified;

alter table Host
rename calculated_host_listings_count to calculated_listings_count;

alter table Host
add primary key(id);

alter table Listings
drop host_url, 
drop host_name, 
drop host_since, 
drop host_location,
drop host_about,
drop host_response_time, 
drop host_response_rate, 
drop host_acceptance_rate, 
drop host_is_superhost,
drop host_thumbnail_url, 
drop host_picture_url, 
drop host_neighbourhood,
drop host_listings_count,
drop host_total_listings_count, 
drop host_verifications, 
drop host_has_profile_pic, 
drop host_identity_verified,
drop calculated_host_listings_count;

alter table Listings
add foreign key(host_id) references Host(id);

