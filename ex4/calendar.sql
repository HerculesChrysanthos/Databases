Update Calendar
Set price = replace(price,'$','');

Update Calendar
Set price = replace(price,',','');

Alter table Calendar
Alter price type numeric Using price::numeric;


Update Calendar
Set adjusted_price = replace(adjusted_price,'$','');

Update Calendar
Set adjusted_price = replace(adjusted_price,',','');

Alter table Calendar
Alter adjusted_price type numeric Using adjusted_price::numeric;