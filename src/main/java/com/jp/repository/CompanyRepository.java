/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository;

import com.jp.pojos.Company;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface CompanyRepository {
    boolean addOrUpdate(Company comp);
    List<Company> getCompanys(String kw, int page);
    Company getCompanyById(int id);
}
