/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.Seeker;
import com.jp.pojos.User;
import com.jp.service.SeekerService;
import com.jp.service.ApplicationService;
import com.jp.service.EducationService;
import com.jp.service.ExperienceService;
import com.jp.service.SkillService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author kid03
 */
@Controller
public class SeekerController {
    @Autowired
    private SeekerService seekerService;
    @Autowired
    private ApplicationService applicationService;
    @Autowired
    private SkillService skillService;
    @Autowired
    private ExperienceService experienceService;
    @Autowired
    private EducationService educationService;
    
    @GetMapping("/seeker/profile")
    public String index(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
//        System.out.println(this.seekerService.getSeekerByUserId(user.getId()).get(0));
        if(this.seekerService.getSeekerByUserId(user.getId()).isEmpty())            
            model.addAttribute("seeker", new Seeker());
        else    
            model.addAttribute("seeker", this.seekerService.getSeekerByUserId(user.getId()).get(0));        
        return "seekerProfile";
    }

    @PostMapping("/seeker/profile")
    public String addInfor(Model model,
            @ModelAttribute(value = "seeker") Seeker seeker,
            HttpSession session) {
        String errMsg = "";
        
        User user = (User) session.getAttribute("currentUser");
        seeker.setUser(user);
//        System.out.print(seeker.getAddress() + "\n"+ seeker.getDob() + "\n" +seeker.getEducation() + "\n" +seeker.getExperience() + "/n" + seeker.getFirstName() + "\n" + seeker.getLastName() +"\n"+ seeker.getPhone() +"\n"+ seeker.getSkill());
        if (this.seekerService.addOrUpdate(seeker) == true) {
            return "redirect:/seeker/main";
        } else {
            errMsg = "Da co loi xay ra";
        }

        return "seekerProfile";

    }
    @GetMapping("/seeker/main")
    public String mainProfile(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");        
        if(this.seekerService.getSeekerByUserId(user.getId()).isEmpty()){
            System.out.print("FALSE: ");
            model.addAttribute("seeker", null);          
        }
        else{
            Seeker seeker = this.seekerService.getSeekerByUserId(user.getId()).get(0);
            //Show info seeker
            System.out.print("TRUE: ");            
            model.addAttribute("seeker", seeker);
            
            //Show skill            
            model.addAttribute("skills", this.skillService.getSkillsBySeekerId(seeker.getId()));
            //Show exp
            model.addAttribute("exps", this.experienceService.getExperiencesBySeekerId(seeker.getId()));
            //Show edu
            model.addAttribute("edus", this.educationService.getEducationsBySeekerId(seeker.getId()));
        }
        
        return "seekerMainProfile";
    }
}
