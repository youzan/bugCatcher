package com.youzan.pfcase.service;

import com.youzan.pfcase.domain.Task;
import com.youzan.pfcase.mapper.TaskMapper;
import com.youzan.pfcase.domain.Rank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by sunjun on 16/8/12.
 */
@Service
public class TaskService {

    @Autowired
    private TaskMapper taskMapper;

    public List<Task> getAllTask() { return taskMapper.getAllTask(); }
    public List<Task> getAllTaskByUsername(String username) { return taskMapper.getAllTaskByUsername(username); }
    public List<Task> getUnpreparedTasks() { return taskMapper.getUnpreparedTasks(); }
    public Task getTaskByTaskid(int taskid) { return taskMapper.getTaskByTaskid(taskid);
    }

    public int getTaskscore(int taskid) { return taskMapper.getTaskscore(taskid);
    }

    public List<Task> getAllDoneTask() { return taskMapper.getAllDoneTask(); }
    public List<Task> getAllDoneTaskByUsername(String username) { return taskMapper.getAllDoneTaskByUsername(username); }

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

    //
    @Transactional
    public void insertRank(Rank rankForm) {
        taskMapper.insertRank(rankForm);
    }

    public List<Map<String, String>> getTotalScores() { return taskMapper.getTotalScores(); }
//    public List<Map<String, String>> getExeTimes() { return taskMapper.getExeTimes(); }

}
