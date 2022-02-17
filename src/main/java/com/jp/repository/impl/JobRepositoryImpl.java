/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Company;
import com.jp.pojos.Job;
import com.jp.repository.JobRepository;
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
public class JobRepositoryImpl implements JobRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addJob(Job job) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(job);     
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update job error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Job> listJobs(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Job> query = builder.createQuery(Job.class);
        Root root = query.from(Job.class);
        query = query.select(root);
        
        if (kw != null) {
            Predicate p = builder.like(root.get("title").as(String.class), 
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        query = query.orderBy(builder.desc(root.get("createdDate")));
        
        Query q = session.createQuery(query);
        
        int max = 20;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        
        return q.getResultList();
    }

    @Override
    public long countPost() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Job");
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Job getJobById(int i) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Job j;
        j = session.get(Job.class, i);
        return j;
    }
    
}
