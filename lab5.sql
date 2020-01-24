CREATE VIEW Lab5_Credit AS
SELECT student.stdID,stdfName,stdLName,SUM(credit)Totalcredit
FROM subject,student,register
WHERE student.stdID = register.stdID
GROUP BY student.stdID,student.stdfName,student.stdLName
ORDER BY student.stdID;

CREATE VIEW Lab5_Regfee AS
SELECT student.stdID,stdfname,stdlname,year,semester,SUM(credit) totalcredit,SUM(credit)*1000 regfee
FROM student,subject,register
WHERE student.stdID=register.stdID
GROUP BY student.stdID,student.stdfname,student.stdlname,year,semester
ORDER BY student.stdID;

CREATE VIEW Lab5_GPA AS
SELECT student.stdID,stdfname,stdlname,SUM(Grade * Credit)  / Sum (Credit) GPA
FROM student,subject,register
WHERE student.stdID=register.stdID
GROUP BY student.stdID,student.stdfname,student.stdlname
ORDER BY GPA;

INSERT INTO student (stdId,stdfname,stdlname,stdaddress,fcode,dcode,tcode) VALUES ('563020197-5','กฤษดา','โสมายัง','123 จ.ขอนแก่น','F01','D03','T01');
INSERT INTO student (stdId,stdfname,stdlname,stdaddress,fcode,dcode,tcode) VALUES ('563020200-2','ขวัญข้าว','เสียงเลิศ','11 จ.ขอนแก่น','F01','D03',NULL);
INSERT INTO student (stdId,stdfname,stdlname,stdaddress,fcode,dcode,tcode) VALUES ('563020205-2','ชนนิกา','ปัญจันทร์สิงห์','15 จ.ขอนแก่น','F01','D03',NULL);
INSERT INTO student (stdId,stdfname,stdlname,stdaddress,fcode,dcode,tcode) VALUES ('563020206-0','ชนัญชิดา ','อินทะสร้อย','16 จ.ขอนแก่น','F01','D03',NULL);

CREATE VIEW Lab5_GPA_Outer AS
SELECT student.stdID,stdfname,stdlname,SUM(Grade * Credit)  / Sum (Credit) GPA
FROM student,subject,register
WHERE student.stdID=register.stdID(+)
GROUP BY student.stdID,student.stdfname,student.stdlname
ORDER BY GPA;

CREATE VIEW Lab5_Teacher_Outer AS
SELECT student.stdID,stdfname,stdlname,teacher.tcode,tfname,tlname
FROM student,teacher
WHERE student.tcode=teacher.tcode(+)
ORDER BY teacher.tcode;