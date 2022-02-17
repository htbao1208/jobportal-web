/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.Education;
import com.jp.pojos.Seeker;
import com.jp.pojos.User;
import com.jp.service.EducationService;
import com.jp.service.SeekerService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author kid03
 */
@Controller
public class EducationController {
    @Autowired
    private EducationService educationService;
    @Autowired
    private SeekerService seekerService;
    
    @GetMapping("/seeker/education")
    public String view(Model model){  
        model.addAttribute("education", new Education());
        return "addEdu";
    }
    @PostMapping("/seeker/education")
    public String addSkill(Model model,
            @ModelAttribute(value = "education") Education education,
            HttpSession session){
        String errMsg = "";
        User user = (User) session.getAttribute("currentUser");
        Seeker seeker = this.seekerService.getSeekerByUserId(user.getId()).get(0);
        education.setSeeker(seeker);
        if(this.educationService.addEducation(education) == true)
            return "redirect:/seeker/main";
        else
            return "addEdu";
        
    }
    
    @GetMapping("/seeker/education/delete/{id}")
    public String deleteApplication(@PathVariable(name = "id") int id){
        this.educationService.deleteEducation(id);
        return "redirect:/seeker/main";
    }
}
