package com.youzan.pfcase.web.task;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by sunjun on 16/8/12.
 */
public class TaskForm {

    private String taskname;

    private String owner;

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

}



