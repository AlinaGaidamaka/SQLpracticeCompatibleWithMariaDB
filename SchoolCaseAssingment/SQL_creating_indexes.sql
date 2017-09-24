----------------------- INDEX -----------------------------------------
--We don’t need indexes for Primary keys, they will be generated in SQL automaticly
CREATE INDEX ix_FK_enentId ON Booking(eventId);
CREATE INDEX ix_FK_roomNumber ON Event(roomNumber);