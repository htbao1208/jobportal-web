/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.Company;
import com.jp.pojos.User;
import com.jp.service.CompanyService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author kid03
 */
@Controller
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @GetMapping("/company")
    public String index(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        System.out.println(this.companyService.getCompByUserId(user.getId()));
        if(this.companyService.getCompByUserId(user.getId()).isEmpty())            
            model.addAttribute("company", new Company());
        else    
            model.addAttribute("company", this.companyService.getCompByUserId(user.getId()).get(0));        
        return "index-comp";
    }

    @PostMapping("/company")
    public String addComp(Model model,
            @ModelAttribute(value = "company") Company company,
            HttpSession session) {
        String errMsg = "";
        
        User user = (User) session.getAttribute("currentUser");
        company.setUser(user);
        if (this.companyService.addOrUpdate(company) == true) {
            return "redirect:/company";
        } else {
            errMsg = "Da co loi xay ra";
        }

        return "index-comp";

    }
//    @GetMapping("/show")
//    public String show (Model model, HttpSession session){
//        
//    }
}
