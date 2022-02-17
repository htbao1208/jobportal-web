/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.jp.controllers;

import com.jp.pojos.Seeker;
import com.jp.pojos.User;
import com.jp.service.ApplicationService;
import com.jp.service.SeekerService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author kid03
 */
@Controller
public class ApplicationController {
    @Autowired
    private ApplicationService applicationService;
    @Autowired
    private SeekerService seekerService;
    
    @GetMapping("/seeker/application/delete/{id}")
    public String deleteApplication(@PathVariable(name = "id") int id){
        this.applicationService.deleteApplication(id);
        return "redirect:/seeker/main";
    }
    
    @GetMapping("/seeker/listAppication")
    public String listApplication(Model model, HttpSession session, @RequestParam(required = false) Map<String, String> params){
        User user = (User) session.getAttribute("currentUser");  
        //Show application
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        Seeker seeker = this.seekerService.getSeekerByUserId(user.getId()).get(0);
            
        model.addAttribute("counter", this.applicationService.countApplied(seeker.getId()));
        model.addAttribute("listApply", this.applicationService.getApplicationsByIdSeeker(seeker.getId(),page));
//            System.out.println(this.applicationService.getApplicationsByIdSeeker(page));
        return "seekerApplication";
    }
    
}
