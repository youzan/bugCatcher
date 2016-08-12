package com.youzan.pfcase.web.task;

import com.youzan.pfcase.web.account.AccountForm;
import com.youzan.pfcase.web.account.AccountHelper;
import com.youzan.pfcase.web.account.PasswordEqualsValidator;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.web.account.AccountForm.EditAccount;
import com.youzan.pfcase.web.account.AccountForm.NewAccount;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
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
 * Created by sunjun on 16/8/12.
 */
@Controller
@RequestMapping("task")
public class TaskController {

    @Autowired
    protected AccountHelper accountHelper;

    @RequestMapping("newtask")
    public String newAccount(AccountForm form, BindingResult result) {
        if (result.hasErrors()) {
            return "account/NewAccountForm";
        }
        accountHelper.newAccount(form);
        return "redirect:/account/signonForm";
    }
}

