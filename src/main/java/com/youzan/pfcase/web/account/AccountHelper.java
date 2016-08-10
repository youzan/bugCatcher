package com.youzan.pfcase.web.account;

import java.util.List;

import javax.inject.Inject;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.service.AccountService;

import org.dozer.Mapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class AccountHelper {

    @Inject
    protected Mapper beanMapper;

    @Inject
    protected AccountService accountService;


    public void newAccount(com.youzan.pfcase.web.account.AccountForm form) {
        Account account = beanMapper.map(form, Account.class);
        accountService.insertAccount(account);
    }

    public void editAccount(com.youzan.pfcase.web.account.AccountForm form) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();

        // does not map "username" to use that of session object
        beanMapper.map(form, account, "accountExcludeUsername");
        accountService.updateAccount(account);

        // reflect new value to session object
        beanMapper.map(accountService.getAccount(account.getUsername()),
                account);

    }
}
