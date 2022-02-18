/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;



import com.jp.pojos.Company;
import com.jp.pojos.User;
import com.jp.service.CVService;
import com.jp.service.CareerService;
import com.jp.service.CompanyService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



/**
 *
 * @author kid03
 */
@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private CareerService careerService;
    @Autowired
    private CVService cVService;
    @Autowired
    private CompanyService companyService;
    
    @RequestMapping("/")
    public String index(Model model){        
        return "index";
    }    
    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {        
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("careers", this.careerService.getCareers());        
    }

}
