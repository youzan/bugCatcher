
# INSERT INTO signon VALUES('j2ee','j2ee');
# INSERT INTO signon VALUES('ACID','ACID');
#
# INSERT INTO account VALUES('j2ee','yourname@yourdomain.com');
# INSERT INTO account VALUES('ACID','acid@yourdomain.com');

INSERT INTO
  caselist(caseid, casename, belongmodulea, belongmoduleb, belongmodulec, priority, casestep, creator, modifier)
VALUES
  (1, 'casename1', '一级模块名', '二级模块名', '三级模块名', 3, '用例步骤啦啦啦', 'sunjun', 'sunjun');


INSERT INTO
  task(taskid, taskname, owner, creator, modifier)
VALUES
  (1, 'taskname1', 'jack', 'sunjun', 'sunjun');

INSERT INTO
  taskcase(taskid, caseid)
VALUES
  (1, 1);






commit
