package com.youzan.pfcase.web.taskcase;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Task;
import com.youzan.pfcase.domain.UserDetails;
import com.youzan.pfcase.mapper.TaskcaseMapper;
import com.youzan.pfcase.service.AccountService;
import com.youzan.pfcase.service.TaskService;
import com.youzan.pfcase.web.task.TaskForm;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskDecorator;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by sunjun on 16/8/19.
 */
@Controller
@RequestMapping("taskcase")
public class TaskcaseController {

    @Autowired
    protected Mapper beanMapper;

    @Autowired
    protected AccountService accountService;

    @Autowired
    protected TaskService taskService;

    @Autowired
    protected TaskcaseMapper taskcaseMapper;



    //执行了case
    @RequestMapping("casedone")
    @ResponseBody
    public String casedone(@RequestParam("taskid") int taskid, @RequestParam("caseid") int caseid) {
        taskcaseMapper.updateCasedone(taskid, caseid);
        return taskid + "_" + caseid;
    }


    //评分 good
    @RequestMapping("goodcasescore")
    @ResponseBody
    public String goodCasescore(@RequestParam("taskid") int taskid, @RequestParam("caseid") int caseid) {
        taskcaseMapper.updateGoodCasescore(taskid, caseid);

        int taskCount = taskcaseMapper.getTaskCount(taskid);
        int taskDoneCount = taskcaseMapper.getTaskDoneCount(taskid);


        if (taskCount == taskDoneCount) {
            int taskGoodResultCount = taskcaseMapper.getTaskGoodResultCount(taskid);
            int taskscore = taskGoodResultCount * 100 / taskCount;
            taskService.updateTaskscore(taskid, taskscore);

            return taskid + "_" + caseid;
        }


        return taskid + "_" + caseid;
    }


    //评分 bad
    @RequestMapping("badcasescore")
    @ResponseBody
    public String badCasescore(@RequestParam("taskid") int taskid, @RequestParam("caseid") int caseid) {
        taskcaseMapper.updateBadCasescore(taskid, caseid);


        int taskCount = taskcaseMapper.getTaskCount(taskid);
        int taskDoneCount = taskcaseMapper.getTaskDoneCount(taskid);

        if (taskCount == taskDoneCount) {
            int taskGoodResultCount = taskcaseMapper.getTaskGoodResultCount(taskid);
            int taskscore = taskGoodResultCount * 100 / taskCount;
            taskService.updateTaskscore(taskid, taskscore);

            return taskid + "_" + caseid;
        }



        return taskid + "_" + caseid;
    }


    //添加 bugurl
    @RequestMapping("bugurl")
    @ResponseBody
    public String badCasescore(@RequestParam("taskid") int taskid, @RequestParam("caseid") int caseid, @RequestParam("bugurl") String bugurl) {
        taskcaseMapper.updateBugurl(taskid, caseid, bugurl);

        return taskid + "_" + caseid;
    }


}
