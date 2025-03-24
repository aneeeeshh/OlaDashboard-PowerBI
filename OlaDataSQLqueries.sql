create database OLA;
use ola;

select * from OlaData;

-- Retrieve all successful bookings:
create view Successfull_Booking as
select * from OlaData where Booking_Status = 'Success';

-- Find the average ride distance for each vehicle type:
Create View avg_ride_distance as
select Vehicle_Type, AVG(Ride_Distance) as avg_distance from OlaData group by Vehicle_Type;

--  Get the total number of cancelled rides by customers:
create View Rides_Cancelled_By_Customer as
select count(*) as Canceled_By_Customer from OlaData where Booking_Status = 'Canceled by Customer';

-- List the top 5 customers who booked the highest number of rides:
Create view top5customers as
select Customer_ID, count(Booking_ID) as total_rides 
from OlaData 
group by Customer_ID
order by total_rides desc limit 5;

-- Get the number of rides cancelled by drivers due to personal and car-related issues:
drop view if exists personal_and_car_related_issues;
Create View personal_and_car_related_issues as
select count(*) as personal_and_car_related_issues from OlaData where Canceled_Rides_by_Driver = 'Personal & Car related issue';

--  Find the maximum and minimum driver ratings for Prime Sedan bookings:
create VIEW max_min_ratings as 
select MAX(Driver_Ratings) as max_ratings, 
MIN(Driver_Ratings) as min_ratings 
from OlaData 
where Vehicle_Type = 'Prime Sedan';

-- Retrieve all rides where payment was made using UPI:
create view upi as
select * from OlaData where Payment_Method = 'UPI';

-- Find the average customer rating per vehicle type:
create view avg_customer_rating as
Select Vehicle_Type, round(AVG(Customer_Rating),2) as avg_Ratings
from OlaData
group by Vehicle_Type;

-- Calculate the total booking value of rides completed successfully:
create view total_Booking_Value as
Select SUM(Booking_Value) as total_Booking_Value from OlaData where Booking_Status = 'Success';

-- List all incomplete rides along with the reason:
Create View incomplete_rides as
Select Booking_ID, Incomplete_Rides_Reason 
from OlaData 
where Incomplete_Rides = 'Yes'

