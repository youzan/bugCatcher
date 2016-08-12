
# create table signon (
#     username varchar(25) not null,
#     password varchar(25)  not null,
#     constraint pk_signon primary key (username)
# );
#
# create table account (
#     userid varchar(80) not null,
#     email varchar(80) not null,
#     constraint pk_account primary key (userid)
# );


create table caselist (
    caseid int not null auto_increment,
    casename varchar(50) not null comment '用例名称',
    belongmodulea varchar(25) not null comment '所属一级功能模块名',
    belongmoduleb varchar(25) not null comment '所属二级功能模块名',
    belongmodulec varchar(25) not null comment '所属三级功能模块名',
    priority TINYINT not null comment '用例等级',
    casestep TEXT not null comment '用例步骤',
    reviewed TINYINT not null DEFAULT 0 comment '已评审?',
    automated TINYINT not null DEFAULT 0 comment '已自动化?',
    creator varchar(25) not null comment '创建人',
    modifier varchar(25) not null comment '修改人',
    createtime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updatetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',

    constraint pk_caseid primary key (caseid),
    key `idx_belongmodule` (`belongmodulea`, `belongmoduleb`, `belongmodulec`),
    key `idx_priority` (`priority`)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用例表';


create table task (
    taskid int not null auto_increment,
    taskname varchar(25) not null comment '任务名称',
    owner varchar(25) not null comment '任务执行人',
    taskdone TINYINT not null DEFAULT 0 comment '全部用例已执行完成?(auto generated)',
    taskscore TINYINT not null DEFAULT 0 comment '任务执行质量平均分(auto generated)',
    creator varchar(25) not null comment '创建人',
    modifier varchar(25) not null comment '修改人',
    createtime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updatetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',

    constraint pk_taskid primary key (taskid),
    key `idx_owner` (`owner`),
    key `idx_taskdone` (`taskdone`)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='任务表';


create table taskcase (
    taskid int not null comment '任务id',
    caseid int not null comment '用例id',
    casedone TINYINT not null DEFAULT 0 comment '某用例已执行完成?',
    casescore TINYINT not null DEFAULT 0 comment '用例执行质量评分',
    bugurl varchar(255) not null DEFAULT '' comment 'Bug URL',

    constraint pk_taskidcaseid primary key (taskid, caseid),
    key `idx_taskid`(`taskid`),
    key `idx_taskid_casescore`(`taskid`, `casescore`)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='任务用例关系表';

