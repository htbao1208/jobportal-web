/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.Seeker;
import com.jp.repository.SeekerRepository;
import com.jp.service.SeekerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class SeekerServiceImpl implements SeekerService{
    @Autowired
    private SeekerRepository seekerRepository;

    @Override
    public boolean addOrUpdate(Seeker seeker) {
        return this.seekerRepository.addOrUpdate(seeker);
    }

    @Override
    public List<Seeker> getSeekers(String kw, int page) {
        return this.seekerRepository.getSeekers(kw, page);
    }

    @Override
    public Seeker getSeekerById(int id) {
        return this.seekerRepository.getSeekerById(id);
    }

    @Override
    public List<Seeker> getSeekerByUserId(int id) {
        return this.seekerRepository.getSeekerByUserId(id);
    }
    @Override
    public long countSeeker() {
        return this.seekerRepository.countSeeker();
    }
    
}
