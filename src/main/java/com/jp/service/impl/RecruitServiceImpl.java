/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.Recruit;
import com.jp.repository.RecruitRepository;
import com.jp.service.RecruitService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class RecruitServiceImpl implements RecruitService{
    
    @Autowired
    private RecruitRepository recruitRepository;
    
    @Override
    public boolean addRecruit(Recruit recruit) {
        return this.recruitRepository.addRecruit(recruit);
    }

    @Override
    public List<Recruit> getRecruitsByIdCompany(int id, int page) {
        return this.recruitRepository.getRecruitsByIdCompany(id, page);
    }

    @Override
    public long countRecruit(int id) {
        return this.recruitRepository.countRecruit(id);
    }

    @Override
    public Recruit getRecruitById(int id) {
        return this.recruitRepository.getRecruitById(id);
    }

    @Override
    public boolean deleteRecruit(int id) {
        return this.recruitRepository.deleteRecruit(id);
    }
    
}
