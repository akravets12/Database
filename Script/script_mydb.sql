-- mydb clear
delete from mydb.profile where id > 0;	
alter table mydb.profile auto_increment = 1;
delete from mydb.type_metadata where id > 0;	
alter table mydb.type_metadata auto_increment = 1;
delete from mydb.type_action where id > 0;	
alter table mydb.type_action auto_increment = 1;
delete from mydb.metadata where id > 0;	
alter table mydb.metadata auto_increment = 1;
delete from mydb.dataset where id > 0;	
alter table mydb.dataset auto_increment = 1;
delete from mydb.action where id > 0;	
alter table mydb.action auto_increment = 1;

-- mydb insert
insert into mydb.profile values (1, 'name1','log1', 'pass1' ),
    (2, 'name2','log2', 'pass2' ),
    (3, 'name3','log3', 'pass3' );

insert into mydb.type_metadata values (1, 'type1',true,true,'typename1'),
    (2, 'type2',true,false,'typename2'),
    (3, 'type1',false,true,'typename3');

insert into mydb.type_action values (1, 'value1'),
    (2, 'value2'),
    (3, 'value3');

insert into mydb.metadata values (1,'value1',1),
    (2,'value2', 2),
    (3, 'value3', 3);

insert into mydb.action values (1, now(),1,1),
    (2, now(),2,2),
    (3, now(),3,3);

insert into mydb.dataset values (1, 'dataset1','comment1', 1, 1 ),
    (2, 'dataset2','comment2', 2, 2 ),
    (3, 'dataset3','comment3', 3, 3 );
    
 -- mydb select
select * from mydb.profile;
select * from mydb.type_metadata;
select * from mydb.type_action;
select * from mydb.metadata;
select * from mydb.dataset;
select * from mydb.action;

select * from mydb.dataset
	 join mydb.metadata on (mydb.metadata.id =mydb.dataset.id) 
     join mydb.type_metadata on (mydb.type_metadata.id =mydb.metadata.id)
     join mydb.action on (mydb.action.id =mydb.type_metadata.id)
     join mydb.type_action on (mydb.type_action.id =mydb.action.id)
     join mydb.profile on (mydb.profile.id = mydb.type_action.id);