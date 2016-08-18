package com.youzan.pfcase.mapper;

import com.youzan.pfcase.domain.Account;
import com.youzan.pfcase.domain.Caselist;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sunjun on 16/8/12.
 */
@Repository
public interface CaselistMapper {
    List<Caselist> getAllCaselist();

    Caselist getCaselist(int caseid);


    void insertCaselist(Caselist caselist);

    void updateCaselist(Caselist caselist);






    void delCaselist(int caseid);






}
