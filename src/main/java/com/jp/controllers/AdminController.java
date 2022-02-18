/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.service.StatsService;
import com.jp.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author kid03
 */
@Controller
public class AdminController {
    
    @Autowired
    private StatsService statsService;
    @Autowired
    private UserService userService;
    
    @GetMapping("/admin/main")
    public String view(Model model){
        model.addAttribute("users", this.userService.getUsers(""));
        return "mainAdmin";
    }
    
    @GetMapping("/admin/careerStats")
    public String viewStats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException{
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Date fromDate = null;
        String fd = params.getOrDefault("fromDate", null);
        if(fd != null){
            fromDate = f.parse(fd);
        }
        Date toDate = null;
        String td = params.getOrDefault("toDate", null);
        if(td != null){
            toDate = f.parse(td);
        }
        
        model.addAttribute("careerStat", this.statsService.careerStats(fromDate, toDate));
        return "careerStats";
    }
}
