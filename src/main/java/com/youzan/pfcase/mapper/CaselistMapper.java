package com.youzan.pfcase.mapper;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Caselist;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by sunjun on 16/8/12.
 */
@Repository
public interface CaselistMapper {
    List<Caselist> getAllCaselist();

    Caselist getCaselist(int caseid);

    List<String> getBelongmoduleas();
    List<String> getBelongmodulebs();
    List<String> getBelongmodulecs();


    void insertCaselist(Caselist caselist);

    void updateCaselist(Caselist caselist);






    void delCaselist(@Param("caseid") int caseid, @Param("modifier") String modifier, @Param("updatetime") Timestamp updatetime);



}
