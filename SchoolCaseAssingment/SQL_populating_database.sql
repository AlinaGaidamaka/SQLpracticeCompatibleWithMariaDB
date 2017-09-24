-------------------------------------------------------------------
------------------  INSERTING DATA QUERY  -------------------------
-------------------------------------------------------------------


-------------------------- 1(Room) --------------------------
INSERT INTO Room
	(roomNumber, numberOfSeats)
values
	(1, 50),
	(2, 500);


-------------------------- 2(Artists) -------------------------- 
INSERT INTO Artists
	(artistsName, contactFirstName, contactLastName, phone, email, requestCatering, requestDrinks)
values
	('ZZ Top', 'Steve', 'Harrison', '0405436572', 'steve.harrison@email.com', '', 'Beer'),
	('Iron Maiden', 'James', 'Brown', '0407526449', 'james.brown@email.com', 'Hamburgers', 'Wine'),
	('Led Zeppelin', 'John', 'Snow', '0402238921', 'john.snow@email.com', '', ''),
	('Rolling Stones', 'William', 'Oneal', '0406125348', 'william.oneal@email.com', 'Sushi', 'Soda'),
	('Freddie Mercury', 'Freddie', 'Mercury', '0408851924', 'freddie.mercury@email.com', '', 'Beer');




-------------------------- 3(Event) --------------------------
INSERT INTO Event
	(eventName, roomNumber, eventDate, price, eventStatus)
values
-- Edit values
	('Rock and Pop', 2, '01-02-17', 30, 'upcoming'),
	('Tuesday Jam', 1, '02-13-17', 25, 'upcoming'),
	('Kings of Rock', 2, '06-02-15', 30, 'held'),
	('Helsinkistock', 2, '04-05-16', 30, 'Cancelled'),
	('HKI Festival', 1, '07-13-16', 30, 'held');


-------------------------- 4(ArtistsEvent) --------------------------
INSERT INTO ArtistsEvent
	(artistId, eventId)
values
	(1, 1),
	(5, 1),
	(2, 2),
	(3, 3),
	(4, 3),
	(2, 3),
	(2, 4),
	(1, 4),
	(3, 4),
	(4, 5),
	(5, 5);
	
-------------------------- 5(Booking) --------------------------
INSERT INTO Booking
	(eventId, bookingDate, customersPNumber, numberOfTickets, bookingStatus)
values
	(1, '11-23-16','0508687534', 10, 'booked'),
	(1, '11-12-16','0508462364', 5, 'sold'),
	(1, '12-12-16','0509983453', 6, 'booked'),
	(2, '12-25-16','0508347531', 9, 'sold'),
	(2, '11-26-16','0509457332', 2, 'sold'),
	(2, '11-22-16','0504453958', 5, 'booked'),
	(3, '05-12-15','0500432401', 3, 'sold'),
	(3, '03-24-15','0504324320', 4, 'sold'),
	(3, '06-01-15','0509865353', 10, 'sold'),
	(3, '05-22-15','0507658234', 11, 'sold'),
	(4, '02-02-16','0508865112', 12, 'refunded'),
	(4, '04-01-16','0502213002', 2, 'refunded'),
	(5, '05-27-16','0505524332', 6, 'sold'),
	(5, '06-01-16','0509009123', 4, 'cancelled'),
	(5, '07-11-16','0502353212', 3, 'sold');

/*	To make sure the booking is done before event, I added this here as a reminder

	1- ('Rock and Pop', 2, '01-02-17', 30, 'upcoming'),
	2- ('Tuesday Jam', 1, '02-13-17', 25, 'upcoming'),
	3- ('Kings of Rock', 2, '06-02-15', 30, 'held'),
	4- ('Helsinkistock', 2, '04-05-16', 30, 'Cancelled'),
	5- ('HKI Festival', 1, '07-13-16', 30, 'held');

	Number of people per event and max amount of people per room:
	Event 1:
		People : 21
		Room : 2 (Max : 500)

	Event 2:
		People : 16
		Room : 1 (Max : 50)

	Event 3:
		People : 28
		Room : 2 (Max : 500)

	Event 4:
		People : 14
		Room : 2 (Max : 500)

	Event 5:
		People : 13
		Room: 1 (Max : 50)

	PS. Date format is MM-DD-YY
*/
