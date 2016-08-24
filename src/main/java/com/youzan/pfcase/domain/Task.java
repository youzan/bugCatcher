package com.youzan.pfcase.domain;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by sunjun on 16/8/12.
 */
public class Task implements Serializable {

    private static final long serialVersionUID = 4733800009305112630L;

    @NotNull
    @Min(1)
    private int taskid;

    @NotNull
    @Size(min = 1, max = 25)
    private String taskname;

    private boolean prepared;

    @NotNull
    @Size(min = 1, max = 25)
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

    public boolean getPrepared() {
        return prepared;
    }

    public void setPrepared(boolean prepared) {
        this.prepared = prepared;
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
