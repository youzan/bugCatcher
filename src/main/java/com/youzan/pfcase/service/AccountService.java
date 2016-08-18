package com.youzan.pfcase.service;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by sunjun on 16/8/2.
 */
@Service
public class AccountService {

    @Autowired
    private AccountMapper accountMapper;
    

    
    public Account getAccount(String username) {
        return accountMapper.getAccountByUsername(username);
    }
    public List<Account> getAllKFAccount() {
        return accountMapper.getAllKFAccount();
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.account.AccountService#getAccount(java.lang.String, java.lang.String)
     */
    
    public Account getAccount(String username, String password) {
        return accountMapper.getAccountByUsernameAndPassword(username, password);
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.account.AccountService#insertAccount(ik.am.jpetstore.domain.model.Account)
     */

    @Transactional
    public void insertAccount(Account account) {
        accountMapper.insertAccount(account);
        accountMapper.insertSignon(account);
    }

    /*
     * (non-Javadoc)
     * @see ik.am.jpetstore.domain.service.account.AccountService#updateAccount(ik.am.jpetstore.domain.model.Account)
     */

    @Transactional
    public void updateAccount(Account account) {
        accountMapper.updateAccount(account);

        if (account.getPassword() != null && account.getPassword().length() > 0) {
            accountMapper.updateSignon(account);
        }
    }

}
