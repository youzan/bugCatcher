package com.youzan.pfcase.mapper;

import com.youzan.pfcase.domain.Caselist;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sunjun on 16/8/12.
 */
@Repository
public interface TaskcaseMapper {

    void insertCaseids(List<Integer> caseids);


}
