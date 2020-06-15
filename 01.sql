-- 创建表1：Student

-- create table Student
-- (Sno varchar(20),
-- Sname varchar(10),
-- Ssex varchar(4),
-- Sage numeric(3,0), 
-- Sdept varchar(4),
-- primary key(Sno));

-- 创建表2：Course

-- create table Student
-- (Sno varchar(20),
-- Sname varchar(10),
-- Ssex varchar(4),
-- Sage numeric(1,3),
-- Sdept varchat(4),
-- primary key(Sno));

-- 创建表3：SC





-- 1．在查询分析器在窗口下用SELECT语句完成单表查询：

-- (1)查询全体学生的详细记录；
SELECT * FROM Student; 

-- (2)查询所有选修过课的学生的学号；
SELECT DISTINCT Sno FROM SC; 

 -- (3)查询考试成绩不及格的学生的学号；
SELECT DISTINCT Sno FROM SC WHERE Grade<60;

-- (4)查信息系（IS）、数学系（MA）和计算机科学系（CS）的学生的姓名和性别；
SELECT DISTINCT Sname,Ssex FROM Student WHERE Sdept IN('IS','MA','CS'); 

-- (5)查所有姓刘的学生的姓名、学号和性别；
SELECT Sname,Sno,Ssex FROM Student WHERE Sname LIKE '刘%';

-- (6)查包含课程名中包含“_”字符的课程的课程号和学分；(注意是下划线)
SELECT Cno,Ccredit FROM Course WHERE Cname LIKE '%\_%';

-- (7)查询选修了3号课程的学生的学号及其成绩，查询结果按分数的降序排列；
SELECT Sno,Grade FROM SC WHERE Cno='3' ORDER BY Grade DESC;

-- (8)查询学习1号课程的学生最高分数；
SELECT MAX(Grade) FROM SC WHERE Cno='1';

-- (9)查询各个课程号与相应的选课人数
SELECT Cno,COUNT(Sno) FROM SC GROUP BY Cno;


   
-- 2．在查询分析器在窗口下用SELECT语句完成连接（嵌套）查询：

-- (10)查询每个学生及其选修课程的详细情况，包括学生姓名和课程名；
SELECT *  FROM student JOIN course;

-- (11)查询选修2号课程且成绩在90分以上的所有学生的基本情况；
SELECT * FROM student WHERE EXISTS(SELECT Grade FROM sc WHERE Grade>90);

-- (12)查询每个学生及其选修的课程名其及成绩；
SELECT student.Sname AS '姓名',course.Cname AS '课程名' ,sc.Grade AS '成绩' 
FROM student,sc,course 
WHERE sc.Sno=student.Sno AND course.Cno=sc.Cno;

-- (13)查询与“？？？”在同一个系学习的学生；(？？？为自己的真实姓名)
SELECT Sname AS "姓名" FROM student WHERE Sdept=(SELECT Sdept FROM student WHERE Sname='徐贝宁');
 
-- (14)查询其他系中比信息系某一学生年龄小的学生姓名和年龄；
SELECT Sname,Sage FROM student WHERE Sdept!='IS' AND Sage<(SELECT MAX(Sage) FROM student WHERE Sdept='IS');

-- (15)查询其他系中比信息系所有学生年龄都小的学生姓名及年龄；
SELECT Sname,Sage FROM student WHERE Sdept!='IS' AND Sage<(SELECT MIN(Sage) FROM student WHERE Sdept='IS');






-- (6)查包含课程名中包含“_”字符的课程的课程号和学分；(注意是下划线)
SELECT Cno,Ccredit FROM Course WHERE Cname LIKE '%\_%';

-- SELECT Cno,Ccredit FROM Course WHERE find_in_set('\_', Cname);
-- find_in_set('字符', 字段名)









