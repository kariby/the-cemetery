create table gorod (
	id INT NOT NULL AUTO_INCREMENT,
	city_name TEXT,
	region_id INT,
	naselenie INT,
	PRIMARY KEY (id)
);

insert into gorod values ('1', 'Чебоксары', '1', '400000'), 
                         ('2', 'Йошкар-Ола', '3', '300000'),
                         ('3', 'Казань', '2', '1200000'),
                         ('4', 'Нижний Новгород', '4', '1400000'),
                         ('5', 'Канаш', '1', '58000'),
                         ('6', 'Новочебоксарск', '1', null);

create table region (
	id INT NOT NULL AUTO_INCREMENT,
	region_name TEXT,
	PRIMARY KEY (id)
);

insert into region values ('1', 'Чувашская Республика'),
                          ('2', 'Республика Татарстан'),
                          ('3', 'Республика Марий Эл'),
                          ('4', 'Нижегородская область');

#1
select city_name as 'Город', naselenie as 'Население' from gorod
join region r on region_id = r.id
where region_name = 'Чувашская Республика'
order by naselenie asc;
#2
select count(city_name) as 'Количество городов, для которых не указана численность населения' from gorod
where naselenie is null;
#3
select city_name as 'Город с наибольшим количеством населения' from gorod
where naselenie = (select max(naselenie) from gorod);
#4
delete from gorod where naselenie < 400000;
select * from gorod;
#5
update gorod
join region r on region_id = r.id
set naselenie = 200000
where r.region_name = 'Чувашская республика';
select * from gorod;
#6
select city_name as 'Города на букву К' from gorod
where city_name like 'К%';
#7
select region_name as 'Регион', count(*) as 'Количество городов в регионе'
from region r
join gorod on r.id = region_id
group by r.region_name desc;
