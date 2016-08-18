package com.youzan.pfcase.domain;

import java.io.Serializable;

/**
 * Created by sunjun on 16/8/12.
 */
public class Taskcase implements Serializable {

    private static final long serialVersionUID = -7798973576203053896L;

    private int taskid;

    private int caseid;

    private boolean casedone;

    private boolean evaluated;

    private boolean casescore;

    private String bugurl;

    public int getTaskid() {
        return taskid;
    }

    public void setTaskid(int taskid) {
        this.taskid = taskid;
    }

    public int getCaseid() {
        return caseid;
    }

    public void setCaseid(int caseid) {
        this.caseid = caseid;
    }

    public boolean getCasedone() {
        return casedone;
    }

    public void setCasedone(boolean casedone) {
        this.casedone = casedone;
    }

    public boolean getEvaluated() {
        return evaluated;
    }

    public void setEvaluated(boolean evaluated) {
        this.evaluated = evaluated;
    }

    public boolean getCasescore() {
        return casescore;
    }

    public void setCasescore(boolean casescore) {
        this.casescore = casescore;
    }

    public String getBugurl() {
        return bugurl;
    }

    public void setBugurl(String bugurl) {
        this.bugurl = bugurl;
    }
}
