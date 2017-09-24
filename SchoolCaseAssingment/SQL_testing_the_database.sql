-------------------------------------------------------------------
------------------  Testing requirements  -------------------------
-------------------------------------------------------------------

------------------------------ 1 ----------------------------------
-- Booking a ticket
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN TRANSACTION; 
	INSERT INTO Booking
		(eventId, bookingDate, customersPNumber, numberOfTickets, bookingStatus)
	values
		(2, '12-12-16','0507273421', 1, 'booked');
COMMIT;


------------------------------ 2 ----------------------------------
-- Canceling a ticket booking
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN TRANSACTION; 
	DELETE FROM Booking
		WHERE customersPNumber = '0507273421'
		-- If needed we can also specify bookingDate, bookingStatus, and numberOfTickets if customer
		-- has brought multiple tickets on same day

COMMIT;


------------------------------ 3 ----------------------------------
-- Changing the number of tickets in booking
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN TRANSACTION; 
	UPDATE Booking
		SET numberOfTickets = 12
			WHERE customersPNumber = '0508687534'
COMMIT;


------------------------------ 4 ----------------------------------
-- Changing the status of booking to sold when tickets are purchased (the booking is payed for) 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN TRANSACTION; 
	UPDATE Booking
	SET bookingStatus = 'sold'
		WHERE customersPNumber = '0509983453' AND bookingDate = '12-12-16'
COMMIT;


------------------------------ 5 ----------------------------------
-- Removing the unpurchased bookings from the database after three days from booking 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN TRANSACTION; 
	DELETE FROM Booking
		WHERE bookingDate < dateadd(day, -3,getdate()) AND bookingStatus = 'booked';
COMMIT;

/*For testing
SELECT * FROM Booking
DELETE FROM Booking
*/

------------------------------ 6 ---------------------------------- 
-- !! We were unable to get this query to work !!
-- Removing the unpurchased bookings of the past events from the database
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN TRANSACTION; 
	DELETE FROM Booking
		WHERE bookingDate < (SELECT eventDate FROM Event)
COMMIT;


------------------------------ 7 ----------------------------------
-- Cancelling an event (in extreme exceptional cases) 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN TRANSACTION; 
	UPDATE Event
	SET eventStatus = 'Cancelled'
		WHERE eventName = 'Tuesday Jam' AND eventDate = '02-13-17'
COMMIT;


------------------------------ 8 ----------------------------------
-- Refunding a client in case of a cancelled event.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN TRANSACTION; 
	UPDATE Booking
	SET bookingStatus = 'refunded'
		WHERE customersPNumber = '0504453958' AND bookingDate = '11-22-16'
COMMIT;




------------------------ Examples of the queries (user transactions) ---------------------------

------------------------------------------- 1 --------------------------------------------------
-- QUESTION: What events are coming up next month? 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT eventId, eventName FROM Event
WHERE DATEPART(mm,eventDate)='01' AND DATEPART(yyyy,eventDate)='2017';

COMMIT;

------------------------------------------- 2 --------------------------------------------------
-- QUESTION: What theatre performances are coming up this month?
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT eventId, eventName FROM Event
WHERE DATEPART(mm,eventDate)='12' AND DATEPART(yyyy,eventDate)='2016';

COMMIT;


------------------------------------------- 3 --------------------------------------------------
-- QUESTION:  What is Steve Harrisons phonenumber?
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT contactFirstName, contactLastName, phone FROM Artists 
	WHERE contactFirstName = 'Steve' AND contactLastName = 'Harrison';

COMMIT;

------------------------------------------- 4 --------------------------------------------------
-- QUESTION: When will ZZ Top perform in XXX and what are their special requests for catering
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT artistsName, requestCatering, Event.eventDate, roomNumber FROM Artists
		FULL OUTER JOIN ArtistsEvent ON (ArtistsEvent.artistId = Artists.artistId)
		FULL OUTER JOIN Event ON (Event.eventid = ArtistsEvent.eventId)
			WHERE artistsName = 'ZZ top';
COMMIT;

------------------------------------------- 5 --------------------------------------------------
-- QUESTION: How many tickets have been sold to Rock and Pop which will take place in 02.01.2017
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT SUM(numberOfTickets) AS 'Number of Sold Tickects'
FROM Booking 
WHERE eventId = '1' AND bookingStatus = 'sold'
GROUP BY eventide;

COMMIT;

------------------------------------------- 6 --------------------------------------------------
-- QUESTION: How many tickets are left to Tuesday Jam on 02.13.2017?
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT eventName, numberOfSeats - SUM(numberOfTickets) AS "Number of tickets left" FROM Booking 
	FULL OUTER JOIN Event ON (Event.eventId = Booking.eventId)
	FULL OUTER JOIN Room ON (Event.roomNumber = Room.roomNumber)
		WHERE eventName = 'Tuesday Jam'
			GROUP BY Room.numberOfSeats, eventName;
COMMIT;
			


------------------------------------------- 7 --------------------------------------------------
-- QUESTION: How much money has the Kuru Culture Club got from sold tickets this year?
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT SUM(numberOfTickets * price) AS "Money from sold tickets in 2016 in €" FROM Booking
	FULL OUTER JOIN Event ON (Event.eventId = Booking.eventId)
		WHERE bookingStatus = 'sold' AND bookingDate >= '01.01.16' AND bookingDate < '01.01.17' ;

COMMIT;



---------------------------------------- Other Tests ----------------------------------------------

-- To check how many tickets have been sold from the maximum
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT Event.eventId, eventName, sum(numberOfTickets) AS "Tickets sold", numberOfSeats FROM Booking 
	FULL OUTER JOIN Event ON (Event.eventId = Booking.eventId)
	FULL OUTER JOIN Room ON (Event.roomNumber = Room.roomNumber)
		GROUP BY Room.numberOfSeats, Event.eventId, eventName
			ORDER BY Event.eventId;
COMMIT;


-- How much money has each event made from sold tickets
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

SELECT Event.eventId, eventName, SUM(numberOfTickets * price) AS "Money from sold tickets in€" FROM Booking
	FULL OUTER JOIN Event ON (Event.eventId = Booking.eventId)
		WHERE bookingStatus = 'sold'
			GROUP BY Event.eventId, eventName
				ORDER BY Event.eventId;
COMMIT;
