/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository;

import com.jp.pojos.Education;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface EducationRepository {
    boolean addEducation (Education education);
    List<Education> getEducationsBySeekerId(int id);
    long countEdu(int id);
    Education getEducationById(int id);
    boolean deleteEducation(int id);
}
