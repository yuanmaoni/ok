1 
select y.sid,s.sname,x.cid,x.score,y.cid,y.score
from
(select sid,cid,score from sc where cid = '01') as x
inner join
(select sid,cid,score from sc where cid = '02') as y
on x.sid = y.sid
inner join student01 as s
where x.score > y.score
3 
select *
from
(select sid,cid,score from sc where cid = '01') as x
left join
(select sid,cid,score from sc where cid = '02') as y
on x.sid = y.sid
4
select *
from
(select sid,cid,score from sc where cid = '02') as y
left join
(select sid,cid,score from sc where cid = '01') as x
on x.sid = y.sid
5.??平均成?大于等于 60 分的同学的学生?号和学生姓名和平均成?
select s.sid,s.sname,x.cid,x.avg
from
(select sid,cid,avg(score) as avg
from sc
group by sid
having avg(score) >= 60) as x
left join student01 as s
on s.sid=x.sid
6.??在 SC 表存在成?的学生信息
select s.sid, s.sname, s.sage, s.ssex,sc.cid,sc.score
from sc 
inner join student01 as s
on s.sid = sc.sid
7.??所有同学的学生?号、学生姓名、???数、所有?程的?成?(没成?的?示? null )
7.1.?有成?的学生信息
select x.sid,s.sname,x.aa,x.bb
from
(select sid,count(cid) as aa ,sum(score) as bb
from sc
group by sid) as x
left join student01 as s
on x.sid = s.sid
7(2)
select s.sname, s.sid, count(sc.cid), sum(sc.score) 
from sc
inner join student01 as s
on sc.sid=s.sid
inner join course as c
on c.cid = sc.cid
group by s.sid
8.??「李」姓老?的数量
select count(tname ) from teacher
where tname  like '李%'
9.??学?「?三」老?授?的同学的信息
select s.sid,s.sname,s.sage,s.ssex,bb.cname,bb.score,bb.tname
from student01 as s
right join
(select aa.sid,aa.cid,aa.score,aa.cname,aa.tid,t.tname
from
(select sc.sid,sc.cid,sc.score,c.cname,c.tid
from sc
inner join course as c
on sc.cid = c.cid ) as aa
inner join teacher as t
on aa.tid = t.tid
where tname = '張三') as bb
on s.sid = bb.sid
10.??没有学全所有?程的同学的信息
select s.sid,s.sname,s.sage,s.ssex
from student01 as s
inner join 
(select sid,count(cid)
from sc
group by sid
having count(cid) < (select count(cid) from course)) as aa
on s.sid = aa.sid
11.??至少有一??与学号?” 01 “的同学所学相同的同学的信息
/*???个学生学了几??*/
select sid,count(cid),score
from sc
group by sid
/*01学了?些? courseのcid=scのcid*/
select
from
(select distinct sid from sc
where cid in(select cid from sc where sid='01')and sid<>'01') as x
inner join student01 as y
11111
select sc.sid,sc.score c.cname
from 
(select cid from sc where sid = '01') as aa
left join course as c
on aa.cid = c.cid
left join sc 
on aa.cid = sc.cid



 ) as aa
on sc.sid =aa.sid


***********
select y.sid,y.sname,y.sage,y.ssex
from
(select distinct sid from sc
where cid in(select cid from sc where sid='01')and sid<>'01') as x
inner join student01 as y
on x.sid = y.sid


12.??和” 01 “号的同学学?的?程 完全相同的其他同学的信息
/* 
01?程的?数，
?个学生学?的??程数*/
select count(cid) from sc where sid = '01'

select sid from sc where sid <>'01'
group by sid 
having count(cid)=(select count(cid) from sc where sid = '01')

select
from sc
where cid in (

12
select * from student01 where sid in (select sid from sc where sid <> '01'
group by sid
having count(cid)=
(select count(cid) from sc where sid='01'))and sid not in
(select sid from sc where cid not in (select cid from sc where sid = '01'));


13.??没学?"?三"老??授的任一??程的学生姓名

select sid,sname
from student01 as s
where sid not in
(select sid from sc
join course 
on sc.cid=course.cid
join teacher 
on teacher.tid=course.tid
where  tname='張三')






******************
select sid
from sc
where sid not in (select cid
from
(select tid from teacher where  tname ='張三') as x
inner join course as c
on x.tid= c.tid)

14.????及其以上不及格?程的同学的学号，姓名及其平均成?
select s.sid,s.sname,z.avg
from
(select x.sid 
from (select *  from sc where score < 60) as x
group by sid
having count(cid) >= 2) as y
inner join 
(select sid,avg(score) as avg  /*平均点数:*/
from sc
group by sid) as z
on y.sid = z.sid
inner join student01 as s
on s.sid = z.sid

select x.sid 
from (select *  from sc where score < 60) as x
group by sid
having count(cid) >= 2

15.?索” 01 "?程分数小于 60，按分数降序排列的学生信息
select *
from sc where score < 60 and cid = '01' 
order by score desc

16.按平均成?从高到低?示所有学生的所有?程的成?以及平均成?
select *
from
(select sid,cid,avg(score) as avg ,score
from sc
group by sid  ) as y
inner join sc
on sc.sid = y.sid
inner join student01 as s
on sc.sid = s.sid 
order by avg desc

17.??各科成?最高分、最低分和平均分：
以如下形式?示：?程 ID，?程 name，最高分，最低分，平均分，及格率，中等率，?良率，?秀率
及格?>=60，中等?：70-80，?良?：80-90，?秀?：>=90
select sid,cid, max(score),min(score),avg(score)from sc
group by cid

(select sid,cid,count(sid) as x from sc group by cid having  count(sid)) as xx

(select count(sid) as a from (select * from sc where score >= 60) as aa where cid ='01')as yy  /(select sid,cid,count(sid) as x from sc group by cid having  count(sid)) as xx

select count(sid)as b from (select * from sc where score >= 60) as aa where cid ='02'

select count(sid)as b from (select * from sc where score >= 60) as aa where cid ='03'

select *
from (select sid,cid,count(sid) as x from sc group by cid having  count(sid)) as xx
having cid,count(sid) as x / count(sid)as y

select (select count(sid) as a from (select * from sc where score >= 60) as aa where cid ='01')  /  (select sid,cid,count(sid) as x from sc group by cid having  count(sid)) 
from sc
having (select count(sid) as a from (select * from sc where score >= 60) as aa where cid ='01')  /  (select sid,cid,count(sid) as x from sc group by cid having  count(sid))
 
select  cid,count(sid)as cnta from sc group by cid

select  cid,count(sid)as cntb from sc where score>=60 group by cid
 
select cid,count(sid)as cntc from sc where score>=70 and score<80 group by cid


select t1.cid,(t2.cntb / t1.cnta) * 100 as 及格率, (t3.cntc / t1.cnta) *100 as 中等率,(t4.cntd / t1.cnta) *100 as ?良率,(t5.cnte / t1.cnta) *100 as ?秀率,
from (select  cid,count( sid)as cnta from sc group by cid)as t1
left join (select  cid,count(sid)as cntb from sc where score>=60 group by cid) as t2
on t1.cid = t2.cid 
left join (select cid,count(sid)as cntc from sc where score>=70 and score<80 group by cid) as t3
on t2.cid = t3.cid
left join (select cid,count(sid)as cntd from sc where score>=80 and score<90 group by cid) as t4
on t3.cid = t4.cid
left join (select cid,count(sid)as cnte from sc where score>=90 group by cid) as t5
on t4.cid = t5.cid




18.按各科成??行排序，并?示排名， Score 重??保留名次空缺

(select sid,cid,score
from sc 
where cid ='01'
order by score desc) as a

(select sid,cid,score
from sc 
where cid ='02'
order by score desc) as b
on a.sid = b.sid

select *
from sc 
where cid ='03'
order by score desc


19.按各科成??行排序，并?示排名， Score 重??合并名次

20.??学生的?成?，并?行排名，?分重??保留名次空缺

21.??学生的?成?，并?行排名，?分重??不保留名次空缺

22.??各科成?各分数段人数：?程?号，?程名称，[100-85]，[85-70]，[70-60]，[60-0] 及所占百分比


23.??各科成?前三名的??

(select * from sc where cid ='01'
order by score desc limit 3
) 
union
(select * from sc where cid ='02'
order by score desc limit 3
) 
union
(select * from sc where cid ='03'
order by score desc limit 3
) 

24.?????程被?修的学生数
select  cid,count( sid) from sc group by cid

25.??出只?修???程的学生学号和姓名
select s.sid,s.sname
from
(select sid,count(cid)
from sc
group by sid
having count(cid) =  2) as aa
inner join student01 as s
on aa.sid = s.sid

26.??男生、女生人数
select sid,ssex,count(ssex)
from student01
group by ssex

27.??名字中含有「?」字的学生信息
select *
from student01
where sname like '%?%'
28.??同名同性学生名?，并??同名人数
select sid,sname,count(sname),count(ssex)
from student01
group by sname,ssex
having count(sname) >= 2
29.?? 1990 年出生的学生名?
select *
from student01 
where sage between '1990-01-01' and  '1990-12-31' 

30.?????程的平均成?，?果按平均成?降序排列，平均成?相同?，按?程?号升序排列
select avg(score)as avg,cid,sid
from sc
group by cid
order by avg desc ,cid
31.??平均成?大于等于 85 的所有学生的学号、姓名和平均成?
select aa.sid,s.sname,aa.avg
from
(select sid,cid,avg(score) as avg
from sc
group by sid
having avg(score)>=85) as aa
left join student01 as s
on aa.sid = s.sid
32.???程名称?「数学」，且分数低于 60 的学生姓名和分数
select s.sid,s.sname,aa.cname,aa.score
from
(select sc.sid,sc.score,c.cname
from sc
inner join course as c
on sc.cid = c.cid
where cname = '数学' and score <  60) as aa
inner join student01 as s
on aa.sid = s.sid

33.??所有学生的?程及分数情况（存在学生没成?，没??的情况）
select s.sid,s.sname,c.cname,sc.score
from student01 as s
left join sc
on s.sid = sc.sid
inner join course as c
on c.cid = sc.cid
34.??任何一??程成?在 70 分以上的姓名、?程名称和分数
select s.sid,s.sname,c.cname,a.score
from
(select *
from sc
where score > 70) as a
inner join course as c
on c.cid = a.cid
inner join student01 as s
on s.sid = a.sid
35.??不及格的?程
select *
from sc
where score<=60
36.???程?号? 01 且?程成?在 80 分以上的学生的学号和姓名
select s.sid,s.sname,a.score
from (select * from sc
where cid = '01' and score >=80) as a
inner join student01 as s
on a.sid = s.sid
37.求???程的学生人数
select cid,count(sid)
from sc
group by cid

38.成?不重?，???修「?三」老?所授?程的学生中，成?最高的学生信息及其成?
select aa.sid,aa.sname,aa.cname,max(aa.score)
from
(select sc.sid,s.sname,c.cname,sc.score,t.tname
from course as c
inner join teacher as t
on c.tid = t.tid
inner join sc
on c.cid = sc.cid
inner join student01 as s
on s.sid = sc.sid ) as aa
where tname = '張三'

40.??不同?程成?相同的学生的 学生?号、?程?号、学生成?
select count(score),
from sc
group by score



41.????功成?最好的前?名
select 
from sc
group by cid
order by score limit 2



42.?????程的学生?修人数（超? 5 人的?程才??）。
SELECT SC.Cid, Course.Cname, COUNT(*)
FROM SC INNER JOIN Course
ON SC.Cid = Course.Cid
GROUP BY SC.Cid, Course.Cname
HAVING COUNT(SC.Cid) > 5;


43.?索至少?修???程的学生学号
select sid,count(cid)
from sc 
group by  sid
having count(cid) >= 2

44.???修了全部?程的学生信息
select s.sid,s.sname
from
(select sid,count(cid)
from sc 
group by  sid
having count(cid) = (select count(cid) from course) ) as a
inner join student01 as s
on a.sid = s.sid

44
select *
from student01
where sid in (
select sid
from sc
group by sid
having count(distinct cid) = (
select count(distinct cid) from course))

45.??各学生的年?，只按年?来算
select sid,sname,
(extract(year from now())-extract(year from sage)) as 年?
from student01

46.按照出生日期来算，当前月日 < 出生年月的月日,?年??一
SELECT Sid, Sname, Sage,
EXTRACT(YEAR FROM AGE(CURRENT_DATE, Sage)) 
FROM Student01

47.??本周?生日的学生
SELECT *
FROM Student01
WHERE EXTRACT curdate() = EXTRACT(WEEK FROM sage)

47.??本周?生日的学生
SELECT *
FROM Student01
WHERE EXTRACT(week from current_date)= EXTRACT(WEEK FROM sage)
48.??下周?生日的学生


SELECT *
FROM Student01 
WHERE (date_sub(now(),interval 7 day)) = EXTRACT(week from current_date)
49.??本月?生日的学生

SELECT *
FROM Student01
WHERE EXTRACT(month from current_date)= EXTRACT(month FROM sage)
50.??下月?生日的学生

SELECT *
FROM Student01
WHERE EXTRACT(month from current_date)+1= EXTRACT(month FROM sage)

49.??本月?生日的学生


44.???修了全部?程的学生信息
select s.sid,s.sname,aa.x
from student01 as s
inner join
(select sid,count(cid) as x
from sc
group by sid
having count(cid) = (select count(cid) from course)) as aa
on s.sid = aa.sid






