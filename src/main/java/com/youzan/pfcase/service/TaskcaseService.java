package com.youzan.pfcase.service;

import com.youzan.pfcase.domain.Caselist;
import com.youzan.pfcase.domain.Taskcase;
import com.youzan.pfcase.domain.Taskcases;
import com.youzan.pfcase.mapper.CaselistMapper;
import com.youzan.pfcase.mapper.TaskMapper;
import com.youzan.pfcase.mapper.TaskcaseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by sunjun on 16/8/16.
 */
@Service
public class TaskcaseService {

    @Autowired
    private TaskcaseMapper taskcaseMapper;

    @Autowired
    private TaskMapper taskMapper;

    public List<Taskcase> getAllTaskcase() { return taskcaseMapper.getAllTaskcase(); }



    @Transactional
    public void insertTaskcases(Taskcases taskcases) {
        taskcaseMapper.insertCaseids(taskcases.getCaseids());
        taskcaseMapper.updateTaskid(taskcases);
        taskMapper.updateTaskPrepared(taskcases.getTaskid());
    }


}



