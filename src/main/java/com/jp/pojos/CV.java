/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.pojos;

import java.io.Serializable;
import java.util.Set;
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
    
    
    //relationship
    @ManyToOne
    @JoinColumn(name = "id_seeker")
    private Seeker seeker;
    @OneToMany(mappedBy = "cv")
    private Set<Recruit> recruits;

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
}
