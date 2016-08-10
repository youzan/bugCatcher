package com.youzan.pfcase.mapper;

import com.youzan.pfcase.domain.Account;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * Created by sunjun on 16/8/2.
 */
@Repository
public interface AccountMapper {

    Account getAccountByUsername(String username);

    Account getAccountByUsernameAndPassword(String username, String password);

    void insertAccount(Account account);

    void updateAccount(Account account);

    void insertSignon(Account account);

    void updateSignon(Account account);
}
