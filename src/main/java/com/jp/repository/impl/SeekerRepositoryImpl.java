/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Seeker;
import com.jp.repository.SeekerRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class SeekerRepositoryImpl implements SeekerRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addOrUpdate(Seeker seeker) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
                session.saveOrUpdate(seeker);            
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update seeker error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Seeker> getSeekers(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Seeker> query = builder.createQuery(Seeker.class);
        Root root = query.from(Seeker.class);
        query = query.select(root);
        
        if (kw != null) {
            Predicate p = builder.like(root.get("compName").as(String.class), 
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        query = query.orderBy(builder.desc(root.get("id")));
        
        Query q = session.createQuery(query);
        
        int max = 9;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }

    @Override
    public Seeker getSeekerById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Seeker.class, id);
    }

    @Override
    public List<Seeker> getSeekerByUserId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Seeker> query = builder.createQuery(Seeker.class);
        Root root = query.from(Seeker.class);
        query = query.select(root);
        
        Predicate p = builder.equal(root.get("user"), id);
        query = query.where(p);
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public long countSeeker() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Seeker");
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    
}
