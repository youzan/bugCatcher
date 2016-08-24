package com.youzan.pfcase.domain;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.sql.Timestamp;

/**
 * Created by sunjun on 16/8/12.
 */
public class Caselist implements Serializable {

    private static final long serialVersionUID = -972786808689136607L;

    @NotNull
    @Min(1)
    private int caseid;

    @NotNull
    @Size(min = 1, max = 50)
    private String casename;

    @NotNull
    @Size(min = 1, max = 25)
    private String belongmodulea;

    @NotNull
    @Size(min = 1, max = 25)
    private String belongmoduleb;

    @NotNull
    @Size(min = 1, max = 25)
    private String belongmodulec;

    @NotNull
    private int priority;

    @NotNull
    private String casestep;

    @NotNull
    private boolean reviewed;

    @NotNull
    private boolean automated;

    private String creator;

    private String modifier;

    private Timestamp createtime;

    private Timestamp updatetime;

    public int getCaseid() {
        return caseid;
    }

    public void setCaseid(int caseid) {
        this.caseid = caseid;
    }

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

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Timestamp getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Timestamp updatetime) {
        this.updatetime = updatetime;
    }

}
