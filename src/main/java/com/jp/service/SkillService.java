/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service;

import com.jp.pojos.Skill;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface SkillService {
    boolean addSkill (Skill skill);
    List<Skill> getSkillsBySeekerId(int id);
    long countSkill(int id);
    Skill getSkillById(int id);
    boolean deleteSkill(int id);
}
