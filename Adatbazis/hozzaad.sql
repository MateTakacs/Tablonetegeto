create database tabloadatok;
use tabloadatok;

create table felhasznalok (
	fnev varchar(10) primary key,
	jelszo varchar(40)
);
insert into felhasznalok (fnev, jelszo) values ('a', sha1('1'));

create table tablok(
	id INTEGER primary key, 
	kezdet smallint, 
	veg smallint, 
	osztaly tinyint, 
	helye tinyint, 
	keppng VARCHAR(50), 
	kepjpg VARCHAR(50), 
	eng BOOLEAN, 
	van BOOLEAN, 
	torol BOOLEAN, 
	idobelyeg TIMESTAMP
);

create table diakok(
	id integer primary key auto_increment, 
	vnev varchar(50), 
	knev varchar(50), 
	mappa varchar(30), 
	keppng varchar(50), 
	kepjpg varchar(50), 
	eng BOOLEAN, 
	van BOOLEAN, 
	torol BOOLEAN, 
	idobelyeg TIMESTAMP, 
	tabid INTEGER, foreign key (tabid) references tablok(id)
);

create table tanarok(
	id INTEGER primary key auto_increment, 
	vnev VARCHAR(50), 
	knev VARCHAR(50), 
	eng BOOLEAN, 
	torol BOOLEAN, 
	idobelyeg TIMESTAMP
);

create table tanarkepek(
	id INTEGER PRIMARY key auto_increment, 
	beosztas varchar(30), 
	mappa varchar(35), 
	keppng VARCHAR(50), 
	kepjpg varchar(50), 
	eng BOOLEAN, 
	van BOOLEAN, 
	torol BOOLEAN, 
	idobelyeg TIMESTAMP, 
	tanarid INTEGER, 
	tabid INTEGER, 
	FOREIGN key (tanarid) REFERENCES tanarok(id), 
	FOREIGN key (tabid) REFERENCES tablok(id)
);
