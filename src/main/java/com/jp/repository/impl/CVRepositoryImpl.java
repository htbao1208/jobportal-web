/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.CV;
import com.jp.repository.CVRepository;
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
public class CVRepositoryImpl implements CVRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addCV(CV cv) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(cv);            
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update cv error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<CV> getCvs(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CV> query = builder.createQuery(CV.class);
        Root root = query.from(CV.class);
        query = query.select(root);
        
        if (kw != null) {
            Predicate p = builder.like(root.get("title").as(String.class), 
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        query = query.orderBy(builder.desc(root.get("id")));
        
        Query q = session.createQuery(query);
        
        int max = 20;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }

    @Override
    public List<CV> getCVsBySeekerId(int id, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From CV c Where c.seeker.id = :Id").setParameter("Id", id);
        
        int max = 5;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }

    @Override
    public CV getCVById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(CV.class, id);
    }

    @Override
    public boolean deleteCV(int id) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            CV c = session.get(CV.class, id);
            session.delete(c);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public long countCV(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From CV c Where c.seeker.id = :Id").setParameter("Id", i);        
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public long countCV() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From CV c");        
        
        return Long.parseLong(q.getSingleResult().toString());
    }
    
}
