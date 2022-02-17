/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service;

import com.jp.pojos.Experience;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface ExperienceService {
    boolean addExperience (Experience experience);
    List<Experience> getExperiencesBySeekerId(int id);
    long countExp(int id);
    Experience getExperienceById(int id);
    boolean deleteExperience(int id);
}
