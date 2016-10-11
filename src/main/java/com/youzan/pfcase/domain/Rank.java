package com.youzan.pfcase.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by sunjun on 16/8/12.
 */
public class Rank implements Serializable {

    private static final long serialVersionUID = -8778629730397420091L;

    @NotNull
    @Size(min = 1, max = 25)
    private String taskname;

    @NotNull
    @Size(min = 1, max = 25)
    private String owner;

    @NotNull
    private int score;

    @NotNull
    private String reason;

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

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}

