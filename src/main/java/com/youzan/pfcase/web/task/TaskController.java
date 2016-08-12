package com.youzan.pfcase.web.task;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Task;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.service.TaskService;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by sunjun on 16/8/12.
 */
@Controller
@RequestMapping("task")
public class TaskController {

    @Autowired
    protected Mapper beanMapper;

    @Autowired
    protected TaskService taskService;

    @RequestMapping(method = RequestMethod.GET)
    public String getAllTask(ModelMap model) {
        model.addAttribute("alltask", taskService.getAllTask());
        return "task/AllTask";
    }


    @ModelAttribute
    public TaskForm setUpForm() {
        return new TaskForm();
    }


//TODO: RequestMapping全部改成小写


    @RequestMapping("newTaskForm")
    public String newTaskForm() {
        return "task/NewTaskForm";
    }

    @RequestMapping("newTask")
    public String newTask(TaskForm form, BindingResult result) {
        if (result.hasErrors()) {
            return "task/NewTaskForm";
        }
        Task task = beanMapper.map(form, Task.class);
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Account account = userDetails.getAccount();
        task.setCreator(account.getUsername());
        task.setModifier(account.getUsername());
//        Date date = new Date();
//        task.setCreatetime(date);
//        task.setUpdatetime(date);

        taskService.insertTask(task);

        return "redirect:/";
    }


}
