-- MARIADB = MySQL script

------------------------ Create Table Category --------------------------------

CREATE TABLE IF NOT EXISTS Category
(
  id                INTEGER       NOT NULL    AUTO_INCREMENT,
  title             VARCHAR(255)  NOT NULL,
  budgetLimit       DECIMAL(19,4)         ,
  isActive          TINYINT(1)    NOT NULL,

	CONSTRAINT pk_category PRIMARY KEY(id),
	CONSTRAINT unique_Category_title UNIQUE KEY (title)
)ENGINE=InnoDB AUTO_INCREMENT=1;



-- --------------------- Create table Idea-------------------------------------

CREATE TABLE Idea
(
  id                  INTEGER       NOT NULL    AUTO_INCREMENT,
	title			          VARCHAR(200)	NOT NULL,
	description 	      TEXT        	NOT NULL,
	budget			        DECIMAL(19,4)         ,
	isReadyForComments  TINYINT(1)		NOT NULL,
	peopleNeeded	      INTEGER			          ,
	creationDate	      DATE			    NOT NULL,
	lastModified	      DATETIME		  NOT NULL,
	categoryId		      INTEGER			  NOT NULL,

	CONSTRAINT pk_Idea PRIMARY KEY (id),
	CONSTRAINT unique_Idea_title UNIQUE KEY (title),
	CONSTRAINT fk_Idea_Category FOREIGN KEY (categoryId) REFERENCES Category(id) ON DELETE NO ACTION,
	CONSTRAINT chk_Idea_peopleNeeded_between_1_and_10
				CHECK (peopleNeeded IS NULL
					OR
					(peopleNeeded IS NOT NULL AND (peopleNeeded >= 1 AND peopleNeeded <=10) ) )
)ENGINE=InnoDB AUTO_INCREMENT=1000;

ALTER TABLE Idea AUTO_INCREMENT = 1001;
----------------------Create table Members-------------------------------------
CREATE TABLE Member
(
id          INTEGER			  NOT NULL    AUTO_INCREMENT,
userName    VARCHAR(100)  NOT NULL,
email       VARCHAR(100)          ,

CONSTRAINT pk_Member PRIMARY KEY (id),
CONSTRAINT unique_Member_userName UNIQUE KEY (userName),
CONSTRAINT unique_Member_emailAddress UNIQUE KEY (email)
)ENGINE=InnoDB AUTO_INCREMENT=100;

ALTER TABLE Member AUTO_INCREMENT = 101;

----------------------Craete table MemberIdea----------------------------------

CREATE TABLE MemberIdea
(
  memberId      INTEGER     NOT NULL,
  ideaId        INTEGER     NOT NULL,

  CONSTRAINT pk_MemberIdea PRIMARY KEY (memberId, ideaId),
  CONSTRAINT fk_MemberIdea_Member FOREIGN KEY (memberId) REFERENCES Member(id),
  CONSTRAINT fk_MemberIdea_Idea FOREIGN KEY (ideaId) REFERENCES Idea(id)
);

--------------------Create table Comments--------------------------------------
CREATE TABLE Comment
(
  memberId          INTEGER       NOT NULL,
  ideaId            INTEGER       NOT NULL,
  commentTimeStamp  DATETIME      NOT NULL,
  commentLine       VARCHAR(200)  NOT NULL,

CONSTRAINT pk_Comment PRIMARY KEY (memberId, ideaId, commentTimeStamp),
CONSTRAINT unique_Comment_commentLinePerSameMemberAndIdea UNIQUE KEY (memberId, ideaId, commentLine),
CONSTRAINT fk_Comment_Member FOREIGN KEY (memberId) REFERENCES Member(id),
CONSTRAINT fk_Comment_Idea FOREIGN KEY (ideaId) REFERENCES Idea(id) ON DELETE CASCADE
);
