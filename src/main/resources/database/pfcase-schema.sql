
create table signon (
    username varchar(25) not null,
    password varchar(25)  not null,
    constraint pk_signon primary key (username)
);

create table account (
    userid varchar(80) not null,
    email varchar(80) not null,
    constraint pk_account primary key (userid)
);


