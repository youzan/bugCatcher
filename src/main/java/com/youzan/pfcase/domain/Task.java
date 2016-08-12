package com.youzan.pfcase.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by sunjun on 16/8/12.
 */
public class Task implements Serializable {

    private static final long serialVersionUID = 4733800009305112630L;

    private int taskid;

    private String taskname;

    private String owner;

    private boolean taskdone;

    private int taskscore;

    private String creator;

    private String modifier;

    private Date createtime;

    private Date updatetime;

    public int getTaskid() {
        return taskid;
    }

    public void setTaskid(int taskid) {
        this.taskid = taskid;
    }

    public String getTaskname() {
        return taskname;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public boolean getTaskdone() {
        return taskdone;
    }

    public void setTaskdone(boolean taskdone) {
        this.taskdone = taskdone;
    }

    public int getTaskscore() {
        return taskscore;
    }

    public void setTaskscore(int taskscore) {
        this.taskscore = taskscore;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getModifier() {
        return modifier;
    }

    public void setModifier(String modifier) {
        this.modifier = modifier;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }


}
