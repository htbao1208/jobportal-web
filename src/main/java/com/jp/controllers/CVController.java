/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.CV;
import com.jp.pojos.Seeker;
import com.jp.pojos.User;
import com.jp.service.CVService;
import com.jp.service.CareerService;
import com.jp.service.SeekerService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author kid03
 */
@Controller
public class CVController {
    @Autowired
    private CVService cVService;
    @Autowired
    private SeekerService seekerService;
    @Autowired
    private CareerService careerService;
    
    
    @GetMapping("/seeker/CV")
    public String cvView(Model model, HttpSession session,  @RequestParam(required = false) Map<String, String> params){
        User user = (User) session.getAttribute("currentUser");  
        //Show application
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        Seeker seeker = this.seekerService.getSeekerByUserId(user.getId()).get(0);
            
        model.addAttribute("counter", this.cVService.countCV(seeker.getId()));
        model.addAttribute("listCV", this.cVService.getCVsBySeekerId(seeker.getId(),page));
//            System.out.println(this.applicationService.getApplicationsByIdSeeker(page));
        return "seekerCV";
    }
    @GetMapping("/seeker/addCV")
    public String view(Model model, HttpSession session){
        model.addAttribute("cv", new CV());
        return "seekerAddCV";
    }
    @PostMapping("/seeker/addCV")
    public String addCV(Model model,
            @ModelAttribute(value = "cv") CV cv,
            HttpSession session){   
        String errMsg = "";
        User user = (User) session.getAttribute("currentUser");
        Seeker seeker = this.seekerService.getSeekerByUserId(user.getId()).get(0);
        cv.setSeeker(seeker);
        if(this.cVService.addCV(cv) == true)
            return "redirect:/seeker/CV";
        else
            return "seekerAddCV";
    }
    @GetMapping("/seeker/cv/delete/{id}")
    public String deleteApplication(@PathVariable(name = "id") int id){
        this.cVService.deleteCV(id);
        return "redirect:/seeker/CV";
    }
    
    @GetMapping("/company/cvlist")
    public String viewCV(Model model, HttpSession session,  @RequestParam(required = false) Map<String, String> params){
        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("list", this.cVService.getCvs(kw, page));
        model.addAttribute("counter", this.cVService.countCV());
        return "cvList";
    }
    
    @GetMapping("/company/cvlist/{id}")
    public String cvDetail(){
        
        return "cvDetail";
    }
}
