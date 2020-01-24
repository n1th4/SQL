--1
CREATE OR REPLACE PROCEDURE LAB9_StudentGrade  
IS
--DECLARE 
	CURSOR cstdscore IS SELECT id,name,work,mid,final FROM studentScore;
	vid		studentScore.id%TYPE;
	vname	studentScore.name%TYPE;
	vwork	studentScore.work%TYPE;
	vmid	studentScore.mid%TYPE;
	vfinal	studentScore.final%TYPE;
	vTotal NUMBER(2);
	vgrade CHAR(1);
	
BEGIN
	OPEN cstdscore;
	LOOP	
		FETCH cstdscore INTO vid,vname,vwork,vmid,vfinal;
	EXIT WHEN cstdscore%notfound;
		DBMS_OUTPUT.PUT_LINE('*************** Row'||cstdscore%rowcount||'*****************');
		DBMS_OUTPUT.PUT_LINE('Student ID : '||vid);
		DBMS_OUTPUT.PUT_LINE('Name : '||vname);
		DBMS_OUTPUT.PUT_LINE('Work Score : '||vwork);
		DBMS_OUTPUT.PUT_LINE('Midterm Score : '||vmid);
		DBMS_OUTPUT.PUT_LINE('Final Score : '||vfinal);
		vTotal := vwork+vmid+vfinal;
		DBMS_OUTPUT.PUT_LINE('Total Score : '||vTotal);
		
		IF vTotal>80 THEN
			vgrade := 'A';
		ELSIF vTotal BETWEEN 75 AND 79 THEN
			vgrade := 'B+';
		ELSIF vTotal BETWEEN 70 AND 74 THEN
			vgrade := 'B';
		ELSIF vTotal BETWEEN 65 AND 69 THEN
			vgrade := 'C+';
		ELSIF vTotal BETWEEN 60 AND 64 THEN
			vgrade := 'C';
		ELSIF vTotal BETWEEN 55 AND 59 THEN
			vgrade := 'D+';
		ELSIF vTotal BETWEEN 50 AND 54 THEN
			vgrade := 'D';
		ELSE
			vgrade := 'F';
		END IF;
		DBMS_OUTPUT.PUT_LINE('Getting grade is '||vgrade);
	END LOOP;
	CLOSE cstdscore;
END;
/

--2
CREATE OR REPLACE PROCEDURE LAB9_CALGRADE (stdId VARCHAR2,total NUMBER)
IS
	grade CHAR;
BEGIN
		IF total>80 THEN
			grade := 'A';
		ELSIF total BETWEEN 75 AND 79 THEN
			grade := 'B+';
		ELSIF total BETWEEN 70 AND 74 THEN
			grade := 'B';
		ELSIF total BETWEEN 65 AND 69 THEN
			grade := 'C+';
		ELSIF total BETWEEN 60 AND 64 THEN
			grade := 'C';
		ELSIF total BETWEEN 55 AND 59 THEN
			grade := 'D+';
		ELSIF total BETWEEN 50 AND 54 THEN
			grade := 'D';
		ELSE
			grade := 'F';
		END IF;
		DBMS_OUTPUT.PUT_LINE('Input Student ID : '||stdId);
		DBMS_OUTPUT.PUT_LINE('Output grade : '||grade);
END;
/

EXECUTE LAB9_CALGRADE ('5999999999-1',80);


--3
CREATE OR REPLACE PROCEDURE LAB9_ExecuteGrade  
IS
--DECLARE 
	CURSOR cstdscore IS SELECT id,name,work,mid,final FROM studentScore;
	vid		studentScore.id%TYPE;
	vname	studentScore.name%TYPE;
	vwork	studentScore.work%TYPE;
	vmid	studentScore.mid%TYPE;
	vfinal	studentScore.final%TYPE;
	vTotal NUMBER(2);
	vgrade CHAR(1);
	
BEGIN
	OPEN cstdscore;
	LOOP	
		FETCH cstdscore INTO vid,vname,vwork,vmid,vfinal;
	EXIT WHEN cstdscore%notfound;
		DBMS_OUTPUT.PUT_LINE('*************** Row'||cstdscore%rowcount||'*****************');
		DBMS_OUTPUT.PUT_LINE('Student ID : '||vid);
		DBMS_OUTPUT.PUT_LINE('Name : '||vname);
		DBMS_OUTPUT.PUT_LINE('Work Score : '||vwork);
		DBMS_OUTPUT.PUT_LINE('Midterm Score : '||vmid);
		DBMS_OUTPUT.PUT_LINE('Final Score : '||vfinal);
		vTotal := vwork+vmid+vfinal;
		DBMS_OUTPUT.PUT_LINE('Total Score : '||vTotal);
		LAB9_CALGRADE (vid,vTotal);
		DBMS_OUTPUT.PUT_LINE('Getting grade is '||vgrade);
	END LOOP;
	CLOSE cstdscore;
END;
/

--4
ALTER TABLE studentScore
ADD(
	FCode CHAR(3),
	CONSTRAINTS studentscore_fk_fact FOREIGN KEY(FCode)
		REFERENCES Fact(FCode)
);

UPDATE studentscore SET Fcode='F01'
WHERE ID='553020621-7';

UPDATE studentscore SET Fcode='F01'
WHERE ID='555020270-4';

UPDATE studentscore SET Fcode='F01' 
WHERE ID='603020315-9';

--5
CREATE OR REPLACE PROCEDURE LAB9_StudentData_Grade   
IS
--DECLARE 
	CURSOR cstdscore IS SELECT id,name,work,mid,final,fname_tha FROM studentScore,Fact
	WHERE studentScore.fcode=fact.fcode;
	vid		studentScore.id%TYPE;
	vname	studentScore.name%TYPE;
	vwork	studentScore.work%TYPE;
	vmid	studentScore.mid%TYPE;
	vfinal	studentScore.final%TYPE;
	vfname_tha	Fact.fname_tha%TYPE;
	vTotal NUMBER(2);
	vgrade CHAR(1);
	
BEGIN
	OPEN cstdscore;
	LOOP	
		FETCH cstdscore INTO vid,vname,vwork,vmid,vfinal,vfname_tha;
	EXIT WHEN cstdscore%notfound;
		DBMS_OUTPUT.PUT_LINE('*************** Row'||cstdscore%rowcount||'*****************');
		DBMS_OUTPUT.PUT_LINE('Student ID : '||vid);
		DBMS_OUTPUT.PUT_LINE('Name : '||vname);
		DBMS_OUTPUT.PUT_LINE('Faculty Name : '||vfname_tha);
		DBMS_OUTPUT.PUT_LINE('Work Score : '||vwork);
		DBMS_OUTPUT.PUT_LINE('Midterm Score : '||vmid);
		DBMS_OUTPUT.PUT_LINE('Final Score : '||vfinal);
		vTotal := vwork+vmid+vfinal;
		DBMS_OUTPUT.PUT_LINE('Total Score : '||vTotal);
		LAB9_CALGRADE (vid,vTotal);
		DBMS_OUTPUT.PUT_LINE('Getting grade is '||vgrade);
	END LOOP;
	CLOSE cstdscore;
END;
/





