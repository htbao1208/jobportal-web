/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.pojos;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author kid03
 */
@Entity
@Table(name = "experience")
public class Experience implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "jobname")
    private String jobName;
    private String company;
    @Column(name = "year")
    private String yearExp;
    
    //relationship
    @ManyToOne
    @JoinColumn(name = "id_seeker")
    private Seeker seeker;

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
     * @return the jobName
     */
    public String getJobName() {
        return jobName;
    }

    /**
     * @param jobName the jobName to set
     */
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    /**
     * @return the company
     */
    public String getCompany() {
        return company;
    }

    /**
     * @param company the company to set
     */
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * @return the yearExp
     */
    public String getYearExp() {
        return yearExp;
    }

    /**
     * @param yearExp the year to set
     */
    public void setYearExp(String yearExp) {
        this.yearExp = yearExp;
    }

    /**
     * @return the seeker
     */
    public Seeker getSeeker() {
        return seeker;
    }

    /**
     * @param seeker the seeker to set
     */
    public void setSeeker(Seeker seeker) {
        this.seeker = seeker;
    }
}
