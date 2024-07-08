CREATE DATABASE Hotel_Reservation;
USE  Hotel_Reservation; 

CREATE TABLE Hotel (
Booking_ID	VARCHAR (50)  PRIMARY KEY ,
  no_of_adults	INT , 
  no_of_children INT , 
  no_of_weekend_nights INT, 
  no_of_week_nights	INT, 
  type_of_meal_plan VARCHAR (50) ,
  room_type_reserved 	VARCHAR (50) ,
  lead_time	 INT , 
  arrival_date DATE ,
  market_segment_type VARCHAR(50) ,
  avg_price_per_room DECIMAL(10, 2) , 
  booking_status VARCHAR(50)
  );
  
  SELECT * FROM Hotel;
  
 
 
 -- 1. What is the total number of reservations in the dataset?
 SELECT COUNT(*) AS total_reservations
FROM Hotel;



 -- 2. Which meal plan is the most popular among guests?

  SELECT 
    type_of_meal_plan, COUNT(*) AS count
FROM
    Hotel
GROUP BY type_of_meal_plan
ORDER BY count DESC
LIMIT 1;

  
  
  -- 3. What is the average price per room for reservations involving children? 
  
SELECT AVG(avg_price_per_room) AS average_price_per_room
FROM Hotel
WHERE no_of_children > 0;



-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?

SELECT 
    COUNT(*) AS 2018_Reservation
FROM
    Hotel
WHERE
    YEAR(arrival_date) = 2018;


 -- 5. What is the most commonly booked room type? 
 
SELECT 
    room_type_reserved, COUNT(*) AS count
FROM
    Hotel
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;



-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?

SELECT COUNT(*) AS WEEKEND_RESERVATION 
FROM HOTEL WHERE no_of_weekend_nights > 0 ;



-- 7. What is the highest and lowest lead time for reservations?

SELECT 
    MAX(lead_time) AS highest_lead_time, 
    MIN(lead_time) AS lowest_lead_time
FROM Hotel;



-- 8. What is the most common market segment type for reservations?

SELECT market_segment_type, COUNT(*) AS count
FROM Hotel
GROUP BY market_segment_type
ORDER BY count DESC
LIMIT 1;




-- 9. How many reservations have a booking status of "Confirmed"?

SELECT COUNT(*) AS confirmed_reservations
FROM Hotel
WHERE booking_status = 'Confirmed';




-- 10. What is the total number of adults and children across all reservations?

SELECT SUM(no_of_adults + no_of_children) AS total_peoples
FROM Hotel;



-- 11. What is the average number of weekend nights for reservations involving children?

SELECT AVG(no_of_weekend_nights) AS AVG_WEEKEND_NIGHT 
FROM HOTEL WHERE no_of_children > 0 ;



-- 12. How many reservations were made in each month of the year?

SELECT MONTH(arrival_date) AS month_no ,
       MONTHNAME(arrival_date) AS arrival_month,
       COUNT(*) AS reservation_per_month
FROM Hotel
WHERE YEAR(arrival_date) = 2018
GROUP BY MONTH(arrival_date), MONTHNAME(arrival_date)
ORDER BY MONTH(arrival_date);




-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?

SELECT room_type_reserved,
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_nights_spent
FROM Hotel
GROUP BY room_type_reserved;




-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?

SELECT  
    room_type_reserved, AVG(avg_price_per_room) AS average_price, COUNT(*) AS count
FROM Hotel WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;




-- 15. Find the market segment type that generates the highest average price per room.

SELECT 
    market_segment_type,
    AVG(avg_price_per_room) AS average_price
FROM
    HOTEL
GROUP BY market_segment_type
ORDER BY average_price DESC
LIMIT 1; 



--   Some other Analysis are as follows :- 

-- . What is the average length of stay (in days) for reservations? 

SELECT AVG(no_of_weekend_nights + no_of_week_nights) AS average_length_of_stay
FROM Hotel;


--  How many reservations are made by market segment type each year? 

SELECT YEAR(arrival_date) AS year, market_segment_type, COUNT(*) AS reservation_count
FROM Hotel
GROUP BY YEAR(arrival_date), market_segment_type
ORDER BY year, market_segment_type;

--  What is the average price per room by month for the each year?

SELECT 
    MONTH(arrival_date) AS month_no,
    MONTHNAME(arrival_date) AS month,
    YEAR(arrival_date),
    AVG(avg_price_per_room) AS average_price
FROM
    Hotel
GROUP BY MONTHNAME(arrival_date) , YEAR(arrival_date) , MONTH(arrival_date)
ORDER BY MONTH(arrival_date);



--  What is the bookig IDs of top 10 expensive room ?

SELECT 
    Booking_ID, avg_price_per_room
FROM
    Hotel
ORDER BY avg_price_per_room DESC
LIMIT 10;

--  What is the total revenue generated per market segment? 

SELECT market_segment_type, SUM(avg_price_per_room) AS total_revenue
FROM Hotel
GROUP BY market_segment_type
ORDER BY total_revenue DESC;








