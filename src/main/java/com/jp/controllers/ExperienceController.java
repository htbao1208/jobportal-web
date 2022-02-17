/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.Experience;
import com.jp.pojos.Seeker;
import com.jp.pojos.User;
import com.jp.service.ExperienceService;
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
public class ExperienceController {
    @Autowired
    private ExperienceService experienceService;
    @Autowired
    private SeekerService seekerService;
    
    @GetMapping("/seeker/experience")
    public String view(Model model){
        model.addAttribute("experience", new Experience());
        return "addExp";
    }
    @PostMapping("/seeker/experience")
    public String addExp(Model model,
            @ModelAttribute(value = "experience") Experience experience,
            HttpSession session){
        String errMsg = "";
        User user = (User) session.getAttribute("currentUser");
        Seeker seeker = this.seekerService.getSeekerByUserId(user.getId()).get(0);
        experience.setSeeker(seeker);
        if(this.experienceService.addExperience(experience) == true)
            return "redirect:/seeker/main";
        else
            return "addExp";
    }
    
    @GetMapping("/seeker/experience/delete/{id}")
    public String deleteExp(@PathVariable(name = "id") int id){
        this.experienceService.deleteExperience(id);
        return "redirect:/seeker/main";
    }
}
