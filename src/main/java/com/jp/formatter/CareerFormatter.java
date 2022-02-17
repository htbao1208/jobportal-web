/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.formatter;

import com.jp.pojos.Career;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author kid03
 */
public class CareerFormatter implements Formatter<Career>{

    @Override
    public String print(Career t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Career parse(String string, Locale locale) throws ParseException {
        Career career = new Career();
        career.setId(Integer.parseInt(string));
        return career;
    }
    
}
