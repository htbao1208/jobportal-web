/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Recruit;
import com.jp.repository.RecruitRepository;
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
public class RecruitRepositoryImpl implements RecruitRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean addRecruit(Recruit recruit) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(recruit);            
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update application error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Recruit> getRecruitsByIdCompany(int id, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Application> query = builder.createQuery(Application.class);
//        Root root = query.from(Application.class);
//        query = query.select(root);     
//        
//        Predicate p = builder.equal(root.get("seeker"), id);
//        query = query.where(p);
        Query q = session.createQuery("From Recruit r Where r.company.id = :Id").setParameter("Id", id);
        
        int max = 5;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }

    @Override
    public long countRecruit(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Recruit r Where r.company.id = :Id").setParameter("Id", id);        
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Recruit getRecruitById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Recruit.class, id);
    }

    @Override
    public boolean deleteRecruit(int id) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Recruit r = session.get(Recruit.class, id);
            session.delete(r);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }
    
}
