CREATE TABLE fact(
	FCode CHAR(3),
	FName_Tha VARCHAR2(80),
	FName_Eng VARCHAR2(80),
	CONSTRAINTS fact_pk PRIMARY KEY(FCode)
);

CREATE TABLE dept(
	FCode CHAR(3),
	DCode CHAR(3),
	DName_Tha VARCHAR2(80),
	DName_Eng VARCHAR2(80),
	CONSTRAINTS dept_pk PRIMARY KEY (FCode,DCode),
	CONSTRAINTS dept_fk_fact FOREIGN KEY (FCode)
		REFERENCES fact(FCode)
);

CREATE TABLE student(
	StdID CHAR(11),
	StdFName VARCHAR2(40),
	StdLName VARCHAR2(40),
	StdAddress VARCHAR2(80),
	FCode CHAR(3),
	DCode CHAR(3),
	CONSTRAINTS student_pk PRIMARY KEY (StdID),
	CONSTRAINTS student_fk_fact FOREIGN KEY (FCode)
		REFERENCES fact(FCode),
	CONSTRAINTS student_fk_dept FOREIGN KEY (FCode,DCode)
		REFERENCES dept(FCode,DCode)
);

INSERT INTO fact(FCode,FName_Tha,FName_Eng) VALUES('F01','คณะวิทยาศาสตร์','Science');
INSERT INTO fact(FCode,FName_Tha,FName_Eng) VALUES('F02','คณะวิศวกรรมศาสตร์','Engineer');
INSERT INTO fact(FCode,FName_Tha,FName_Eng) VALUES('F03','คณะเทคโนโลยี','Technology');
INSERT INTO fact(FCode,FName_Tha,FName_Eng) VALUES('F04','คณะมนุษยศาสตร์และสังคมศาสตร์','Humanities and Social Sciences');
INSERT INTO fact(FCode,FName_Tha,FName_Eng) VALUES('F05','คณะศึกษาศาสตร์','Education');


INSERT INTO dept(FCode,DCode,DName_Tha,DName_Eng) VALUES('F01','D01','คณิตศาสตร์','Mathematics');
INSERT INTO dept(FCode,DCode,DName_Tha,DName_Eng) VALUES('F01','D02','สถิติ','Statistics');
INSERT INTO dept(FCode,DCode,DName_Tha,DName_Eng) VALUES('F01','D03','วิทยาการคอมพิวเตอร์','Computer Science');
INSERT INTO dept(FCode,DCode,DName_Tha,DName_Eng) VALUES('F02','D01','วิศวกรรมคอมพิวเตอร์','Computer Engineer');
INSERT INTO dept(FCode,DCode,DName_Tha,DName_Eng) VALUES('F03','D01','เทคโนโลยีการอาหาร','Food Technology');


INSERT INTO student(StdID,StdFName,StdLName,StdAddress,FCode,DCode) VALUES('603020315-9','วาสนา',' ถาปราบมาตร์','ขอนแก่น','F01','D01');
INSERT INTO student(StdID,StdFName,StdLName,StdAddress,FCode,DCode) VALUES('603020290-9','นางสาวณิชกานต์ ','พลหาญ','ศรีสะเกษ','F01','D01');
INSERT INTO student(StdID,StdFName,StdLName,StdAddress,FCode,DCode) VALUES('603021032-6','นางสาวอมรทรัพท์,','  แสนประสิทธิ์','นครราชสีมา','F02','D01');
INSERT INTO student(StdID,StdFName,StdLName,StdAddress,FCode,DCode)VALUES('603021712-4','นางสาวอรอนงค์  ','ทะวงษ์ศรี','หนองคาย','F03','D01');

หลัง insert ต้อง commit; 