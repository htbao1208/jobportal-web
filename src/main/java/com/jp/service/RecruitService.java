/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service;

import com.jp.pojos.Recruit;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface RecruitService {
    boolean addRecruit(Recruit recruit);
    List<Recruit> getRecruitsByIdCompany(int id,int page);
    long countRecruit(int id);
    Recruit getRecruitById(int id);
    boolean deleteRecruit (int id);
}
