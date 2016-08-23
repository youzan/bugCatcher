package com.youzan.pfcase.service;

import com.youzan.pfcase.domain.Caselist;
import com.youzan.pfcase.domain.Task;
import com.youzan.pfcase.mapper.CaselistMapper;
import com.youzan.pfcase.mapper.TaskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by sunjun on 16/8/12.
 */
@Service
public class TaskService {

    @Autowired
    private TaskMapper taskMapper;

    public List<Task> getAllTask() { return taskMapper.getAllTask(); }
    public List<Task> getUnpreparedTasks() { return taskMapper.getUnpreparedTasks(); }
    public Task getTaskByTaskid(int taskid) { return taskMapper.getTaskByTaskid(taskid);
    }

    public int getTaskscore(int taskid) { return taskMapper.getTaskscore(taskid);
    }


    @Transactional
    public void insertTask(Task task) {
        taskMapper.insertTask(task);
    }

    @Transactional
    public void updateTask(Task task) {
        taskMapper.updateTask(task);
    }

    @Transactional
    public void updateTaskPrepared(int taskid) {
        taskMapper.updateTaskPrepared(taskid);
    }

    public void updateTaskscore(int taskid, int taskscore) {
        taskMapper.updateTaskscore(taskid, taskscore);
    }


    public void delTask(int taskid, String modifier, Timestamp updatetime) {
        taskMapper.delTask(taskid, modifier, updatetime);
    }
}
