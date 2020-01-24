CREATE VIEW Lab4_Student As
SELECT stdID,stdFName,stdLName,stdAddress FROM student 
ORDER BY stdID DESC;

CREATE VIEW Lab4_Subject As
SELECT subjcode,name_tha,credit FROM subject
ORDER BY name_tha DESC;

CREATE VIEW Lab4_Fact As
SELECT stdid,stdfname,stdlname,fname_tha,fname_eng
FROM student,fact
WHERE student.fCode = fact.fCode
ORDER BY student.fCode;

CREATE VIEW Lab4_Adviser As
SELECT stdid,stdfname,stdlname,tfname,tlname
FROM student,teacher
WHERE student.tCode = Teacher.tCode
ORDER BY tfname;

drop view Lab4_Adviser;

CREATE VIEW Lab4_REG_322212 As
SELECT subject.subjcode,name_tha,student.stdID,stdfname,stdlname,grade
FROM student,subject,register
WHERE student.stdid = register.stdID
	AND register.subjCode = Subject.subjCode
	AND register.subjCode = '322212'
ORDER BY stdFname;

drop view Lab4_REG_322212;