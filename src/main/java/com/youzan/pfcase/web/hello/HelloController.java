package com.youzan.pfcase.web.hello;

import javax.inject.Inject;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HelloController {

	@Inject
	protected AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		Account account = accountService.getAccount("admin");
		model.addAttribute("message", account.getPassword());
//		model.addAttribute("message", "Niefeng.");
		return "hello";
	}
}