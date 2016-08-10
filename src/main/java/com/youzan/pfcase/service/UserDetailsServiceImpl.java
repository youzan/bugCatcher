package com.youzan.pfcase.service;

import com.youzan.pfcase.domain.Account;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {
    @Inject
    protected AccountService accountService;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountService.getAccount(username);
        if (account == null) {
            throw new UsernameNotFoundException(username + " is not found.");
        }

        return new com.youzan.pfcase.domain.UserDetails(account);
    }

}
