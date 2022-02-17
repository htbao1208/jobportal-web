/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository;

import com.jp.pojos.Seeker;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface SeekerRepository {
    boolean addOrUpdate(Seeker seeker);
    List<Seeker> getSeekers(String kw, int page);
    Seeker getSeekerById(int id);
    List<Seeker> getSeekerByUserId(int id);
    long countSeeker();
}
