/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.formatter;

import com.jp.pojos.Job;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author kid03
 */
public class JobFormatter implements Formatter<Job>{

    @Override
    public String print(Job t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Job parse(String string, Locale locale) throws ParseException {
        Job job = new Job();
        job.setId(Integer.parseInt(string));
        return job;
    }
    
}
