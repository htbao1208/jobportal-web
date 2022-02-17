/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.CV;
import com.jp.repository.CVRepository;
import com.jp.service.CVService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class CVServiceImpl implements CVService{
    @Autowired
    private CVRepository cVRepository;

    @Override
    public boolean addCV(CV cv) {
        return this.cVRepository.addCV(cv);
    }

    @Override
    public List<CV> getCvs(String kw, int page) {
        return this.cVRepository.getCvs(kw, page);
    }

    @Override
    public List<CV> getCVsBySeekerId(int id, int page) {
        return this.cVRepository.getCVsBySeekerId(id, page);
    }

    @Override
    public CV getCVById(int id) {
        return this.cVRepository.getCVById(id);
    }

    @Override
    public boolean deleteCV(int id) {
        return this.cVRepository.deleteCV(id);
    }

    @Override
    public long countCV(int i) {
        return this.cVRepository.countCV(i);
    }

    @Override
    public long countCV() {
        return this.cVRepository.countCV();
    }
    
}
