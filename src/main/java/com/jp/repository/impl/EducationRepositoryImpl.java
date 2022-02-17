/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Education;
import com.jp.repository.EducationRepository;
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
public class EducationRepositoryImpl implements EducationRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean addEducation(Education education) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(education);            
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update cv error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Education> getEducationsBySeekerId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Education e Where e.seeker.id = :Id").setParameter("Id", id);
        
        return q.getResultList();
    }

    @Override
    public long countEdu(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Education e Where e.seeker.id = :Id").setParameter("Id", id);        
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Education getEducationById(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Education.class, i);
    }

    @Override
    public boolean deleteEducation(int i) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Education e = session.get(Education.class, i);
            session.delete(e);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }
    
}
