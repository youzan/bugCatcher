package com.youzan.pfcase.mapper;

import com.youzan.pfcase.domain.Caselist;
import com.youzan.pfcase.domain.Taskcase;
import com.youzan.pfcase.domain.Taskcases;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sunjun on 16/8/12.
 */
@Repository
public interface TaskcaseMapper {

    List<Taskcase> getAllTaskcase();

    void insertCaseids(List<Integer> caseids);

    void updateTaskid(Taskcases taskcases);


}
