package com.youzan.pfcase.web.task;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Task;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.service.AccountService;
import com.youzan.pfcase.service.TaskService;
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
@RequestMapping("task")
public class TaskController {

    @Autowired
    protected Mapper beanMapper;

    @Autowired
    protected AccountService accountService;

    @Autowired
    protected TaskService taskService;

    @ModelAttribute
    public TaskForm setUpForm() {
        return new TaskForm();
    }


    //
    @RequestMapping("newTaskForm")
    public String newTaskForm(ModelMap model) {
        model.addAttribute("KFAccounts", accountService.getAllKFAccount());
        model.addAttribute("active_newTask", true);

        return "task/NewTaskForm";
    }

    @RequestMapping("newTask")
    public String newTask(@Valid TaskForm form, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("KFAccounts", accountService.getAllKFAccount());
            return "task/NewTaskForm";
        }

        Task task = beanMapper.map(form, Task.class);
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        task.setCreator(account.getUsername());
        task.setModifier(account.getUsername());
        taskService.insertTask(task);

        return "redirect:/my";
    }


    //
    @RequestMapping(value = "editTaskForm", method = RequestMethod.GET)
    public String getCaselist(@RequestParam("taskid") int taskid, @RequestParam("action") String action, ModelMap model) {
        Task task = taskService.getTaskByTaskid(taskid);
        model.addAttribute("task", task);
        model.addAttribute("action", action);
        model.addAttribute("KFAccounts", accountService.getAllKFAccount());

        return "task/EditTaskForm";

    }

    @RequestMapping("editTask")
    public String editTask(@Valid @ModelAttribute("task") Task task, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("KFAccounts", accountService.getAllKFAccount());
            return "task/EditTaskForm";
        }

        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        task.setModifier(account.getUsername());
        Timestamp timestamp = new Timestamp(new Date().getTime());
        task.setUpdatetime(timestamp);
        taskService.updateTask(task);

        return "redirect:/my";
    }



    //
    @RequestMapping("delTask")
    @ResponseBody
    public String delTask(@RequestParam("taskid") int taskid) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        String modifier = userDetails.getAccount().getUsername();
        Timestamp updatetime = new Timestamp(new Date().getTime());
        taskService.delTask(taskid, modifier, updatetime);

        return Integer.toString(taskid);
    }



    //
    @RequestMapping("taskscore")
    @ResponseBody
    public String getTaskscore(@RequestParam("taskid") int taskid) {
        int taskscore = taskService.getTaskscore(taskid);

        return Integer.toString(taskscore);
    }


}
