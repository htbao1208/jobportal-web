/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.pojos;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author kid03
 */
@Entity
@Table(name = "cv")
public class CV implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String title;
    @Column(name = "min_salary")
    private String minSalary;
    @Column(name = "max_salary")
    private String maxSalary;
    private String content;
    
    
    //relationship
    @ManyToOne
    @JoinColumn(name = "id_seeker", referencedColumnName = "id")
    private Seeker seeker;
    @OneToMany(mappedBy = "cv")
    private Set<Recruit> recruits;
    @ManyToOne
    @JoinColumn(name = "id_career", referencedColumnName = "id")
    private Career career;

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

    /**
     * @return the recruits
     */
    public Set<Recruit> getRecruits() {
        return recruits;
    }

    /**
     * @param recruits the recruits to set
     */
    public void setRecruits(Set<Recruit> recruits) {
        this.recruits = recruits;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the minSalary
     */
    public String getMinSalary() {
        return minSalary;
    }

    /**
     * @param minSalary the minSalary to set
     */
    public void setMinSalary(String minSalary) {
        this.minSalary = minSalary;
    }

    /**
     * @return the maxSalary
     */
    public String getMaxSalary() {
        return maxSalary;
    }

    /**
     * @param maxSalary the maxSalary to set
     */
    public void setMaxSalary(String maxSalary) {
        this.maxSalary = maxSalary;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the career
     */
    public Career getCareer() {
        return career;
    }

    /**
     * @param career the career to set
     */
    public void setCareer(Career career) {
        this.career = career;
    }
}
