package com.youzan.pfcase.web.caselist;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Caselist;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.service.CaselistService;
import com.youzan.pfcase.web.account.AccountForm;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.DatabaseMetaData;
import java.util.Date;

/**
 * Created by sunjun on 16/8/12.
 */
@Controller
@RequestMapping("caselist")
public class CaselistController {

    @Autowired
    protected Mapper beanMapper;

    @Autowired
    protected CaselistService caselistService;

    @RequestMapping(method = RequestMethod.GET)
    public String getAllCaselist(ModelMap model) {
        model.addAttribute("allCaselist", caselistService.getAllCaselist());
        model.addAttribute("case1name", caselistService.getAllCaselist().get(0).getCasename());
        model.addAttribute("case1auto", caselistService.getAllCaselist().get(0).getAutomated());
        model.addAttribute("case2name", caselistService.getAllCaselist().get(1).getCasename());
        model.addAttribute("case2auto", caselistService.getAllCaselist().get(1).getAutomated());
        return "caselist/AllCaselist";
    }



    @ModelAttribute
    public CaselistForm setUpForm() {
        return new CaselistForm();
    }

    @RequestMapping("newCaselistForm")
    public String newCaselistForm() {
        return "caselist/NewCaselistForm";
    }

    @RequestMapping("newCaselist")
    public String newAccount(CaselistForm form, BindingResult result) {
        if (result.hasErrors()) {
            return "caselist/NewCaselistForm";
        }
        Caselist caselist = beanMapper.map(form, Caselist.class);
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        caselist.setCreator(account.getUsername());
        caselist.setModifier(account.getUsername());
//        Date date = new Date();
//        caselist.setCreatetime(date);
//        caselist.setUpdatetime(date);

        caselistService.insertCaselist(caselist);

        return "redirect:/";
    }


}
