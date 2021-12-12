/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author kid03
 */
@Controller
@ControllerAdvice
public class HomeController {
    @RequestMapping("/")
    public String index(){
        return "index";
    }
    @RequestMapping("/seeker-register")
    public String skregister(){
        return "seekerRegister";
    }
    @RequestMapping("/seeker-login")
    public String sklogin(){
        return "seekerLogin";
    }
    @RequestMapping("/joblist")
    public String joblist(){
        return "jobList";
    }
    @RequestMapping("/job/jobdetail")
    public String jobdetail(){
        return "jobDetail";
    }
}
