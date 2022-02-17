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
    public String skRegisterView(Model model){
        model.addAttribute("user", new User());
        return "seekerRegister";
    }
    
    @GetMapping("/login")
    public String skLogin(){
        return "seekerLogin";
    }
    
    @PostMapping("/seeker-register")
    public String skRegister(Model model, @ModelAttribute(value = "user") User user){
        String errMsg = "";
        user.setUserRole(User.SEEKER);
        if(user.getPassword().equals(user.getConfirmPassword())){
            if(this.userDetailsService.addUser(user) == true)
                return "redirect:/login";
            else
                errMsg="Da co loi xay ra";
        } else
            errMsg= "Mat khau khong khop";   
        return "seeker-register";
    }   
    @GetMapping("/comp-register")
    public String compRegisterView(Model model){
        model.addAttribute("user", new User());
        return "compRegister";
    }  
    
    @PostMapping("/comp-register")
    public String compRegister(Model model, @ModelAttribute(value = "user") User user){
        String errMsg = "";
        user.setUserRole(User.COMPANY);
        if(user.getPassword().equals(user.getConfirmPassword())){
            if(this.userDetailsService.addUser(user) == true)
                return "redirect:/login";
            else
                errMsg="Da co loi xay ra";
        } else
            errMsg= "Mat khau khong khop";   
        return "compRegister";
    }  
}
