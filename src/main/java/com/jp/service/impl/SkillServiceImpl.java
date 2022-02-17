/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.Skill;
import com.jp.repository.SkillRepository;
import com.jp.service.SkillService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class SkillServiceImpl implements SkillService{
    
    @Autowired
    private SkillRepository skillRepository;
    
    @Override
    public boolean addSkill(Skill skill) {
        return this.skillRepository.addSkill(skill);
    }

    @Override
    public List<Skill> getSkillsBySeekerId(int id) {
        return this.skillRepository.getSkillsBySeekerId(id);
    }

    @Override
    public long countSkill(int id) {
        return this.skillRepository.countSkill(id);
    }

    @Override
    public Skill getSkillById(int id) {
        return this.skillRepository.getSkillById(id);
    }

    @Override
    public boolean deleteSkill(int id) {
        return this.skillRepository.deleteSkill(id);
    }
    
}
