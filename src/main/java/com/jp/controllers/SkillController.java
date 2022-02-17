/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.Seeker;
import com.jp.pojos.Skill;
import com.jp.pojos.User;
import com.jp.service.SeekerService;
import com.jp.service.SkillService;
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
public class SkillController {
    @Autowired
    private SkillService skillService;
    @Autowired
    private SeekerService seekerService;
    
    @GetMapping("/seeker/skill")
    public String view(Model model){  
        model.addAttribute("skill", new Skill());
        return "addSkill";
    }
    @PostMapping("/seeker/skill")
    public String addSkill(Model model,
            @ModelAttribute(value = "skill") Skill skill,
            HttpSession session){
        String errMsg = "";
        User user = (User) session.getAttribute("currentUser");
        Seeker seeker = this.seekerService.getSeekerByUserId(user.getId()).get(0);
        skill.setSeeker(seeker);
        if(this.skillService.addSkill(skill) == true)
            return "redirect:/seeker/main";
        else
            return "addSkill";
        
    }
    
    @GetMapping("/seeker/skill/delete/{id}")
    public String deleteApplication(@PathVariable(name = "id") int id){
        this.skillService.deleteSkill(id);
        return "redirect:/seeker/main";
    }
}
