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
5.??½Ï¬?å°° 60 ªI¯wIw¶?aw¶©¼a½Ï¬?
select s.sid,s.sname,x.cid,x.avg
from
(select sid,cid,avg(score) as avg
from sc
group by sid
having avg(score) >= 60) as x
left join student01 as s
on s.sid=x.sid
6.??Ý SC \¶Ý¬?Iw¶M§
select s.sid, s.sname, s.sage, s.ssex,sc.cid,sc.score
from sc 
inner join student01 as s
on s.sid = sc.sid
7.??L¯wIw¶?Aw¶©¼A???AL?öI?¬?(v¬?I?¦? null )
7.1.?L¬?Iw¶M§
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
8.??uv©V?IÊ
select count(tname ) from teacher
where tname  like '%'
9.??w?u?OvV?ö?I¯wIM§
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
where tname = '£O') as bb
on s.sid = bb.sid
10.??vLwSL?öI¯wIM§
select s.sid,s.sname,s.sage,s.ssex
from student01 as s
inner join 
(select sid,count(cid)
from sc
group by sid
having count(cid) < (select count(cid) from course)) as aa
on s.sid = aa.sid
11.??­Lê??^w?h 01 gI¯ww¯I¯wIM§
/*???¢w¶w¹{??*/
select sid,count(cid),score
from sc
group by sid
/*01w¹?±? courseÌcid=scÌcid*/
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


12.??ah 01 gI¯ww?I?ö ®S¯I´¼¯wIM§
/* 
01?öI?C
?¢w¶w?I??ö*/
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


13.??vw?"?O"V??öICê??öIw¶©¼

select sid,sname
from student01 as s
where sid not in
(select sid from sc
join course 
on sc.cid=course.cid
join teacher 
on teacher.tid=course.tid
where  tname='£O')






******************
select sid
from sc
where sid not in (select cid
from
(select tid from teacher where  tname ='£O') as x
inner join course as c
on x.tid= c.tid)

14.????y´Èãsyi?öI¯wIwC©¼y´½Ï¬?
select s.sid,s.sname,z.avg
from
(select x.sid 
from (select *  from sc where score < 60) as x
group by sid
having count(cid) >= 2) as y
inner join 
(select sid,avg(score) as avg  /*½Ï_:*/
from sc
group by sid) as z
on y.sid = z.sid
inner join student01 as s
on s.sid = z.sid

select x.sid 
from (select *  from sc where score < 60) as x
group by sid
having count(cid) >= 2

15.?õh 01 "?öª¬° 60CÂª~rñIw¶M§
select *
from sc where score < 60 and cid = '01' 
order by score desc

16.Â½Ï¬?¸á?¦Lw¶IL?öI¬?Èy½Ï¬?
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

17.??eÈ¬?ÅªAÅáªa½ÏªF
È@º`®?¦F?ö IDC?ö nameCÅªCÅáªC½ÏªCyi¦C¦C?Ç¦C?G¦
yi?>=60C?F70-80C?Ç?F80-90C?G?F>=90
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


select t1.cid,(t2.cntb / t1.cnta) * 100 as yi¦, (t3.cntc / t1.cnta) *100 as ¦,(t4.cntd / t1.cnta) *100 as ?Ç¦,(t5.cnte / t1.cnta) *100 as ?G¦,
from (select  cid,count( sid)as cnta from sc group by cid)as t1
left join (select  cid,count(sid)as cntb from sc where score>=60 group by cid) as t2
on t1.cid = t2.cid 
left join (select cid,count(sid)as cntc from sc where score>=70 and score<80 group by cid) as t3
on t2.cid = t3.cid
left join (select cid,count(sid)as cntd from sc where score>=80 and score<90 group by cid) as t4
on t3.cid = t4.cid
left join (select cid,count(sid)as cnte from sc where score>=90 group by cid) as t5
on t4.cid = t5.cid




18.ÂeÈ¬??srCó?¦r¼C Score d??Û¯¼óã

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


19.ÂeÈ¬??srCó?¦r¼C Score d??ó¼

20.??w¶I?¬?Có?sr¼C?ªd??Û¯¼óã

21.??w¶I?¬?Có?sr¼C?ªd??sÛ¯¼óã

22.??eÈ¬?eªilF?ö?C?ö¼ÌC[100-85]C[85-70]C[70-60]C[60-0] yèSªä


23.??eÈ¬?OO¼I??

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

24.?????öí?CIw¶
select  cid,count( sid) from sc group by cid

25.??oü?C???öIw¶wa©¼
select s.sid,s.sname
from
(select sid,count(cid)
from sc
group by sid
having count(cid) =  2) as aa
inner join student01 as s
on aa.sid = s.sid

26.??j¶A¶l
select sid,ssex,count(ssex)
from student01
group by ssex

27.??¼ÜLu?vIw¶M§
select *
from student01
where sname like '%?%'
28.??¯¼¯«w¶¼?Có??¯¼l
select sid,sname,count(sname),count(ssex)
from student01
group by sname,ssex
having count(sname) >= 2
29.?? 1990 No¶Iw¶¼?
select *
from student01 
where sage between '1990-01-01' and  '1990-12-31' 

30.?????öI½Ï¬?C?ÊÂ½Ï¬?~rñC½Ï¬?¯?CÂ?ö?¡rñ
select avg(score)as avg,cid,sid
from sc
group by cid
order by avg desc ,cid
31.??½Ï¬?å°° 85 ILw¶IwA©¼a½Ï¬?
select aa.sid,s.sname,aa.avg
from
(select sid,cid,avg(score) as avg
from sc
group by sid
having avg(score)>=85) as aa
left join student01 as s
on aa.sid = s.sid
32.???ö¼Ì?uwvCªá° 60 Iw¶©¼aª
select s.sid,s.sname,aa.cname,aa.score
from
(select sc.sid,sc.score,c.cname
from sc
inner join course as c
on sc.cid = c.cid
where cname = 'w' and score <  60) as aa
inner join student01 as s
on aa.sid = s.sid

33.??Lw¶I?öyªîvi¶Ýw¶v¬?Cv??Iîvj
select s.sid,s.sname,c.cname,sc.score
from student01 as s
left join sc
on s.sid = sc.sid
inner join course as c
on c.cid = sc.cid
34.??C½ê??ö¬?Ý 70 ªÈãI©¼A?ö¼Ìaª
select s.sid,s.sname,c.cname,a.score
from
(select *
from sc
where score > 70) as a
inner join course as c
on c.cid = a.cid
inner join student01 as s
on s.sid = a.sid
35.??syiI?ö
select *
from sc
where score<=60
36.???ö?? 01 ?ö¬?Ý 80 ªÈãIw¶Iwa©¼
select s.sid,s.sname,a.score
from (select * from sc
where cid = '01' and score >=80) as a
inner join student01 as s
on a.sid = s.sid
37.???öIw¶l
select cid,count(sid)
from sc
group by cid

38.¬?sd?C???Cu?OvV?ö?öIw¶C¬?ÅIw¶M§y´¬?
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
where tname = '£O'

40.??s¯?ö¬?¯Iw¶I w¶?A?ö?Aw¶¬?
select count(score),
from sc
group by score



41.????÷¬?ÅDIO?¼
select 
from sc
group by cid
order by score limit 2



42.?????öIw¶?Cli´? 5 lI?öË??jB
SELECT SC.Cid, Course.Cname, COUNT(*)
FROM SC INNER JOIN Course
ON SC.Cid = Course.Cid
GROUP BY SC.Cid, Course.Cname
HAVING COUNT(SC.Cid) > 5;


43.?õ­?C???öIw¶w
select sid,count(cid)
from sc 
group by  sid
having count(cid) >= 2

44.???C¹S?öIw¶M§
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

45.??ew¶IN?CüÂN?Z
select sid,sname,
(extract(year from now())-extract(year from sage)) as N?
from student01

46.ÂÆo¶úúZCOú < o¶NIú,?N??ê
SELECT Sid, Sname, Sage,
EXTRACT(YEAR FROM AGE(CURRENT_DATE, Sage)) 
FROM Student01

47.??{ü?¶úIw¶
SELECT *
FROM Student01
WHERE EXTRACT curdate() = EXTRACT(WEEK FROM sage)

47.??{ü?¶úIw¶
SELECT *
FROM Student01
WHERE EXTRACT(week from current_date)= EXTRACT(WEEK FROM sage)
48.??ºü?¶úIw¶


SELECT *
FROM Student01 
WHERE (date_sub(now(),interval 7 day)) = EXTRACT(week from current_date)
49.??{?¶úIw¶

SELECT *
FROM Student01
WHERE EXTRACT(month from current_date)= EXTRACT(month FROM sage)
50.??º?¶úIw¶

SELECT *
FROM Student01
WHERE EXTRACT(month from current_date)+1= EXTRACT(month FROM sage)

49.??{?¶úIw¶


44.???C¹S?öIw¶M§
select s.sid,s.sname,aa.x
from student01 as s
inner join
(select sid,count(cid) as x
from sc
group by sid
having count(cid) = (select count(cid) from course)) as aa
on s.sid = aa.sid






