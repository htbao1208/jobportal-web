/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.controllers;

import com.jp.pojos.Application;
import com.jp.pojos.Company;
import com.jp.pojos.Job;
import com.jp.pojos.Seeker;
import com.jp.pojos.User;
import com.jp.service.ApplicationService;
import com.jp.service.CompanyService;
import com.jp.service.JobService;
import com.jp.service.SeekerService;
import java.util.Date;
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
public class JobController {
    @Autowired
    private JobService jobService;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private ApplicationService applicationService;
    @Autowired
    private SeekerService seekerService;
    
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
        if (this.jobService.addJob(job) == true) {
            return "redirect:/company/listJob";
        } else {
            errMsg = "Da co loi xay ra";
        }

        return "testPost";

    }
    
    @GetMapping("/joblist")
    public String search(Model model, @RequestParam(required = false) Map<String, String> params){
        String kw = params.getOrDefault("kw", null);
        String jobType = params.getOrDefault("jobType", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("list", this.jobService.listJobs(kw, jobType, page));
        
        model.addAttribute("jCounter", this.jobService.countPost());
        return "jobList";
    }
    
    @GetMapping("/joblist/{jobId}")
    public String detail(Model model,@PathVariable(value = "jobId") Integer jobId){
        model.addAttribute("job", this.jobService.getJobById(jobId));
        
        model.addAttribute("application", new Application());
        
        return "jobDetail";
    }
    @PostMapping("/joblist/{jobId}")
    public String addAct(@ModelAttribute(value = "application") Application application
            , @PathVariable(value = "jobId") Integer jobId, HttpSession session){
        
        User user = (User) session.getAttribute("currentUser");
        Seeker seeker = this.seekerService.getSeekerByUserId(user.getId()).get(0);
        Job job = this.jobService.getJobById(jobId);
        
        application.setJob(job);
        application.setSeeker(seeker);
        
        if(this.applicationService.addApplication(application) == true){
            System.out.print("Complete");
            return "redirect:/seeker/listApplication";
        }
        else
            return"jobDetail";
    }
    
    @GetMapping("/company/listJob")
    public String listJobComp(Model model, HttpSession session, @RequestParam(required = false) Map<String, String> params){
        User user = (User) session.getAttribute("currentUser");
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        Company company = this.companyService.getCompByUserId(user.getId()).get(0);
        
        model.addAttribute("counter", this.jobService.countPost(company.getId()));
        model.addAttribute("listJ", this.jobService.listJobByIdComp(company.getId(), page));
        
        return "companyListJob";
    }
    @GetMapping("/company/job/delete/{id}")
    public String deleteJob(@PathVariable(name = "id") int id){
        this.jobService.deleteJob(id);
        return "redirect:/company/listJob";
    }
}
