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
5.??���ϐ�?�嘰���� 60 ���I���w�I�w��?���a�w�������a���ϐ�?
select s.sid,s.sname,x.cid,x.avg
from
(select sid,cid,avg(score) as avg
from sc
group by sid
having avg(score) >= 60) as x
left join student01 as s
on s.sid=x.sid
6.??�� SC �\���ݐ�?�I�w���M��
select s.sid, s.sname, s.sage, s.ssex,sc.cid,sc.score
from sc 
inner join student01 as s
on s.sid = sc.sid
7.??���L���w�I�w��?���A�w�������A???���A���L?���I?��?(�v��?�I?��? null )
7.1.?�L��?�I�w���M��
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
8.??�u���v���V?�I����
select count(tname ) from teacher
where tname  like '��%'
9.??�w?�u?�O�v�V?��?�I���w�I�M��
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
where tname = '���O') as bb
on s.sid = bb.sid
10.??�v�L�w�S���L?���I���w�I�M��
select s.sid,s.sname,s.sage,s.ssex
from student01 as s
inner join 
(select sid,count(cid)
from sc
group by sid
having count(cid) < (select count(cid) from course)) as aa
on s.sid = aa.sid
11.??�����L��??�^�w��?�h 01 �g�I���w���w�����I���w�I�M��
/*???���w���w���{??*/
select sid,count(cid),score
from sc
group by sid
/*01�w��?��? course��cid=sc��cid*/
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


12.??�a�h 01 �g���I���w�w?�I?�� ���S�����I�������w�I�M��
/* 
01?���I?���C
?���w���w?�I??����*/
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


13.??�v�w?"?�O"�V??���I�C��??���I�w������

select sid,sname
from student01 as s
where sid not in
(select sid from sc
join course 
on sc.cid=course.cid
join teacher 
on teacher.tid=course.tid
where  tname='���O')






******************
select sid
from sc
where sid not in (select cid
from
(select tid from teacher where  tname ='���O') as x
inner join course as c
on x.tid= c.tid)

14.????�y���ȏ�s�y�i?���I���w�I�w���C�����y�����ϐ�?
select s.sid,s.sname,z.avg
from
(select x.sid 
from (select *  from sc where score < 60) as x
group by sid
having count(cid) >= 2) as y
inner join 
(select sid,avg(score) as avg  /*���ϓ_��:*/
from sc
group by sid) as z
on y.sid = z.sid
inner join student01 as s
on s.sid = z.sid

select x.sid 
from (select *  from sc where score < 60) as x
group by sid
having count(cid) >= 2

15.?���h 01 "?���������� 60�C�����~���r��I�w���M��
select *
from sc where score < 60 and cid = '01' 
order by score desc

16.���ϐ�?��������?�����L�w���I���L?���I��?�ȋy���ϐ�?
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

17.??�e�Ȑ�?�ō����A�Œᕪ�a���ϕ��F
�Ȕ@���`��?���F?�� ID�C?�� name�C�ō����C�Œᕪ�C���ϕ��C�y�i���C�������C?�Ǘ��C?�G��
�y�i?>=60�C����?�F70-80�C?��?�F80-90�C?�G?�F>=90
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


select t1.cid,(t2.cntb / t1.cnta) * 100 as �y�i��, (t3.cntc / t1.cnta) *100 as ������,(t4.cntd / t1.cnta) *100 as ?�Ǘ�,(t5.cnte / t1.cnta) *100 as ?�G��,
from (select  cid,count( sid)as cnta from sc group by cid)as t1
left join (select  cid,count(sid)as cntb from sc where score>=60 group by cid) as t2
on t1.cid = t2.cid 
left join (select cid,count(sid)as cntc from sc where score>=70 and score<80 group by cid) as t3
on t2.cid = t3.cid
left join (select cid,count(sid)as cntd from sc where score>=80 and score<90 group by cid) as t4
on t3.cid = t4.cid
left join (select cid,count(sid)as cnte from sc where score>=90 group by cid) as t5
on t4.cid = t5.cid




18.�e�Ȑ�??�s�r���C��?���r���C Score �d??�ۗ��������

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


19.�e�Ȑ�??�s�r���C��?���r���C Score �d??���󖼎�

20.??�w���I?��?�C��?�s�r���C?���d??�ۗ��������

21.??�w���I?��?�C��?�s�r���C?���d??�s�ۗ��������

22.??�e�Ȑ�?�e�����i�l���F?��?���C?�����́C[100-85]�C[85-70]�C[70-60]�C[60-0] �y����S����


23.??�e�Ȑ�?�O�O���I??

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

24.?????����?�C�I�w����
select  cid,count( sid) from sc group by cid

25.??�o��?�C???���I�w���w���a����
select s.sid,s.sname
from
(select sid,count(cid)
from sc
group by sid
having count(cid) =  2) as aa
inner join student01 as s
on aa.sid = s.sid

26.??�j���A�����l��
select sid,ssex,count(ssex)
from student01
group by ssex

27.??�������ܗL�u?�v���I�w���M��
select *
from student01
where sname like '%?%'
28.??���������w����?�C��??�����l��
select sid,sname,count(sname),count(ssex)
from student01
group by sname,ssex
having count(sname) >= 2
29.?? 1990 �N�o���I�w����?
select *
from student01 
where sage between '1990-01-01' and  '1990-12-31' 

30.?????���I���ϐ�?�C?�ʈ��ϐ�?�~���r��C���ϐ�?����?�C��?��?�������r��
select avg(score)as avg,cid,sid
from sc
group by cid
order by avg desc ,cid
31.??���ϐ�?�嘰���� 85 �I���L�w���I�w���A�����a���ϐ�?
select aa.sid,s.sname,aa.avg
from
(select sid,cid,avg(score) as avg
from sc
group by sid
having avg(score)>=85) as aa
left join student01 as s
on aa.sid = s.sid
32.???������?�u���w�v�C�������ᘰ 60 �I�w�������a����
select s.sid,s.sname,aa.cname,aa.score
from
(select sc.sid,sc.score,c.cname
from sc
inner join course as c
on sc.cid = c.cid
where cname = '���w' and score <  60) as aa
inner join student01 as s
on aa.sid = s.sid

33.??���L�w���I?���y������v�i���݊w���v��?�C�v??�I��v�j
select s.sid,s.sname,c.cname,sc.score
from student01 as s
left join sc
on s.sid = sc.sid
inner join course as c
on c.cid = sc.cid
34.??�C����??����?�� 70 ���ȏ�I�����A?�����̘a����
select s.sid,s.sname,c.cname,a.score
from
(select *
from sc
where score > 70) as a
inner join course as c
on c.cid = a.cid
inner join student01 as s
on s.sid = a.sid
35.??�s�y�i�I?��
select *
from sc
where score<=60
36.???��?��? 01 ��?����?�� 80 ���ȏ�I�w���I�w���a����
select s.sid,s.sname,a.score
from (select * from sc
where cid = '01' and score >=80) as a
inner join student01 as s
on a.sid = s.sid
37.��???���I�w���l��
select cid,count(sid)
from sc
group by cid

38.��?�s�d?�C???�C�u?�O�v�V?����?���I�w�����C��?�ō��I�w���M���y����?
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
where tname = '���O'

40.??�s��?����?�����I�w���I �w��?���A?��?���A�w����?
select count(score),
from sc
group by score



41.????����?�ōD�I�O?��
select 
from sc
group by cid
order by score limit 2



42.?????���I�w��?�C�l���i��? 5 �l�I?����??�j�B
SELECT SC.Cid, Course.Cname, COUNT(*)
FROM SC INNER JOIN Course
ON SC.Cid = Course.Cid
GROUP BY SC.Cid, Course.Cname
HAVING COUNT(SC.Cid) > 5;


43.?������?�C???���I�w���w��
select sid,count(cid)
from sc 
group by  sid
having count(cid) >= 2

44.???�C���S��?���I�w���M��
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

45.??�e�w���I�N?�C���N?���Z
select sid,sname,
(extract(year from now())-extract(year from sage)) as �N?
from student01

46.�Əo���������Z�C���O���� < �o���N���I����,?�N??��
SELECT Sid, Sname, Sage,
EXTRACT(YEAR FROM AGE(CURRENT_DATE, Sage)) 
FROM Student01

47.??�{��?�����I�w��
SELECT *
FROM Student01
WHERE EXTRACT curdate() = EXTRACT(WEEK FROM sage)

47.??�{��?�����I�w��
SELECT *
FROM Student01
WHERE EXTRACT(week from current_date)= EXTRACT(WEEK FROM sage)
48.??����?�����I�w��


SELECT *
FROM Student01 
WHERE (date_sub(now(),interval 7 day)) = EXTRACT(week from current_date)
49.??�{��?�����I�w��

SELECT *
FROM Student01
WHERE EXTRACT(month from current_date)= EXTRACT(month FROM sage)
50.??����?�����I�w��

SELECT *
FROM Student01
WHERE EXTRACT(month from current_date)+1= EXTRACT(month FROM sage)

49.??�{��?�����I�w��


44.???�C���S��?���I�w���M��
select s.sid,s.sname,aa.x
from student01 as s
inner join
(select sid,count(cid) as x
from sc
group by sid
having count(cid) = (select count(cid) from course)) as aa
on s.sid = aa.sid






