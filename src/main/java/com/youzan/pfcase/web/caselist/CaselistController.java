package com.youzan.pfcase.web.caselist;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Caselist;
import com.youzan.pfcase.domain.Taskcases;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.service.CaselistService;
import com.youzan.pfcase.service.TaskService;
import com.youzan.pfcase.service.TaskcaseService;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.sql.Timestamp;
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

    @Autowired
    protected TaskcaseService taskcaseService;

    @Autowired
    protected TaskService taskService;

    @ModelAttribute
    public CaselistForm setUpForm() { return new CaselistForm(); }


    //
    @RequestMapping(value = "all", method = RequestMethod.GET)
    public String getAllCaselist(@ModelAttribute("taskcases") Taskcases taskcases, ModelMap model) {
        model.addAttribute("unpreparedTasks", taskService.getUnpreparedTasks());
        model.addAttribute("allCaselist", caselistService.getAllCaselist());
        model.addAttribute("active_allCase", true);

        return "caselist/AllCaselist";
    }

    @RequestMapping("newtaskcase")
    public String newTaskcase(Taskcases taskcases)
    {
        taskcaseService.insertTaskcases(taskcases);

        return "redirect:/my";
    }

    //
    @RequestMapping("newCaselistForm")
    public String newCaselistForm(ModelMap model) {
        model.addAttribute("active_newCase", true);
        model.addAttribute("belongmoduleas", caselistService.getBelongmoduleas());
        model.addAttribute("belongmodulebs", caselistService.getBelongmodulebs());
        model.addAttribute("belongmodulecs", caselistService.getBelongmodulecs());
        return "caselist/NewCaselistForm";
    }

    @RequestMapping("newCaselist")
    public String newCaselist(@Valid CaselistForm form, BindingResult result) {
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

        return "redirect:/caselist/all";
    }


    //
    @RequestMapping(value = "editCaselistForm", method = RequestMethod.GET)
    public String getCaselist(@RequestParam("caseid") int caseid, @RequestParam("action") String action, ModelMap model) {
        Caselist caselist = caselistService.getCaselist(caseid);
        model.addAttribute("caselist", caselist);
        model.addAttribute("action", action);
        if (action.equals("edit")) {
            model.addAttribute("belongmoduleas", caselistService.getBelongmoduleas());
            model.addAttribute("belongmodulebs", caselistService.getBelongmodulebs());
            model.addAttribute("belongmodulecs", caselistService.getBelongmodulecs());
        }

        return "caselist/EditCaselistForm";

    }

    @RequestMapping("editCaselist")
    public String editCaselist(@Valid @ModelAttribute("caselist") Caselist caselist, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("action", "edit");
            return "caselist/EditCaselistForm";
        }

        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        caselist.setModifier(account.getUsername());
        Timestamp timestamp = new Timestamp(new Date().getTime());
        caselist.setUpdatetime(timestamp);

        caselistService.updateCaselist(caselist);

        return "redirect:all";
    }


    //
    @RequestMapping("delCaselist")
    @ResponseBody
    public String delCaselist(@RequestParam("caseid") int caseid) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        String modifier = userDetails.getAccount().getUsername();
        Timestamp updatetime = new Timestamp(new Date().getTime());
        caselistService.delCaselist(caseid, modifier, updatetime);

        return Integer.toString(caseid);
    }

}