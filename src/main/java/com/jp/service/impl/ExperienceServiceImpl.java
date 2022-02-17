/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.Experience;
import com.jp.repository.ExperienceRepository;
import com.jp.service.ExperienceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class ExperienceServiceImpl implements ExperienceService{
    
    @Autowired
    private ExperienceRepository experienceRepository;

    @Override
    public boolean addExperience(Experience experience) {
        return this.experienceRepository.addExperience(experience);
    }

    @Override
    public List<Experience> getExperiencesBySeekerId(int id) {
        return this.experienceRepository.getExperiencesBySeekerId(id);
    }

    @Override
    public long countExp(int id) {
        return this.experienceRepository.countExp(id);
    }

    @Override
    public Experience getExperienceById(int id) {
        return this.experienceRepository.getExperienceById(id);
    }

    @Override
    public boolean deleteExperience(int id) {
        return this.experienceRepository.deleteExperience(id);
    }
    
}
