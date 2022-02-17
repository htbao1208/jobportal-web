/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Experience;
import com.jp.repository.ExperienceRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kid03
 */
@Repository
@Transactional
public class ExperienceRepositoryImpl implements ExperienceRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean addExperience(Experience experience) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(experience);            
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update cv error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Experience> getExperiencesBySeekerId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Experience e Where e.seeker.id = :Id").setParameter("Id", id);
        
        return q.getResultList();
    }

    @Override
    public long countExp(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Experience e Where e.seeker.id = :Id").setParameter("Id", id);        
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Experience getExperienceById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Experience.class, id);
    }

    @Override
    public boolean deleteExperience(int id) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Experience e = session.get(Experience.class, id);
            session.delete(e);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }
    
}
