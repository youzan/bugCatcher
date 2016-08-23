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

    @Autowired
    protected TaskService taskService;

    @ModelAttribute
    public CaselistForm setUpForm() { return new CaselistForm(); }





    //1. 查看所有用例 2. 为某任务分配用例
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






    //新建case
    @RequestMapping("newCaselistForm")
    public String newCaselistForm(ModelMap model) {
        model.addAttribute("active_newCase", true);
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

        return "redirect:/caselist/all";
    }








    //查看/编辑case
    @RequestMapping(value = "editCaselistForm", method = RequestMethod.GET)
    public String getCaselist(@RequestParam("caseid") int caseid, @RequestParam("action") String action, ModelMap model) {
        Caselist caselist = caselistService.getCaselist(caseid);
        model.addAttribute("caselist", caselist);
        model.addAttribute("action", action);


        return "caselist/EditCaselistForm";

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






//TODO:删除改为deleted标记
    //删除case
    @RequestMapping("delCaselist")
    @ResponseBody
    public String delCaselist(@RequestParam("caseid") int caseid) {
        caselistService.delCaselist(caseid);

        return Integer.toString(caseid);
    }





}