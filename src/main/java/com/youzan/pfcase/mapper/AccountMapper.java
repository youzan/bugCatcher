package com.youzan.pfcase.mapper;

import com.youzan.pfcase.domain.Account;

/**
 * Created by sunjun on 16/8/2.
 */
public interface AccountMapper {

    Account getAccountByUsername(String username);

    Account getAccountByUsernameAndPassword(String username, String password);

    void insertAccount(Account account);

    void insertProfile(Account account);

    void insertSignon(Account account);

    void updateAccount(Account account);

    void updateProfile(Account account);

    void updateSignon(Account account);

}
