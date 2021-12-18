/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service;

import com.jp.pojos.Job;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface JobService {
    boolean addJob(Job job);
    List<Job> listJobs(String kw, int page);
    long countPost();
    Job getJobById(int i);
}
