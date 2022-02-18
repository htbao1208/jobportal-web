/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.validator;

import com.jp.pojos.User;
import java.util.Set;
import javax.validation.ConstraintViolation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author kid03
 */
@Component
public class UserValidator implements Validator{
    
    @Autowired
    private Validator beanValidator;
    
    @Override
    public boolean supports(Class<?> type) {
        return User.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User u = (User) target;
        if(u.getUsername().isEmpty() || u.getUsername() == null)
            errors.rejectValue("username", "user.errNull");
        if(!u.getPassword().equals(u.getConfirmPassword()))
            errors.rejectValue("confirmPassword", "user.errPass");
    }
    
}
