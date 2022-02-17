/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository;

import com.jp.pojos.CV;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface CVRepository {
    boolean addCV(CV cv);
    List<CV> getCvs(String kw, int page);
    List<CV> getCVsBySeekerId (int id, int page);
    CV getCVById (int id);
    boolean deleteCV (int id);
    long countCV(int id);
    long countCV();
}
