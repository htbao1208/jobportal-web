/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author kid03
 */
@Entity
@Table(name = "seeker")
public class Seeker implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    private String phone;
    private String address;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dob;
    
    //relationship
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user")
    private User user;
    @OneToMany(mappedBy = "seeker")
    private Set<Rating> ratings;
    @OneToMany(mappedBy = "seeker", cascade = CascadeType.ALL)
    private Set<CV> cvs;
    @OneToMany(mappedBy = "seeker")
    private Set<Application> applications;
    @OneToMany(mappedBy = "seeker")
    private Set<Skill> skills;
    @OneToMany(mappedBy = "seeker")
    private Set<Education> educations;
    @OneToMany(mappedBy = "seeker")
    private Set<Experience> experiences;

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
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the dob
     */
    public Date getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(Date dob) {
        this.dob = dob;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the ratings
     */
    public Set<Rating> getRatings() {
        return ratings;
    }

    /**
     * @param ratings the ratings to set
     */
    public void setRatings(Set<Rating> ratings) {
        this.ratings = ratings;
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
     * @return the applications
     */
    public Set<Application> getApplications() {
        return applications;
    }

    /**
     * @param applications the applications to set
     */
    public void setApplications(Set<Application> applications) {
        this.applications = applications;
    }

    /**
     * @return the skills
     */
    public Set<Skill> getSkills() {
        return skills;
    }

    /**
     * @param skills the skills to set
     */
    public void setSkills(Set<Skill> skills) {
        this.skills = skills;
    }

    /**
     * @return the educations
     */
    public Set<Education> getEducations() {
        return educations;
    }

    /**
     * @param educations the educations to set
     */
    public void setEducations(Set<Education> educations) {
        this.educations = educations;
    }

    /**
     * @return the experiences
     */
    public Set<Experience> getExperiences() {
        return experiences;
    }

    /**
     * @param experiences the experiences to set
     */
    public void setExperiences(Set<Experience> experiences) {
        this.experiences = experiences;
    }
}
