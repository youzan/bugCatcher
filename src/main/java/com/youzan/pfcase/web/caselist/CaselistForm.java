package com.youzan.pfcase.web.caselist;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by sunjun on 16/8/12.
 */
public class CaselistForm {

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

    public String getCasename() {
        return casename;
    }

    public void setCasename(String casename) {
        this.casename = casename;
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

    public boolean getReviewed() {
        return reviewed;
    }

    public void setReviewed(boolean reviewed) {
        this.reviewed = reviewed;
    }

    public boolean getAutomated() {
        return automated;
    }

    public void setAutomated(boolean automated) {
        this.automated = automated;
    }

}
