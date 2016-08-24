package com.youzan.pfcase.web.taskcase;

import com.youzan.pfcase.mapper.TaskcaseMapper;
import com.youzan.pfcase.service.AccountService;
import com.youzan.pfcase.service.TaskService;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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


    //
    @RequestMapping("casedone")
    @ResponseBody
    public String casedone(@RequestParam("taskid") int taskid, @RequestParam("caseid") int caseid) {
        taskcaseMapper.updateCasedone(taskid, caseid);
        return taskid + "_" + caseid;
    }

    //
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


    //
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


    //
    @RequestMapping("bugurl")
    @ResponseBody
    public String badCasescore(@RequestParam("taskid") int taskid, @RequestParam("caseid") int caseid, @RequestParam("bugurl") String bugurl) {
        taskcaseMapper.updateBugurl(taskid, caseid, bugurl);

        return taskid + "_" + caseid;
    }

}
