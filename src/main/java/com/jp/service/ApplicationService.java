/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service;

import com.jp.pojos.Application;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface ApplicationService {
    boolean addApplication(Application application);
    List<Application> getApplicationsByIdSeeker(int id,int page);
    long countApplied(int id);
    Application getApplicationById(int id);
    boolean deleteApplication(int id);
}
