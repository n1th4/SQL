
CREATE VIEW  LAB6_BOOKBORROW AS
SELECT Book.BookID,BookName,Amount
FROM Book,(SELECT bookID ,COUNT(BorrowID)Amount
				FROM Borrow
				GROUP BY BookID)a_amount
WHERE a_amount.BookID = Book.BookID(+)
ORDER BY Book.BookID;

CREATE VIEW LAB6_StudentBorrow AS
SELECT Student.stdid,stdfname,stdlname,Amount
FROM Student,(SELECT stdid ,COUNT(BorrowID)Amount
				FROM Borrow
				GROUP BY stdid)a_amount
WHERE a_amount.stdid = Student.stdid
ORDER BY Student.stdid;				

CREATE VIEW LAB6_BorrowDetail AS
SELECT Student.stdid,stdfname,stdlname,BookName,BorrowDate,ReturnDate
FROM  Student,Borrow,Book
WHERE Student.stdid =  Borrow.stdid
	AND Book.BookID = Borrow.BookID
ORDER BY stdid,BorrowDate;

CREATE VIEW LAB6_BookPrice AS
SELECT BookID,BookName,BookAmount,BookPrice,(BookPrice*BookAmount)TotalPrice
FROM Book;
//ถ้ามไม่ใช้func คำนวน ไม่ต้อง group by

INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('13','603020290-9','B04',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('14','603020290-9','B05',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));

INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('10','603021712-4','B03',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('11','603021712-4','B04',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('12','603021712-4','B05',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));

INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('6','603021032-4','B02',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('7','603021032-4','B03',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('8','603021032-4','B04',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('9','603021032-4','B05',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));

INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('1','603020296-7','B01',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('2','603020296-7','B02',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('3','603020296-7','B03',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('4','603020296-7','B04',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));
INSERT INTO Borrow (BorrowID,STDID,BookID,BorrowDate,ReturnDate)
VALUES('5','603020296-7','B05',TO_DATE('12/2/2019','DD/MM/YYYY'),
TO_DATE('27/2/2019','DD/MM/YYYY'));

INSERT INTO Book (BookID,BookName,BookPrice	,BookAmount)
VALUES('B01','คู่มือเรียนการวิเคราะห์ระบบ','250','10');
INSERT INTO Book (BookID,BookName,BookPrice	,BookAmount)
VALUES('B02','คู่มือใช้งาน PowerPoint','200','5');
INSERT INTO Book (BookID,BookName,BookPrice	,BookAmount)
VALUES('B03','คู่มือใช้งาน Mac OS X','150','6');
INSERT INTO Book (BookID,BookName,BookPrice	,BookAmount)
VALUES('B04','Basic iOS App Development','233','5');
INSERT INTO Book (BookID,BookName,BookPrice	,BookAmount)
VALUES('B05','Professional ASP.NET Programming','200','4');
INSERT INTO Book (BookID,BookName,BookPrice	,BookAmount)
VALUES('B06','เรียน Database อย่างไรให้ไร้ F','99','5');

CREATE TABLE Borrow(
	BorrowID	NUMBER(4),
	STDID		CHAR(11),
	BookID		CHAR(3),
	BorrowDate	DATE,
	ReturnDate	DATE,
	CONSTRAINTS borrow_pk PRIMARY KEY (BorrowID),
	CONSTRAINTS borrow_fk_std FOREIGN KEY (STDID)
				REFERENCES Student(STDID),
	CONSTRAINTS borrow_fk_Book FOREIGN KEY (BookID)
				REFERENCES Book(BookID)
);

CREATE TABLE Book(
	BookID		CHAR(3),
	BookName	VARCHAR2(60),
	BookPrice	NUMBER(6,2),
	BookAmount	NUMBER(3),
	CONSTRAINTS book_pk PRIMARY KEY (BookID)
);
