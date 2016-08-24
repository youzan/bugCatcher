package com.youzan.pfcase.web.account;

import com.youzan.pfcase.service.AccountService;
import com.youzan.pfcase.web.account.AccountForm.NewAccount;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.groups.Default;



/**
 * Created by sunjun on 16/8/8.
 */
@Controller
@RequestMapping("account")
public class AccountController {

    @Autowired
    protected Mapper beanMapper;

    @Autowired
    protected AccountHelper accountHelper;

    @Autowired
    protected AccountService accountService;

    @Autowired
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
    public String newAccount(@Validated({ NewAccount.class, Default.class }) AccountForm form, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "account/NewAccountForm";
        }
        if (accountService.getAccount(form.getUsername()) != null) {
            model.addAttribute("duplicatedUsers", "用户名已存在");
            return "account/NewAccountForm";
        }
        accountHelper.newAccount(form);
        return "redirect:/account/signonForm";
    }

}
