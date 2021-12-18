/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.Company;
import com.jp.pojos.Job;
import com.jp.pojos.User;
import com.jp.service.CompanyService;
import com.jp.service.JobService;
import java.util.Date;
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
public class JobController {
    @Autowired
    private JobService jobService;
    @Autowired
    private CompanyService companyService;
    
    @GetMapping("/company/post")
    public String index(Model model) {                 
        model.addAttribute("job", new Job());
      return "testPost";
    }

    @PostMapping("/company/post")
    public String addJob(Model model,
            @ModelAttribute(value = "job") Job job,
            HttpSession session) {
        String errMsg = "";        
        User user = (User) session.getAttribute("currentUser");
        Company company = this.companyService.getCompByUserId(user.getId()).get(0);        
        //set date and comp
        long millis=System.currentTimeMillis();
        Date date = new Date(millis);
        job.setCreatedDate(date);
        job.setCompany(company);
        
//        System.out.print("Loại CV:" + job.getJobType() +"\n ngày tạo: "+  job.getCreatedDate() +"\n Company: "+  job.getCompany() +"\nNô tả: "+  job.getDescription() +"\nĐịa chỉ: "+ job.getAddress() +"\nExp: "+job.getExp() +"\nTên: "+ job.getTitle() +"\nLương: "+ job.getSalary() + "\n");
        //
        if (this.jobService.addJob(job) == true) {
            return "redirect:/";
        } else {
            errMsg = "Da co loi xay ra";
        }

        return "testPost";

    }
}
