package com.youzan.pfcase.mapper;

import com.youzan.pfcase.domain.Task;
import com.youzan.pfcase.domain.Task;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by sunjun on 16/8/12.
 */
@Repository
public interface TaskMapper {

    List<Task> getAllTask();
    List<Task> getAllTaskByUsername(@Param("username") String username);
    List<Task> getUnpreparedTasks();
    Task getTaskByTaskid(int taskid);
    int getTaskscore(@Param("taskid") int taskid);


    void insertTask(Task task);

    void updateTask(Task task);


    void updateTaskPrepared(int taskid);


    void updateTaskscore(@Param("taskid") int taskid, @Param("taskscore") int taskscore);


    void delTask(@Param("taskid") int taskid, @Param("modifier") String modifier, @Param("updatetime") Timestamp updatetime);


}
