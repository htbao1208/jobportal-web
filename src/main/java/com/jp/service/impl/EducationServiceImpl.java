/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.Education;
import com.jp.repository.EducationRepository;
import com.jp.service.EducationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class EducationServiceImpl implements EducationService{
    
    @Autowired
    private EducationRepository educationRepository;

    @Override
    public boolean addEducation(Education education) {
        return this.educationRepository.addEducation(education);
    }

    @Override
    public List<Education> getEducationsBySeekerId(int id) {
        return this.educationRepository.getEducationsBySeekerId(id);
    }

    @Override
    public long countEdu(int id) {
        return this.educationRepository.countEdu(id);
    }

    @Override
    public Education getEducationById(int id) {
        return this.educationRepository.getEducationById(id);
    }

    @Override
    public boolean deleteEducation(int id) {
        return this.educationRepository.deleteEducation(id);
    }
    
}
