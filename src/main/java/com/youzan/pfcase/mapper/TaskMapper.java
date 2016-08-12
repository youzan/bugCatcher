package com.youzan.pfcase.mapper;

import com.youzan.pfcase.domain.Task;
import com.youzan.pfcase.domain.Task;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sunjun on 16/8/12.
 */
@Repository
public interface TaskMapper {

    List<Task> getAllTask();


    void insertTask(Task task);

    void updateTask(Task task);
}
