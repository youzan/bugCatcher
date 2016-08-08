create table account (
  userid int unsigned not null auto_increment primary key,
  username varchar(25) not null,
  password varchar(25) not null,
  permission int unsigned not null,
  index (permission)
);
