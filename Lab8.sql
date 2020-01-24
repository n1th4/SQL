CREATE OR REPLACE PROCEDURE LAB8_Power2 
IS 
--DECLARE
	total NUMBER(4) :=1;
BEGIN
	FOR x IN 1..10
	LOOP
		total := total*2;
		DBMS_OUTPUT.PUT_LINE('2 ^ '||x||' = '||total);	
	END LOOP;
END;
/

CREATE TABLE StudentScore (
	ID CHAR(11),
	Name VARCHAR2(80),
	Mid	NUMBER(2),
	Final NUMBER(2),
	Work NUMBER(2),
	CONSTRAINTS ID_pk PRIMARY KEY (ID)
);

INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES ('553020621-7','สิทธิชัย สมทรัพย์','29','38','28');
INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES ('555020270-4','พงษ์ศธร จันทร์ยอย','15','20','10');
INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES ('603020315-9','วาสนา ถาปราบมาตร์','20','30','34');

CREATE OR REPLACE PROCEDURE LAB8_DBGrade  
IS 
--DECLARE
	vID CHAR(11);
	vName VARCHAR2(80);
	vWork NUMBER(2);
	vMid	NUMBER(2);
	vFinal NUMBER(2);
	vTotal NUMBER(2);
	vgrade CHAR(1);
BEGIN
	SELECT ID,Name,Work,Mid,Final,SUM(Work+Mid+Final)
	INTO vID,vName,vWork,vMid,vFinal,vTotal
	FROM StudentScore
	WHERE ID = '603020315-9'
	GROUP BY ID,Name,Work,Mid,Final;
	IF vTotal>80 THEN
		vgrade := 'A';
	ELSIF vTotal BETWEEN 70 AND 79 THEN
		vgrade := 'B';
	ELSIF vTotal BETWEEN 60 AND 69 THEN
		vgrade := 'C';
	ELSIF vTotal BETWEEN 50 AND 59 THEN
		vgrade := 'D';
	ELSE
		vgrade := 'F';
	END IF;
	
	DBMS_OUTPUT.PUT_LINE('Student ID : '||vID);
	DBMS_OUTPUT.PUT_LINE('Name : '||vName);
	DBMS_OUTPUT.PUT_LINE('Work score : '||vWork);
	DBMS_OUTPUT.PUT_LINE('Midterm score : '||vMid);
	DBMS_OUTPUT.PUT_LINE('Final score : '||vFinal);
	DBMS_OUTPUT.PUT_LINE('Total score : '||vTotal);
	DBMS_OUTPUT.PUT_LINE('Getting grade is '||vgrade);
END;
/
	