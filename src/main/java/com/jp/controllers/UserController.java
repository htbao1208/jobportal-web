/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.User;
import com.jp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


/**
 *
 * @author kid03
 */
@Controller
public class UserController {
    @Autowired
    private UserService userDetailsService;
    
    @GetMapping("/seeker-register")
    public String skregisterView(Model model){
        model.addAttribute("user", new User());
        return "seekerRegister";
    }
    
    @GetMapping("/seeker-login")
    public String sklogin(){
        return "seekerLogin";
    }
    
    @PostMapping("/seeker-register")
    public String skregister(Model model, @ModelAttribute(value = "user") User user){
        String errMsg = "";
        
        if(user.getPassword().equals(user.getConfirmPassword())){
            if(this.userDetailsService.addUser(user) == true)
                return "redirect:/seeker-login";
            else
                errMsg="Da co loi xay ra";
        } else
            errMsg= "Mat khau khong khop";   
        return "seeker-register";
    }   
}
