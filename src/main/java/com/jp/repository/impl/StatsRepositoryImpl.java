/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Application;
import com.jp.pojos.Career;
import com.jp.pojos.Job;
import com.jp.pojos.Seeker;
import com.jp.repository.StatsRepository;
import java.util.ArrayList;
import java.util.Date;
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
public class StatsRepositoryImpl implements StatsRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Object[]> careerStats(Date fromDate, Date toDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootA = query.from(Application.class);
        Root rootJ = query.from(Job.class);
        Root rootC = query.from(Career.class);
        Root rootS = query.from(Seeker.class);
        
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootC.get("id"), rootJ.get("career")));
        predicates.add(builder.equal(rootJ.get("id"), rootA.get("job")));
        predicates.add(builder.equal(rootA.get("seeker"), rootS.get("id")));
        
        query.multiselect(rootS.get("id"), rootS.get("firstName"), rootS.get("lastName"), rootC.get("name"), rootA.get("appliedDate"), builder.count(rootA));
        
        if(fromDate != null){
            predicates.add(builder.greaterThanOrEqualTo(rootA.get("appliedDate"), fromDate));
        }
        if(toDate != null){
            predicates.add(builder.lessThanOrEqualTo(rootA.get("appliedDate"), toDate));
        }
        
        query.where(predicates.toArray(new Predicate[]{}));
        query.groupBy(rootC.get("name"), rootS.get("firstName"), rootS.get("lastName"), rootA.get("appliedDate"), rootS.get("id"));
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
}
