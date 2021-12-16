/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;



import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;



/**
 *
 * @author kid03
 */
@Controller
@ControllerAdvice
public class HomeController {    
    @RequestMapping("/")
    public String index(Model model){        
        return "index";
    }
    
    @RequestMapping("/joblist")
    public String joblist(){
        return "jobList";
    }
    @RequestMapping("/job/jobdetail")
    public String jobdetail(){
        return "jobDetail";
    }
    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {        
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
    }

}
