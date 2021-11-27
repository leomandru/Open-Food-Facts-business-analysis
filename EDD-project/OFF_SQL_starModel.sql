drop table if exists OFF_items_facts;
drop table if exists OFF_versions_facts;
drop table if exists OFF_dim_date;
drop table if exists OFF_dim_category;

create table OFF_dim_date
(
	TECH_KEY_DATE int auto_increment not null,
	day int,
	month int,
	year int,
	primary key (TECH_KEY_DATE)
);

create table OFF_dim_category
(
	TECH_KEY_CAT int auto_increment not null,
	version bigint(8) not null,
	barcode bigint(20) not null,
	pnns_1 varchar(254) COLLATE latin1_general_cs not null,
	pnns_2 varchar(254) COLLATE latin1_general_cs not null,
	primary key (TECH_KEY_CAT)
);

create table OFF_items_facts
(
	SEQ_KEY_CAT int,
	SEQ_KEY_CDATE int,
	nutr_score int,
	pseudo varchar(254) COLLATE latin1_general_cs NOT NULL,
	KEY FK_DIM_CAT (SEQ_KEY_CAT)
);

create table OFF_versions_facts
(
	SEQ_KEY_CAT int,
	SEQ_KEY_CDATE int,
	SEQ_KEY_MDATE int,
	nutr_score int,
	is_create int,
	KEY FK_DIM_CAT (SEQ_KEY_CAT),
	KEY FK_DIM_CDATE (SEQ_KEY_CDATE),
	KEY FK_DIM_MDATE (SEQ_KEY_MDATE)
);