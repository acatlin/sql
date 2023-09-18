drop table if exists test;

create table test
(
	first_name varchar(30) NOT NULL,
	state_or_province varchar(30) NULL,
	country varchar(30) NOT NULL
);

insert into test 
  (first_name, state_or_province, country)
values
  ('Mapalo', 'Lusaka', 'Zambia');
  
insert into test 
  (first_name, country)
values
  ('Wei', 'Taiwan');
  

  
  

select * from test;