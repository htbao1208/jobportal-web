/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.Application;
import com.jp.repository.ApplicationReposiroty;
import com.jp.service.ApplicationService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class ApplicationServiceImpl implements ApplicationService{
    @Autowired
    private ApplicationReposiroty applicationReposiroty;

    @Override
    public boolean addApplication(Application application) {
        long millis=System.currentTimeMillis();
        Date date = new Date(millis);
        application.setAppliedDate(date);
        return this.applicationReposiroty.addApplication(application);
    }

    @Override
    public List<Application> getApplicationsByIdSeeker(int id,int page) {
        return this.applicationReposiroty.getApplicationsByIdSeeker(id,page);
    }

    @Override
    public long countApplied(int id) {
        return this.applicationReposiroty.countApplied(id);
    }

    @Override
    public Application getApplicationById(int id) {
        return this.applicationReposiroty.getApplicationById(id);
    }

    @Override
    public boolean deleteApplication(int id) {
        return this.applicationReposiroty.deleteApplication(id);
    }
    
}
