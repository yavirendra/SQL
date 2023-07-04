#Q1
create schema alumni;

#Q2
use alumni;
select * from college_a_hs;
select * from college_a_se;
select * from college_a_sj;
select * from college_b_hs;
select * from college_b_se;
select * from college_b_sj;

#Q3
desc college_a_hs;
desc college_a_se;
desc college_a_sj;
desc college_b_hs;
desc college_b_se;
desc college_b_sj;

#Q6
CREATE OR REPLACE VIEW  college_a_hs_V AS (SELECT * FROM college_a_hs WHERE RollNo IS NOT NULL AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND Batch IS NOT NULL AND
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND HSDegree IS NOT NULL AND EntranceExam IS NOT NULL AND Institute IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM college_a_hs_V;

#Q7
CREATE OR REPLACE VIEW College_a_se_V AS (SELECT * FROM college_a_se WHERE RollNo IS NOT NULL AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND Batch IS NOT NULL AND
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM College_a_se_V;

#Q8
CREATE OR replace view College_a_sj_V AS (SELECT * FROM college_a_sj WHERE RollNo IS NOT NULL AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND Batch IS NOT NULL AND
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND Designation IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM College_a_sj_V;

#Q9
CREATE or replace VIEW college_b_hs_V AS (SELECT * FROM college_b_hs WHERE RollNo IS NOT NULL AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL
AND Branch IS NOT NULL AND Batch IS NOT NULL AND
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND HSDegree IS NOT NULL AND EntranceExam IS NOT NULL AND Institute IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM college_b_hs_V;

#Q10
CREATE OR REPLACE VIEW college_b_se_V AS (SELECT * FROM college_b_se WHERE RollNo IS NOT NULL AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND Branch IS NOT NULL AND Batch IS NOT NULL AND
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM college_b_se_V;

#Q11
CREATE OR REPLACE VIEW college_b_sj_V AS (SELECT * FROM college_b_sj WHERE RollNo IS NOT NULL AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND Branch IS NOT NULL AND Batch IS NOT NULL AND
Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND Designation IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM college_b_sj_V;

#Q12
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_A_HS_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_A_Se_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_A_Sj_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_B_HS_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_B_Se_V;
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM College_B_Sj_V;

#Q14
DROP PROCEDURE get_name_collegeA
DELIMITER $$
CREATE PROCEDURE get_name_collegeA 
(
         INOUT name1 TEXT(40000)
)
BEGIN 
    DECLARE na INT DEFAULT 0;
    DECLARE namelist VARCHAR(16000) DEFAULT "";
    
    DECLARE namedetail 
           CURSOR FOR
				SELECT Name FROM college_a_hs UNION SELECT Name FROM college_a_se UNION SELECT Name FROM college_a_sj;
                
	DECLARE CONTINUE HANDLER 
            FOR NOT FOUND SET na =1;
            
	OPEN namedetail;
    
    getame :
         LOOP
         FETCH FROM namedetail INTO namelist;
         IF na = 1 THEN
              LEAVE getame;
		END IF;
        SET name1 = CONCAT(namelist,";",name1);
        
        END LOOP getame;
        CLOSE namedetail;
END $$
DELIMITER ;

SET @Name = "";
CALL get_name_collegeA(@Name);
SELECT @Name Name;

#Q15
DROP PROCEDURE get_name_collegeB
DELIMITER $$
CREATE PROCEDURE get_name_collegeB 
(
         INOUT name1 TEXT(40000)
)
BEGIN 
    DECLARE na INT DEFAULT 0;
    DECLARE namelist VARCHAR(16000) DEFAULT "";
    
    DECLARE namedetail 
           CURSOR FOR
				SELECT Name FROM college_b_hs UNION SELECT Name FROM college_b_se UNION SELECT Name FROM college_b_sj;
                
	DECLARE CONTINUE HANDLER 
            FOR NOT FOUND SET na =1;
            
	OPEN namedetail;
    
    getame :
         LOOP
         FETCH FROM namedetail INTO namelist;
         IF na = 1 THEN
              LEAVE getame;
		END IF;
        SET name1 = CONCAT(namelist,";",name1);
        
        END LOOP getame;
        CLOSE namedetail;
END $$
DELIMITER ;

SET @Name = "";
CALL get_name_collegeB(@Name);
SELECT @Name Name;

#Q16
SELECT "Higher Studies" Present_status,(COUNT(college_a_hs.RollNo) /(college_a_hs.RollNo))*100 College_A_Persentage,(COUNT(college_b_hs.RollNo)/(college_b_hs.RollNo))*100 College_B_Persentage   FROM college_a_hs CROSS JOIN college_b_hs UNION 
SELECT "Self Empolyment" Present_status,(COUNT(college_a_se.RollNo) /(college_a_se.RollNo))*100 College_A_Persentage,(COUNT(college_b_se.RollNo)/(college_b_se.RollNo))*100 College_B_Persentage   FROM college_a_se CROSS JOIN college_b_se UNION
SELECT "Service Job" Present_status,(COUNT(college_a_sj.RollNo) /(college_a_sj.RollNo))*100 College_A_Persentage,(COUNT(college_b_sj.RollNo)/(college_b_sj.RollNo))*100 College_B_Persentage    FROM college_a_sj CROSS JOIN college_b_sj;
