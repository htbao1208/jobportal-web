/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.formatter;

import com.jp.pojos.Company;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author kid03
 */
public class CompanyFormatter implements Formatter<Company>{

    @Override
    public String print(Company t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Company parse(String string, Locale locale) throws ParseException {
        Company comp = new Company();
        comp.setId(Integer.parseInt(string));        
        return comp;
    }    
}
