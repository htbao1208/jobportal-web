/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.jp.pojos.Career;
import com.jp.repository.CareerRepository;
import com.jp.service.CareerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class CareerServiceImpl implements CareerService{
    
    @Autowired
    private CareerRepository careerRepository;

    @Override
    public List<Career> getCareers() {
        return this.careerRepository.getCareers();
    }
    
}
