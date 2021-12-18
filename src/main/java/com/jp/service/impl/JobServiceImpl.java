/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.Job;
import com.jp.repository.JobRepository;
import com.jp.service.JobService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class JobServiceImpl implements JobService{
    @Autowired
    private JobRepository jobRepository;

    @Override
    public boolean addJob(Job job) {
        return this.jobRepository.addJob(job);
    }

    @Override
    public List<Job> listJobs(String kw, int page) {
        return this.jobRepository.listJobs(kw, page);
    }

    @Override
    public long countPost() {
        return this.jobRepository.countPost();
    }

    @Override
    public Job getJobById(int i) {
        return this.jobRepository.getJobById(i);
    }
    
}
