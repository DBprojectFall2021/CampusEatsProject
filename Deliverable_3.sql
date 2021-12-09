select * from restaurant;
select min(rat.food_rating),max(rat.food_rating),avg(rat.food_rating)
from restaurant r 
inner join campus_eats_fall2020.order o  on r.restaurant_id =o.restaurant_id
inner join rating rat on rat.order_id= o.order_id
where r.restaurant_id=5;

select count(o.order_id)  from restaurant r 
inner join campus_eats_fall2020.order o  on r.restaurant_id =o.restaurant_id
inner join rating rat on rat.order_id= o.order_id
inner join person p on p.person_id = o.person_id
inner join delivery d on d.delivery_id = o.delivery_id
where p.person_id=1 and date(d.delivery_time) between '2020-02-15' and '2020-07-19';

select o.total_price  from restaurant r 
inner join campus_eats_fall2020.order o  on r.restaurant_id =o.restaurant_id
inner join rating rat on rat.order_id= o.order_id
inner join person p on p.person_id = o.person_id
inner join delivery d on d.delivery_id = o.delivery_id
where p.person_id=1 and date(d.delivery_time) between '2020-02-15' and '2020-07-19';

select rat.food_rating  from  campus_eats_fall2020.order o  
inner join rating rat on rat.order_id= o.order_id
where o.restaurant_id=5 ;

create view ratings_view as 
select rat.food_rating,o.restaurant_id  from  campus_eats_fall2020.order o  
inner join rating rat on rat.order_id= o.order_id
group by o.restaurant_id ;

DROP PROCEDURE IF EXISTS del_rating;
DELIMITER //
CREATE PROCEDURE del_rating(IN rating_id_input INT)
BEGIN
DELETE FROM rating
where rating_id = rating_id_input;
end//
DELIMITER ;

CALL del_rating(1); 

DROP PROCEDURE IF EXISTS del_driver;
DELIMITER //
CREATE PROCEDURE del_driver(IN driver_id_input INT)
BEGIN
DELETE FROM driver
where driver_id = driver_id_input;
end//
DELIMITER ;

-- CALL del_driver(1); // This is to call the stored procedure to delete this particular row