-------------------------------------------------------------------
------------------  CREATING TABLES QUERY  ------------------------
-------------------------------------------------------------------
-- The tables need to be created in this specific order : Room -> Artists -> Event ->ArtistsEvent -> Booking -> Indexes

------------------------------ 1(Room) ---------------------------------------- 
CREATE TABLE Room (
roomNumber INTEGER NOT NULL,
numberOfSeats INTEGER NOT NULL,
CONSTRAINT PK_Room PRIMARY KEY (roomNumber)
);

------------------------------- 2(Artists) --------------------------------------- 
CREATE TABLE Artists (
artistId INTEGER NOT NULL IDENTITY(1,1),
artistsName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL,
requestCatering VARCHAR(500),
requestDrinks VARCHAR(500), 
CONSTRAINT PK_Artists PRIMARY KEY (artistId)
);

--------------------------------- 3(Event) -------------------------------------- 
CREATE TABLE Event (
eventId INTEGER NOT NULL IDENTITY(1,1),
eventName VARCHAR(50) NOT NULL,
roomNumber INTEGER NOT NULL,
eventDate DATE NOT NULL,
price INTEGER NOT NULL,
eventStatus VARCHAR(15) NOT NULL,
CONSTRAINT PK_Event PRIMARY KEY (eventId),
CONSTRAINT FK_Event_Room FOREIGN KEY (roomNumber) REFERENCES Room(roomNumber),
CONSTRAINT CHK_Event_ 
	CHECK(eventStatus = 'Cancelled' 
	OR eventStatus = 'upcoming' 
	OR eventStatus = 'held')
);

---------------------------------- 4(ArtistsEvent) -------------------------------------
CREATE TABLE ArtistsEvent (
artistId INTEGER NOT NULL,
eventId INTEGER NOT NULL,
CONSTRAINT PK_ArtistsEvent PRIMARY KEY (artistId, eventId),
CONSTRAINT FK_ArtistsEvent_Artists FOREIGN KEY (artistId) REFERENCES Artists(artistId),
CONSTRAINT FK_ArtistsEvent_Event FOREIGN KEY (eventId) REFERENCES Event(eventId)
);


---------------------------------- 5(Booking) ------------------------------------- 
CREATE TABLE Booking (                                    
bookingNumber INTEGER NOT NULL IDENTITY(1,1),
eventId INTEGER NOT NULL,
bookingDate DATE NOT NULL,
customersPNumber VARCHAR(20),
numberOfTickets INTEGER,
bookingStatus VARCHAR(10), 
CONSTRAINT PK_Booking PRIMARY KEY (bookingNumber),
CONSTRAINT FK_Booking_Event FOREIGN KEY (eventId) REFERENCES Event(eventId),
CONSTRAINT CHK_Booking_bookingStatus 
CHECK(bookingStatus = 'booked' 
OR bookingStatus = 'sold' 
OR bookingStatus =  'cancelled' 
OR bookingStatus = 'refunded')
);


 

 ----------------------- Drop Tables -----------------------------------------
 -- Need to be dropped in this specific order
 DROP TABLE Booking;
 DROP TABLE ArtistsEvent;
 DROP TABLE Artists;
 DROP TABLE EVENT;
 DROP TABLE Room;

