/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Company;
import com.jp.repository.CompanyRepository;
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
public class CompanyRepositoryImpl implements CompanyRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean addOrUpdate(Company comp) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(comp);            
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update comp error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Company> getCompanys(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Company> query = builder.createQuery(Company.class);
        Root root = query.from(Company.class);
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
    public Company getCompanyById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Company.class, id);
    }

    @Override
    public List<Company> getCompByUserId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Company> query = builder.createQuery(Company.class);
        Root root = query.from(Company.class);
        query = query.select(root);
        
        Predicate p = builder.equal(root.get("user"), id);
        query = query.where(p);     
        
        
        
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }
    
}
