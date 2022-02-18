/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.Company;
import com.jp.pojos.User;
import com.jp.service.CompanyService;
import com.jp.service.RecruitService;
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
public class Recruitcontroller {
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private CompanyService companyService;
    
    
    @GetMapping("/company/listRecruit")
    public String listApplication(Model model, HttpSession session, @RequestParam(required = false) Map<String, String> params){
        User user = (User) session.getAttribute("currentUser");  
        //Show application
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        Company company = this.companyService.getCompByUserId(user.getId()).get(0);
            
        model.addAttribute("counter", this.recruitService.countRecruit(company.getId()));
        model.addAttribute("listr", this.recruitService.getRecruitsByIdCompany(company.getId(),page));
//            System.out.println(this.applicationService.getApplicationsByIdSeeker(page));
        return "companyRecruit";
    }
    
    @GetMapping("/company/recruit/delete/{id}")
    public String deleteApplication(@PathVariable(name = "id") int id){
        this.recruitService.deleteRecruit(id);
        return "redirect:/company/listRecruit";
    }
}
