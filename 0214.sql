select sname from student01 where sname like'李%'
select sname from student limit 2
select top 5 * from student
select * from sc where cid in ('01','02')
select * from sc where sid in ('')
select * from sc where score like '%[123]'
select * from student where sname like '李%'
select * from student01 where sname in ('李%')
select * from sc where score between 80 and 60
select sid as id, s.sname from student01 as s
select s.sid, s.sname,s.sage, s.ssex, c.cname, sc.score
from student01 as s, sc, course as c
where s.sid = sc.sid
and sc.cid = c.cid

select  s.sid, s.sname,s.sage, s.ssex, c.cname, sc.score
from student01 as s
inner join sc
on s.sid = sc.sid
inner join course as c
on sc.cid = c.cid

ALTER TABLE user
change column name 
name varCHAR(100) NULL

ALTER TABLE user
drop Constraints  name varCHAR(100) not NULL

create table li(id int not null unique,
lastname varchar(255) not null,
city varchar(255))
INSERT INTO li (id,lastname,city)VALUES (1,'李','beijing')
INSERT INTO li (id,lastname,city)VALUES (2,'wang','shanghai');
INSERT INTO li (id,lastname,city)VALUES (3,'zhao','shenzhen')
update li set id=5  where id = 1 
delete from li where id = 5
select  id from li limit 1
select top1 * from li
insert into li values (4,'yuan','anhui') 
select * from li where  lastname between 'wang' and 'zhao'
select * from li where lastname rlike '[wy]%'
alter table li
alter city set default 'sandnes'
create index index_idp on li (id)
select avg(score) as avgs from sc
select count(*) from student01
select max(score) from sc where cid=(select cid from course where cname ='数学')

select min(score) from sc 
inner join course as c
on sc.cid = c.cid
where c.cname ='数学'

select sum(score) from sc 
inner join course as c
on sc.cid = c.cid
where c.cname ='語文'

select sid,avg(score) as avgs from sc
group by sid
having avg(score) >= 60

select now() from teacher

select count(ssex),ssex from student01
group by ssex

CREATE TABLE sample(
  id INT(11) NOT NULL AUTO_INCREMENT,
  value INT(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);
INSERT INTO sample(value)
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

CREATE TABLE users(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  age INT(3),
  PRIMARY KEY (id)
);

CREATE TABLE product(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  price INT(11),
  PRIMARY KEY (id)
);

CREATE TABLE purchase(
  id INT(11) NOT NULL AUTO_INCREMENT,
  pur_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  user_id INT(11),
  product_id INT(11),
  PRIMARY KEY (id)
);
INSERT INTO users(name,age)
SELECT
  CONCAT('NAME' , @rownum := @rownum + 1),33
FROM
  sample AS s1,
  sample AS s2,
  sample AS s3,
  sample AS s4,
  (SELECT @rownum := 0) AS v
  INSERT INTO purchase(user_id,product_id)
SELECT
   (@rownum := @rownum + 1),(@rownum := @rownum + 1)
FROM
  sample AS s1,
  sample AS s2,
  sample AS s3,
  sample AS s4,
  (SELECT @rownum := 0) AS v
  
  SELECT *
FROM users
WHERE EXISTS (SELECT user_id FROM purchase WHERE users.id = purchase.user_id)
SELECT *
FROM users
WHERE id IN (SELECT user_id FROM purchase)

CREATE TABLE family (
 id varchar(6) PRIMARY KEY,
 name VARCHAR(10) NOT NULL,
 gender VARCHAR(2) NOT NULL,
 age INTEGER NOT NULL
);

insert into family values('1','田中','F','10');
insert into family values('2','木村','M','18');
insert into family values('3','黒田','M','25');

select family.id ,family.name as お名前,
case 
    when age >= '18' then '成年'
    when age < '18' then '未成年'
    end 成年区分
from family















