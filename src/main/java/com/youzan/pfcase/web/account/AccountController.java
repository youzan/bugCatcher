package com.youzan.pfcase.web.account;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@Controller
@RequestMapping("account")
public class AccountController {

    private static final List<String> LANGUAGE_LIST;

    private static final List<String> CATEGORY_LIST;

    @Inject
    protected Mapper beanMapper;

    @Inject
    protected AccountHelper accountHelper;

    @Inject
    protected PasswordEqualsValidator passwordEqualsValidator;

    static {
        List<String> langList = new ArrayList<String>();
        langList.add("english");
        langList.add("japanese");
        LANGUAGE_LIST = Collections.unmodifiableList(langList);

        List<String> catList = new ArrayList<String>();
        catList.add("FISH");
        catList.add("DOGS");
        catList.add("REPTILES");
        catList.add("CATS");
        catList.add("BIRDS");
        CATEGORY_LIST = Collections.unmodifiableList(catList);
    }

    @InitBinder("accountForm")
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(passwordEqualsValidator);
    }

    @ModelAttribute("languageList")
    public List<String> getLanguageList() {
        return LANGUAGE_LIST;
    }

    @ModelAttribute("categoryList")
    public List<String> getCategoryList() {
        return CATEGORY_LIST;
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
    public String newAccount(
            @Validated({ NewAccount.class, Default.class }) AccountForm form,
            BindingResult result) {
        if (result.hasErrors()) {
            return "account/NewAccountForm";
        }
        accountHelper.newAccount(form);
        return "redirect:/account/signonForm";
    }

    @RequestMapping("editAccountForm")
    public String editAccountForm(AccountForm form) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        beanMapper.map(account, form);
        form.setPassword("");
        return "account/EditAccountForm";
    }

    @RequestMapping("editAccount")
    public String editAccount(
            @Validated({ EditAccount.class, Default.class }) AccountForm form,
            BindingResult result) {
        if (result.hasErrors()) {
            UserDetails userDetails = (UserDetails) SecurityContextHolder
                    .getContext().getAuthentication().getPrincipal();
            form.setUsername(userDetails.getUsername());
            return "account/EditAccountForm";
        }
        accountHelper.editAccount(form);
        return "redirect:/account/editAccountForm";
    }
}
