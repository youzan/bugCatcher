package com.youzan.pfcase.web.account;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class AccountForm {
    public static interface NewAccount {

    }

    public static interface EditAccount {

    }

    @NotNull(groups = NewAccount.class)
    @Null(groups = EditAccount.class)
    @Size(min = 1, max = 25)
    private String username;

    @NotNull
    @Size.List({ @Size(min = 1, max = 25, groups = NewAccount.class),
            @Size(min = 0, max = 25, groups = EditAccount.class) })
    private String password;

    @NotNull
    @Size.List({ @Size(min = 1, max = 25, groups = NewAccount.class),
            @Size(min = 0, max = 25, groups = EditAccount.class) })
    private String repeatedPassword;


    @NotNull
    @Size(min = 1, max = 80)
    @Email
    private String email;

    @NotNull
    private String role;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepeatedPassword() {
        return repeatedPassword;
    }

    public void setRepeatedPassword(String repeatedPassword) {
        this.repeatedPassword = repeatedPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() { return role; }

    public void setRole(String role) { this.role = role; }

}
