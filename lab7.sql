SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE LAB7_Student
IS 
--DECLARE
	vstdId CHAR(11);
	vstdFName VARCHAR2(40);
	vstdLName VARCHAR2(40);
	vstdAddress VARCHAR2(80);
	vFcode CHAR(3);
	vDcode CHAR(3);
	vTcode CHAR(3);
BEGIN
	SELECT StdID,StdFName,StdLName,StdAddress,Fcode,Dcode,Tcode
	INTO vstdId,vstdFName,vstdLName,vstdAddress,vFcode,vDcode,vTcode
	FROM Student
	WHERE StdID = '603020315-9';
	DBMS_OUTPUT.PUT_LINE('Student ID : '||vstdId);
	DBMS_OUTPUT.PUT_LINE('FirstName : '||vstdFName);
	DBMS_OUTPUT.PUT_LINE('LastName : '||vstdLName);
	DBMS_OUTPUT.PUT_LINE('Address : '||vstdAddress);
	DBMS_OUTPUT.PUT_LINE('Fcode : '||vFcode);
	DBMS_OUTPUT.PUT_LINE('Dcode : '||vDcode);
	DBMS_OUTPUT.PUT_LINE('Tcode : '||vTcode);
END;
/



CREATE OR REPLACE PROCEDURE LAB7_StudentDept
IS 
--DECLARE
	vstdId CHAR(11);
	vstdFName VARCHAR2(40);
	vstdLName VARCHAR2(40);
	vstdAddress VARCHAR2(80);
	vFname_tha VARCHAR2(80);
	vDname_tha VARCHAR2(80);
BEGIN
	SELECT StdID,StdFName,StdLName,StdAddress,Fname_tha,Dname_tha
	INTO vstdId,vstdFName,vstdLName,vstdAddress,vFname_tha,vDname_tha
	FROM Student,Fact,Dept 
	WHERE StdID = '603020315-9'
	AND Fact.Fcode = Student.Fcode
	AND Dept.Dcode = Student.Dcode
	AND Fact.Fcode = Dept.Fcode;
	DBMS_OUTPUT.PUT_LINE('Student ID : '||vstdId);
	DBMS_OUTPUT.PUT_LINE('FirstName : '||vstdFName);
	DBMS_OUTPUT.PUT_LINE('LastName : '||vstdLName);
	DBMS_OUTPUT.PUT_LINE('Address : '||vstdAddress);
	DBMS_OUTPUT.PUT_LINE('Faculty Name : '||vFname_tha);
	DBMS_OUTPUT.PUT_LINE('Department Name : '||vDname_tha);
END;
/


CREATE OR REPLACE PROCEDURE LAB7_Register
IS 
--DECLARE
	vstdId CHAR(11);
	vstdFName VARCHAR2(40);
	vstdLName VARCHAR2(40);
	vcredit NUMBER(2);
	vreg VARCHAR2(80);
BEGIN
	SELECT Student.StdID,StdFName,StdLName,SUM(credit),SUM(credit)*1000
	INTO vstdId,vstdFName,vstdLName,vcredit,vreg
	FROM Student,Subject,Register 
	WHERE Student.StdID = '603020315-9'
	AND Student.stdID = Register.stdID
	AND Subject.subjCode = Register.subjCode
	GROUP BY Student.StdID,StdFName,StdLName;
	DBMS_OUTPUT.PUT_LINE('Student ID : '||vstdId);
	DBMS_OUTPUT.PUT_LINE('FirstName : '||vstdFName);
	DBMS_OUTPUT.PUT_LINE('LastName : '||vstdLName);
	DBMS_OUTPUT.PUT_LINE('Credit : '||vcredit);
	DBMS_OUTPUT.PUT_LINE('Register Fee : '||vreg);

END;
/