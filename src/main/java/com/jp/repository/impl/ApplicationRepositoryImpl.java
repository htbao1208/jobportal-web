/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Application;
import com.jp.repository.ApplicationReposiroty;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class ApplicationRepositoryImpl implements ApplicationReposiroty{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean addApplication(Application application) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(application);            
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update application error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Application> getApplicationsByIdSeeker(int id,int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Application> query = builder.createQuery(Application.class);
//        Root root = query.from(Application.class);
//        query = query.select(root);     
//        
//        Predicate p = builder.equal(root.get("seeker"), id);
//        query = query.where(p);
        Query q = session.createQuery("From Application a Where a.seeker.id = :Id").setParameter("Id", id);
        
        int max = 5;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }
    
    @Override
    public long countApplied(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Application a Where a.seeker.id = :Id").setParameter("Id", id);        
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Application getApplicationById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Application.class, id);
    }

    @Override
    public boolean deleteApplication(int id) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Application a = session.get(Application.class, id);
            session.delete(a);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }
}
