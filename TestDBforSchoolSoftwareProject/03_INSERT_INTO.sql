
----------------------------------Insert into Memeber---------------------------
INSERT INTO Member (userName,email)
VALUES
("Alina","alina.mail@gmail.com"), --101
("Leo","leo.mail@gmail.com"), --102
("Tiina","tiina.mail@gmail.com"), --103
("Isabel","isabel.mail@gmail.com"), --104
("Vadim","vadim.mail@gmail.com"), --105
("Tuomo","tuomo.mail@gmail.com"), --106
("Kimmo","kimmo.mail@gmail.com"), --107
("Gaing","giang.mail@gmail.com"), --108
("Carol","carol.mail@gmail.com"), --109
("Kati","kati.mail@gmail.com"), --110
("Mari","Mari.mail@gmail.com"), --111
("Olga","olga.mail@gmail.com"); --112
---------------------FOR NOW 12 MEMBERS with ID 101 - 112 ---------------------


--------------------------------Insert into Category---------------------------

INSERT INTO Category (title,budgetLimit,isActive)
VALUES
('Hardware upgrade', 5000.00, 1), --1
('Outsourcing', 200.50, 1), --2
('Training', 2000.00, 0), --3
('Team building', 10000.00,1), --4
('Software upgrade', 225000.00, 1), --5
('Business trips', 2356.90, 1); --6
----------------------------FOR NOW 6 CATEGORIES with ID 1-6 ------------------


----Insert into Idea with isReadyForComments with peopleNeeded and bugdet ------
INSERT INTO Idea (title, description, budget, isReadyForComments, peopleNeeded, creationDate, lastModified, categoryId)
VALUES
('New laptop','5 year old laptop upgreate', 2507.00, 1, 2, '2017-08-01', '2017-09-04 13:08:22',1), --1001
('Summer build', 'Greate summer team building', 250.00, 1, 10, '2017-07-21', '2017-08-03 14:08:22', 4), --1002
('Team management', 'Ideas for new team management software', 4500.00, 1, 2, '2017-05-21', '2017-06-01 15:17:56', 5), --1003
('Help with O365', 'Do we need a colsultation for O356 settings', 4356,00, 1, 3, '2017-03-03', '2017-04-25 12:45:52', 2), --1004
('Sales trips','We are organizing trips for sale purposes', 23866.00, 1, 5, '2017-02-03', '2017-03-25 12:46:03', 1), --1005
('Winter build','Start the winter teambuilting already in Summer', 1680.00, 0, 10, '2017-06-26', '2017-06-26 17:08:22', 4 ); --1006

----Insert into Idea without bugdet and peopleNeeded --------------------------
INSERT INTO Idea (title, description, isReadyForComments, creationDate, lastModified, categoryId)
VALUES
('SSD', 'Need to change all HDD to SSD', 0, '2017-09-04', '2017-09-04 16:08:22',1), --1007
('Training for teams', 'Do we need any training for project management?', 1, '2017-09-04', '2017-09-04 12:08:22',3), --1008
('Trainings', 'Tryout new frameworks', 0, '2017-08-05', '2017-09-06 17:08:22',3); --1009
----------------------FOR NOW 9 IDEAS with ID 1001- 1009 ----------------------


-------------Insert into MemberIdea--------------------------------------------
INSERT INTO MemberIdea (memberId,ideaId)
VALUES
(101,1001),
(102,1002),
(105,1003),
(105,1004),
(106,1005),
(107,1006),
(108,1007),
(104,1008),
(105,1009),
(101,1009),
(103,1009);
-----------------------FOR NOW EACH IdEA has MEMBER(S)--------------------------

----idea 1006, 1007,1009 isNOTreasdyForComments

INSERT INTO Comment (memberId,ideaId,commentTimeStamp,commentLine)
VALUES
-------------------Idea 1001---------------------------
(101,1001,'2017-08-02 13:07:34','ha-ha'),
(103,1001,'2017-08-03 14:05:34','bu-bu'),
(112,1001,'2017-08-04 15:06:34','no-no'),
(108,1001,'2017-09-04 13:08:22','lo-lo'),
-------------------Idea 1002----------------------------
(104,1002,'2017-07-22 15:07:44','ga-ga'),
(107,1002,'2017-07-23 15:08:44','be-be'),
(108,1002,'2017-07-24 15:10:44','de-de'),
(109,1002,'2017-08-03 14:08:22','po-po'),
------------------Idea 1003 ----------------------------
(103,1003,'2017-05-21 14:37:44','la-ga'),
(105,1003,'2017-05-21 17:27:44','fa-ga'),
(106,1003,'2017-06-01 15:17:56','da-ga'),

------------------Idea 1004 ------------------------------
(102,1004,'2017-03-03 16:08:44','sa-ga'),
(111,1004,'2017-03-03 16:08:44','ea-ga'),
(111,1004,'2017-04-25 12:45:52','ka-ga'),

-------------------Idea 1005 -----------------------------
(105,1005,'2017-03-25 12:46:03','fu-ga'),

-----------------Idea 1008-------------------------------
(107,1008,'2017-09-04 12:08:22','fu-ga');
