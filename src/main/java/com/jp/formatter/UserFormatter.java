/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.formatter;

import com.jp.pojos.User;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author kid03
 */
public class UserFormatter implements Formatter<User>{

    @Override
    public String print(User t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public User parse(String string, Locale locale) throws ParseException {
        User user = new User();
        user.setId(Integer.parseInt(string));        
        return user;
    }
    
}
