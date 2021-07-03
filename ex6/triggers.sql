CREATE FUNCTION change_listing_count()
	RETURNS trigger AS
	$change_listing_count$
	BEGIN
		IF TG_OP = 'DELETE' THEN
			UPDATE Host 
			SET NEW.listings_count = listings_count - 1
			WHERE Host.id = Listing.host_id;
		ELSIF TG_OP = 'INSERT' THEN
			UPDATE Host 
			SET NEW.listing_count = listing_count + 1
			WHERE Host.id = Listing.host_id;
		END IF;
		RETURN NEW;
	END;
	$change_listing_count$
LANGUAGE 'plpgsql';

Create Trigger Trigger1
AFTER INSERT OR DELETE ON Listing
FOR EACH ROW EXECUTE PROCEDURE change_listing_count();

CREATE FUNCTION function2() 
	RETURNS TRIGGER AS 
	$function2$
	BEGIN	
		IF(Listing_Summary.minimum_nights = 5) THEN
			UPDATE LISTING 
			SET description = 'minimum nights you can stay are 5' 
			WHERE Listing_Summary.id = Listing.id;
		ELSIF(Listing_Summary.minimum_nights < 5) THEN
			UPDATE LISTING 
			SET description = 'minimum nights you can stay are less than 5' 
			WHERE Listing_Summary.id = Listing.id;
		END IF;
		RETURN NULL;
	END;
	$function2$ 
LANGUAGE plpgsql;

Create Trigger Trigger2
AFTER INSERT OR DELETE ON Listing_Summary
FOR EACH ROW EXECUTE PROCEDURE function2();