package com.youzan.pfcase.web.caselist;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Caselist;
import com.youzan.pfcase.domain.Taskcases;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.service.CaselistService;
import com.youzan.pfcase.service.TaskcaseService;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.sql.Timestamp;

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

    @Autowired
    protected TaskcaseService taskcaseService;

    @ModelAttribute
    public CaselistForm setUpForm() { return new CaselistForm(); }






    @RequestMapping(value = "all", method = RequestMethod.GET)
    public String getAllCaselist(@ModelAttribute("taskcases") Taskcases taskcases, ModelMap model) {
        model.addAttribute("allCaselist", caselistService.getAllCaselist());

        return "caselist/AllCaselist";
    }

    @RequestMapping("newtaskcase")
    public String newTaskcase(Taskcases taskcases)
    {
        taskcaseService.insertTaskcases(taskcases);

        return "redirect:/";
    }


    @RequestMapping("newCaselistForm")
    public String newCaselistForm() {
        return "caselist/NewCaselistForm";
    }

    @RequestMapping("newCaselist")
    public String newCaselist(CaselistForm form, BindingResult result) {
        if (result.hasErrors()) {
            return "caselist/NewCaselistForm";
        }
        Caselist caselist = beanMapper.map(form, Caselist.class);
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        caselist.setCreator(account.getUsername());
        caselist.setModifier(account.getUsername());

        caselistService.insertCaselist(caselist);

        return "redirect:/";
    }

    @RequestMapping("editCaselist")
    public String editCaselist(@ModelAttribute("caselist") Caselist caselist, BindingResult result) {
//        if (result.hasErrors()) {
//            return "caselist/NewCaselistForm";
//        }
//        Caselist caselist = beanMapper.map(form, Caselist.class);


        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        caselist.setModifier(account.getUsername());

        Timestamp timestamp = new Timestamp(new Date().getTime());
        caselist.setUpdatetime(timestamp);

        caselistService.updateCaselist(caselist);

        return "redirect:all";
    }


    @RequestMapping(value = "editCaselistForm", method = RequestMethod.GET)
    public String getCaselist(@RequestParam("caseid") int caseid, @RequestParam("action") String action, ModelMap model) {
        Caselist caselist = caselistService.getCaselist(caseid);
        model.addAttribute("caselist", caselist);
        model.addAttribute("action", action);


        return "caselist/EditCaselistForm";

    }


    @RequestMapping("delCaselist")  //post
    public String delCaselist(@RequestParam("caseid") int caseid) {
        caselistService.delCaselist(caseid);

        return "caselist/all";

    }






}
