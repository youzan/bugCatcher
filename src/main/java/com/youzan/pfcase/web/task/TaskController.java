package com.youzan.pfcase.web.task;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Rank;
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
import java.util.*;

/**
 * Created by sunjun on 16/8/12.
 */
@Controller
@RequestMapping("task")
public class TaskController {
    private List<Task> chartTasks;

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
            model.addAttribute("active_newTask", true);

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


    //
    @RequestMapping(value = "chart", method = RequestMethod.GET)
    public String getCaselist(ModelMap model) {
        model.addAttribute("active_chart", true);
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        String username = userDetails.getAccount().getUsername();
        String role = userDetails.getAccount().getRole();
        if (role.equals("kf")) {
            chartTasks = taskService.getAllDoneTaskByUsername(username);
        } else {
            chartTasks = taskService.getAllDoneTask();
        }

        Map<String, Integer> chartMap = new LinkedHashMap<>();
        List<String> backgroundColor = new ArrayList<>();
        List<String> borderColor = new ArrayList<>();
        for (Task task : chartTasks) {
            chartMap.put("'" + task.getTaskname() + "'", task.getTaskscore());
            backgroundColor.add("'rgba(54, 162, 235, 0.2)'");
            borderColor.add("'rgba(54, 162, 235, 1)'");
        }
        model.addAttribute("chartMap", chartMap);
        model.addAttribute("backgroundColor", backgroundColor);
        model.addAttribute("borderColor", borderColor);

        return "task/Chart";

    }

    //
    @RequestMapping("rankForm")
    public String rankForm(@ModelAttribute("rank") Rank rank, ModelMap model) {
        model.addAttribute("KFAccounts", accountService.getAllKFAccount());
        model.addAttribute("active_rank", true);
        model.addAttribute("totalScores", taskService.getTotalScores());
//        model.addAttribute("exeTimes", taskService.getExeTimes());

        return "task/RankForm";
    }

    @RequestMapping("rank")
    public String rank(@Valid @ModelAttribute("rank") Rank rank, BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            model.addAttribute("KFAccounts", accountService.getAllKFAccount());
            model.addAttribute("active_rank", true);
            model.addAttribute("totalScores", taskService.getTotalScores());

            return "task/RankForm";
        }

        taskService.insertRank(rank);

        return "redirect:/task/rankForm";
    }

}


