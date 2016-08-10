package com.youzan.pfcase.web.account;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.web.account.AccountForm.EditAccount;
import com.youzan.pfcase.web.account.AccountForm.NewAccount;
import org.dozer.Mapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.validation.groups.Default;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;



/**
 * Created by sunjun on 16/8/8.
 */
@Controller
@RequestMapping("account")
public class AccountController {

    @Inject
    protected Mapper beanMapper;

    @Inject
    protected AccountHelper accountHelper;

    @Inject
    protected PasswordEqualsValidator passwordEqualsValidator;

    @InitBinder("accountForm")
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(passwordEqualsValidator);
    }

    @ModelAttribute
    public AccountForm setUpForm() {
        return new AccountForm();
    }

    @RequestMapping("signonForm")
    public String signonForm() {
        return "account/SignonForm";
    }

    @RequestMapping("newAccountForm")
    public String newAccountForm() {
        return "account/NewAccountForm";
    }

    @RequestMapping("newAccount")
    public String newAccount(AccountForm form, BindingResult result) {
        if (result.hasErrors()) {
            return "account/NewAccountForm";
        }
        accountHelper.newAccount(form);
        return "redirect:/account/signonForm";
    }

}
