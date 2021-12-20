create table "user"(
                       userid char(10) primary key,
                       referrer char(10),
                       foreign key (referrer) references "user" (userid) on delete set null on update cascade);
create table "data_center"(
                              name varchar(20) primary key,
                              street varchar(20) not null,
                              number integer not null,
                              city varchar(20) not null,
                              capacity integer not null check (capacity <10000));
create table data_manager(
                             data_center varchar(20) not null,
                             userid char(10),
                             mngrid char(10) primary key,
                             foreign key(userid) references "user"(userid) on delete cascade on update cascade,
                             foreign key(data_center) references "data_center"(name) on delete cascade on update cascade);
create table role(
                     role_id char (10) primary key,
                     name varchar(20) not null,
                     mngrid char(10),
                     foreign key(mngrid) references data_manager(mngrid) on delete cascade on update cascade
);
create table "server"(
                         serverid char(10) primary key,
                         name varchar(20) not null,
                         hardwaremodel varchar(20) not null,
                         data_center varchar(20) not null,
                         foreign key (data_center) references "data_center"(name) on delete cascade on update cascade);
create table "server_process"(
                                 processid char(10)  not null,
                                 serverid char(10) not null,
                                 primary key (processid,serverid),
                                 foreign key (serverid) references "server" (serverid));
create table "database"(
                           serverid char(10) primary key references "server" on delete cascade,
                           type varchar(20) not null,
                           diskspace int not null);
create table vm(
                   serverid char(10) primary key references "server" on delete cascade,
                   memory int not null,
                   cpu varchar(20) not null,
                   userid char(10),
                   foreign key (userid) references "user" (userid) on delete set null on update cascade);

insert into "user"(userid) values('3243554236');
insert into "user" values('a2f355dd36','3243554236');
insert into "user" values('i2f35agd36','a2f355dd36');
insert into "user" values('qy75agd361','a2f355dd36');
insert into "data_center" values('Database1','Street1','1','Oslo','500');
insert into "data_center" values('Database2','Street2','2','London','800');
insert into "data_center" values('Database3','Street3','3','Moscow','999');
insert into "data_center" values('Database4','Street4','4','Oslo','900');
insert into data_manager values('Database1','3243554236','3243554236');
insert into data_manager values('Database2','a2f355dd36','a2f355dd36');
insert into data_manager values('Database3','qy75agd361','qy75agd361');
insert into role values('1111111111','admin','3243554236');
insert into role values('2222222222','pm','a2f355dd36');
insert into role values('3333333333','developer','qy75agd361');
insert into "server" values ('4fg890yt56','server1','model1','Database1');
insert into "server" values ('4fg8780pl6','server2','model2','Database2');
insert into "server" values ('afg140yt56','server3','model3','Database3');
insert into "server" values ('123140yt56','server4','model4','Database1');
insert into "server_process" values ('fg45dg7w6j','4fg890yt56');
insert into "server_process" values ('12g8780pl6','4fg8780pl6');
insert into "server_process" values ('cv45df56jk','afg140yt56');
insert into "database" values ('4fg890yt56','commercial','600');
insert into "database" values ('4fg8780pl6','commercial','1000');
insert into "database" values ('afg140yt56','personnal','800');
insert into "database" values ('123140yt56','personnal','700');
insert into vm values ('4fg890yt56','16','Intel Core','3243554236');
insert into vm values ('4fg8780pl6','8','Intel Celeron','a2f355dd36');
insert into vm values ('afg140yt56','512','AMD','a2f355dd36');
