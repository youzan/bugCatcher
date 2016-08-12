package com.youzan.pfcase.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by sunjun on 16/8/12.
 */
public class Caselist implements Serializable {

    private static final long serialVersionUID = -972786808689136607L;

    private int caseid;

    private String casename;

    private String belongmodulea;

    private String belongmoduleb;

    private String belongmodulec;

    private int priority;

    private String casestep;

    private boolean reviewed;

    private boolean automated;

    private String creator;

    private String modifier;

    private Date createtime;

    private Date updatetime;


    public String getCasename() {
        return casename;
    }

    public void setCasename(String casename) {
        this.casename = casename;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getBelongmodulea() {
        return belongmodulea;
    }

    public void setBelongmodulea(String belongmodulea) {
        this.belongmodulea = belongmodulea;
    }

    public String getBelongmoduleb() {
        return belongmoduleb;
    }

    public void setBelongmoduleb(String belongmoduleb) {
        this.belongmoduleb = belongmoduleb;
    }

    public String getBelongmodulec() {
        return belongmodulec;
    }

    public void setBelongmodulec(String belongmodulec) {
        this.belongmodulec = belongmodulec;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public String getCasestep() {
        return casestep;
    }

    public void setCasestep(String casestep) {
        this.casestep = casestep;
    }

    public boolean getReviewed() { return reviewed; }

    public void setReviewed(boolean reviewed) {
        this.reviewed = reviewed;
    }

    public boolean getAutomated() {
        return automated;
    }

    public void setAutomated(boolean automated) {
        this.automated = automated;
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
