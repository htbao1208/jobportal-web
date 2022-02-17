/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.pojos;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author kid03
 */
@Entity
@Table(name = "career")
public class Career implements Serializable{
    @Id
    private int id;
    private String name;
    
    //relationship
    @OneToMany(mappedBy = "career")
    private Set<CV> cvs;
    @OneToMany(mappedBy = "career")
    private Set<Job> jobs;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the cvs
     */
    public Set<CV> getCvs() {
        return cvs;
    }

    /**
     * @param cvs the cvs to set
     */
    public void setCvs(Set<CV> cvs) {
        this.cvs = cvs;
    }

    /**
     * @return the jobs
     */
    public Set<Job> getJobs() {
        return jobs;
    }

    /**
     * @param jobs the jobs to set
     */
    public void setJobs(Set<Job> jobs) {
        this.jobs = jobs;
    }
}
