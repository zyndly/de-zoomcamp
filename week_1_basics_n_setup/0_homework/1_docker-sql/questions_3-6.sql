/*
Question 3: Count records
How many taxi trips were totally made on January 15?

Choices are:
            20689
            20530
            17630
            21090

*/
SELECT count(1)
FROM green_tripdata_2019-01
WHERE lpep_pickup_datetime::date ='2019-01-15';


/*
Question 4: Largest trip for each day
Which was the day with the largest trip distance?

Choices are:
            2019-01-18
            2019-01-28
            2019-01-15
            2019-01-10
*/
SELECT lpep_pickup_datetime, max(trip_distance)
FROM green_tripdata_2019-01
group by lpep_pickup_datetime
order by 2 desc


/*
Question 5: The number of passengers
In 2019-01-01 how many trips had 2 and 3 passengers?

Choices are:
            2: 1282 ; 3: 266
            2: 1532 ; 3: 126
            2: 1282 ; 3: 254
            2: 1282 ; 3: 274
*/
SELECT passenger_count, count(1)
FROM green_tripdata_2019-01
WHERE date(lpep_pickup_datetime) = '2019-01-01'
group by passenger_count
order by 1


/*
Question 6: Largest tip
For the passengers picked up in the Astoria Zone which was the drop up zone that had the largest tip?

Choices are:
            Central Park
            Jamaica
            South Ozone Park
            Long Island City/Queens Plaza
*/

SELECT tip_amount, B."zone", C."zone"
FROM green_tripdata_2019-01  A
INNER JOIN zones  B on A."PULocationID" = B."LocationID"
INNER JOIN zones  C on A."DOLocationID" = C."LocationID"
WHERE B."zone" = 'Astoria'
order by 1 desc