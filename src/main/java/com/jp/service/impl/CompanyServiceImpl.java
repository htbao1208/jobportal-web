/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.jp.pojos.Company;
import com.jp.repository.CompanyRepository;
import com.jp.service.CompanyService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kid03
 */
@Service
public class CompanyServiceImpl implements CompanyService{
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public boolean addOrUpdate(Company company) {
        try {
            Map r = this.cloudinary.uploader().upload(company.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            
            company.setLogo((String) r.get("secure_url"));
        } catch (IOException ex) {
            System.err.println("Da co loi xay ra" + ex.getMessage());
        }
        return this.companyRepository.addOrUpdate(company);
    }

    @Override
    public Company getCompanyById(int id) {
        return this.companyRepository.getCompanyById(id);
    }

    @Override
    public List<Company> getCompanys(String kw, int page) {
        return this.companyRepository.getCompanys(kw, page);
    }

    @Override
    public List<Company> getCompByUserId(int id) {
        return this.companyRepository.getCompByUserId(id);
    }
    
}
