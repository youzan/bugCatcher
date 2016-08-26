INSERT INTO signon VALUES('admin','docker');

INSERT INTO account VALUES('admin','sunjun@youzan.com','admin');

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