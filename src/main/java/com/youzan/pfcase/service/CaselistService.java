package com.youzan.pfcase.service;

import com.youzan.pfcase.domain.Caselist;
import com.youzan.pfcase.mapper.CaselistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by sunjun on 16/8/12.
 */
@Service
public class CaselistService {

    @Autowired
    private CaselistMapper caselistMapper;

    public List<Caselist> getAllCaselist() { return caselistMapper.getAllCaselist(); }


    public Caselist getCaselist(int caseid) { return caselistMapper.getCaselist(caseid); }

    public List<String> getBelongmoduleas() { return caselistMapper.getBelongmoduleas(); };
    public List<String> getBelongmodulebs() { return caselistMapper.getBelongmodulebs(); };
    public List<String> getBelongmodulecs() { return caselistMapper.getBelongmodulecs(); };



    @Transactional
    public void insertCaselist(Caselist caselist) {
        caselistMapper.insertCaselist(caselist);
    }

    @Transactional
    public void updateCaselist(Caselist caselist) {
        caselistMapper.updateCaselist(caselist);
    }


    @Transactional
    public void delCaselist(int caseid, String modifier, Timestamp updatetime) {
        caselistMapper.delCaselist(caseid, modifier, updatetime);
    }

}
