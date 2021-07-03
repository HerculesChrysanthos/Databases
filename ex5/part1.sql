Create Table Amenity AS (Select Distinct regexp_split_to_table(amenities,',') FROM Room);

Alter table Amenity rename regexp_split_to_table to amenity_name;

Alter table Amenity Alter column amenity_name type varchar using amenity_name::varchar;

Alter table Amenity add column amenity_id Serial PRIMARY KEY;

CREATE TABLE Room_Amenity_Connection AS
(SELECT temp.listing_id , amenity.amenity_id as amenity_id from amenity,
   (SELECT Room.listing_id as listing_id, unnest(amenities::text[]) as amenity_name from Room ) AS temp
  where temp.amenity_name = amenity.amenity_name);

Alter Table Room
Add Primary Key (listing_id);

Alter Table Room_Amenity_Connection
Add Foreign Key (listing_id) References Room(Listing_id),
Add Foreign Key (amenity_id) References Amenity(amenity_id);

Alter table Room drop column amenities;