package com.youzan.pfcase.domain;

import java.io.Serializable;
import java.util.List;

/**
 * Created by sunjun on 16/8/16.
 */
public class Taskcases implements Serializable {
    private static final long serialVersionUID = -3698878968126968360L;

    private int taskid;

    private List<Integer> caseids;


    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getTaskid() {
        return taskid;
    }

    public void setTaskid(int taskid) {
        this.taskid = taskid;
    }

    public List<Integer> getCaseids() {
        return caseids;
    }

    public void setCaseids(List<Integer> caseids) {
        this.caseids = caseids;
    }

}
