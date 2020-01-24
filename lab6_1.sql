CREATE TABLE Book(
	BookID CHAR(3),
	BookName VARCHAR(60),
	BookPrice NUMBER(6,2),
	BookAmount NUMBER(3),
	CONSTRAINTS Book_pk PRIMARY KEY (BookID)
);

CREATE TABLE Borrow(
	BorrowID NUMBER(4),
	StdID CHAR(11),
	BookID CHAR(3),
	BorrowDate DATE,
	ReturnDate DATE,
	CONSTRAINTS Borrow_pk PRIMARY KEY (BorrowID),
	CONSTRAINTS Borrow_fk_Student FOREIGN KEY (StdID)
		REFERENCES student(StdID),
	CONSTRAINTS Borrow_fk_Book FOREIGN KEY (BookID)
		REFERENCES Book(BookID)
);

INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B01','คู่มือเรียนการวิเคราะห์ระบบ','250'	,'10');
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B02','คู่มือใช้งาน PowerPoint','200','5');
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B03','คู่มือใช้งาน Mac OS X','150','6');
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B04','Basic iOS App Development','233','5');
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B05','Professional ASP.NET Programming','200','4');
INSERT INTO Book(BookID,BookName,BookPrice,BookAmount) VALUES ('B06','เรียน Database อย่างไรให้ไร้ F','99','5');


INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('1','603020315-9','B01',TO_DATE('24/2/2015','DD/MM/YYYY'),TO_DATE('2/3/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('2','603020315-9','B02',TO_DATE('24/2/2015','DD/MM/YYYY'),TO_DATE('2/3/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('3','603020315-9','B03',TO_DATE('24/2/2015','DD/MM/YYYY'),TO_DATE('2/3/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('4','603020315-9','B04',TO_DATE('24/2/2015','DD/MM/YYYY'),TO_DATE('2/3/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('5','603020315-9','B05',TO_DATE('24/2/2015','DD/MM/YYYY'),TO_DATE('2/3/2015','DD/MM/YYYY'));

INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('6','603020290-9','B02',TO_DATE('12/2/2015','DD/MM/YYYY'),TO_DATE('20/2/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('7','603020290-9','B03',TO_DATE('12/2/2015','DD/MM/YYYY'),TO_DATE('20/2/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('8','603020290-9','B04',TO_DATE('12/2/2015','DD/MM/YYYY'),TO_DATE('20/2/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('9','603020290-9','B05',TO_DATE('12/2/2015','DD/MM/YYYY'),TO_DATE('20/2/2015','DD/MM/YYYY'));

INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('10','603021032-6','B03',TO_DATE('2/3/2015','DD/MM/YYYY'),TO_DATE('12/3/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('11','603021032-6','B04',TO_DATE('2/3/2015','DD/MM/YYYY'),TO_DATE('12/3/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('12','603021032-6','B05',TO_DATE('2/3/2015','DD/MM/YYYY'),TO_DATE('12/3/2015','DD/MM/YYYY'));

INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('13','603021712-4','B04',TO_DATE('28/2/2015','DD/MM/YYYY'),TO_DATE('2/3/2015','DD/MM/YYYY'));
INSERT INTO Borrow(BorrowID,StdID,BookID,BorrowDate,ReturnDate)VALUES('14','603021712-4','B05',TO_DATE('28/2/2015','DD/MM/YYYY'),TO_DATE('2/3/2015','DD/MM/YYYY'));

CREATE VIEW Lab6_BookPrice AS
SELECT BookID,BookName,BookAmount,BookPrice,(BookPrice*BookAmount) TotalPrice
FROM Book
GROUP BY BookID,BookName,BookAmount,BookPrice
ORDER BY BookID;

DROP VIEW Lab6_BorrowDetail;
CREATE VIEW Lab6_BorrowDetail AS
SELECT student.StdID,stdFName,stdLName,BookName,BorrowDate,ReturnDate
FROM Book,Student,Borrow
WHERE Book.BookID = Borrow.BookID
AND student.StdID = Borrow.StdID
ORDER BY student.StdID,BorrowDate;

DROP VIEW Lab6_StudentBorrow;
CREATE VIEW Lab6_StudentBorrow AS
SELECT student.StdID,stdFName,stdLName,COUNT(student.StdID) Amount
FROM Student,Borrow
WHERE Borrow.StdID = Student.StdID 
GROUP BY student.StdID,stdFName,stdLName
ORDER BY stdFName;

DROP VIEW Lab6_BOOKBORROW;
CREATE VIEW Lab6_BOOKBORROW AS
SELECT Book.BookID,BookName,COUNT(Book.BookID) Amount
FROM Book,Borrow
WHERE Borrow.BookID (+) = Book.BookID
GROUP BY Book.BookID,BookName
ORDER BY Book.BookID;
