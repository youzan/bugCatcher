package com.youzan.pfcase.service;

import com.youzan.pfcase.domain.Caselist;
import com.youzan.pfcase.mapper.CaselistMapper;
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

    @Transactional
    public void insertCaseids(List<Integer> caseids) {
        taskcaseMapper.insertCaseids(caseids);
    }


}



