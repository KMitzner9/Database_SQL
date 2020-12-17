
CREATE DATABASE db_Library_Management;

USE db_Library_Management;

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(30),
	[Address] VARCHAR(100));

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(30),
	[Address] VARCHAR(100),
	Phone VARCHAR(20));

DROP TABLE PUBLISHER;
SELECT * FROM PUBLISHER;

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(20) PRIMARY KEY NOT NULL,
	[Address] VARCHAR(100),
	Phone VARCHAR(20));

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(10,1),
	Title VARCHAR(50),
	PublisherName VARCHAR(20));

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_Author_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(20));

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_Loan_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Loan_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_Loan_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(20),
	DateDue VARCHAR(20));

INSERT INTO LIBRARY_BRANCH (BranchName, [Address])
	VALUES
	('Sharpstown', '987 Sharp Street'),
	('Kenton', '8226 N Denver Avenue'),
	('Albina', '216 NE Knott Street'),
	('North Portland', '512 N Killingsworth Street'),
	('Hollywood', '4040 NE Tillamook Street'),
	('Belmont', '1038 SE César E. Chávez Boulevard');

SELECT * FROM LIBRARY_BRANCH;

INSERT INTO BORROWER (CardNo, [Name], [Address], Phone)
	VALUES
	(32482, 'Elvira Jones', '3092 Hill Avenue', '719-909-2439'),
	(48593, 'Annie Oakley', '32 High West Road', '102-933-2833'),
	(23098, 'Dennis Rodman', '69 Ballin Court', '210-232-3490'),
	(98122, 'Holt Whitman', '109 Peachtree Circle', '770-998-7160'),
	(12093, 'Donald Duck', '2910 McScrooge Boulevard', '902-928-1231'),
	(09238, 'Arnold Palmer', '903 Ant Hill Drive', '547-9282-2489'),
	(09123, 'Lucille Ball', '8292 Elm Lane', '238-894-7835'),
	(83892, 'Alexandra Austin', '23993 Forest Hill Drive', '209-828-3661');

SELECT * FROM BORROWER;

INSERT INTO PUBLISHER (PublisherName, [Address], Phone)
	VALUES
	('Allyn & Bacon', '293 Faraway Lane', '800-922-0579'),
	('Bantam', '39013 Reading Way', '800-371-1669'),
	('Crossroad Publishing', '66 Turing Drive', '800-462-6420'),
	('Double Day', '29009 Flushing Avenue', '800-726-0600'),
	('Greenwood Press', '987 Detroit Street', '800-225-5800'),
	('Knopf', '8238 Freedom Lane', '800-726-0600'),
	('Modern Library', '290 Brookfield Club Drive', '800-726-0600'),
	('Newnes', '64 Lansing Court', '800-545-2522'),
	('Pantheon', '8732 Hollow Tree Drive', '800-726-0600'),
	('Warner Books', '874 Tech Circle', '800-759-0190');

INSERT INTO BOOKS (Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Pantheon'),
	('Dune', 'Ace Books'),
	('One Flew Over the Cuckoos Nest', 'Signet'),
	('Fahrenheit 541', 'Ballantine Books'),
	('The Hitchhiker''s Guide to the Galaxy', 'Pantheon'),
	('Daring Greatly', 'Penguin'),
	('Me and White Supremacy', 'Sourcebooks'),
	('It''s Not Your Money', 'Hay House'),
	('Food of the Gods', 'Bantam'),
	('Wild Ducks Flying Backwards', 'Bantam'),
	('Jitterbug Perfume', 'Bantam'),
	('The Count of Cape Hatteras', 'Studio East Press'),
	('Tongue Tied', 'Cleis Press'),
	('You are a Badass', 'Running Press'),
	('Milk and Honey', 'Andrews McMeel'),
	('Come As You Are', 'Simon & Schuster'),
	('Playing Well With Others', 'Greenery Press'),
	('Sophie''s World', 'Double Day'),
	('Modern Man in Search of a Soul', 'Knopf'),
	('Mastery', 'Plume'),
	('Think and Grow Rich', 'Penguin');

SELECT * FROM BOOKS;
SELECT * FROM LIBRARY_BRANCH;

INSERT INTO BOOK_AUTHORS (BookID, AuthorName)
	VALUES
	(33, 'Tom Robbins'),
	(32, 'Tom Robbins'),
	(34, 'Bruce Wilkins'),
	(43, 'Napoleon Hill'),
	(27, 'Douglas Adams'),
	(31, 'Terrence McKenna'),
	(24, 'Frank Herbert'),
	(30, 'Tosha Silver'),
	(42, 'George Leonard'),
	(36, 'Jen Cincero');

INSERT INTO BOOK_COPIES (BookID, BranchID, Number_Of_Copies)
	VALUES
	(25, 4, 4),
	(33, 6, 2),
	(25, 1, 3),
	(40, 2, 2),
	(40, 3, 2),
	(29, 3, 3),
	(31, 5, 2),
	(35, 2, 2),
	(38, 6, 2),
	(24, 1, 4);

SELECT * FROM BOOKS;
SELECT * FROM LIBRARY_BRANCH;
SELECT * FROM BORROWER;
SELECT * FROM BOOK_LOANS;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BOOK_COPIES;

SELECT * FROM BOOK_LOANS
FULL OUTER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo
FULL OUTER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID;

SELECT BOOKS.TITLE, BOOK_AUTHORS.AuthorName
FROM BOOKS
INNER JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.BookID;

SELECT Number_Of_Copies FROM BOOK_COPIES
WHERE BookID = 44;
