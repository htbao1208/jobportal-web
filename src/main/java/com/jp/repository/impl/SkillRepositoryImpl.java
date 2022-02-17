/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository.impl;

import com.jp.pojos.Skill;
import com.jp.repository.SkillRepository;
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
public class SkillRepositoryImpl implements SkillRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addSkill(Skill skill) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(skill);            
            return true;
        } catch (Exception ex) {
            System.err.println("--- add or update cv error ---" + ex.getMessage());
            ex.printStackTrace();
        }
        
        return false;
    }

    @Override
    public List<Skill> getSkillsBySeekerId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Skill s Where s.seeker.id = :Id").setParameter("Id", id);
        
        return q.getResultList();
    }

    @Override
    public long countSkill(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Skill s Where s.seeker.id = :Id").setParameter("Id", id);        
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Skill getSkillById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Skill.class, id);
    }

    @Override
    public boolean deleteSkill(int id) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Skill s = session.get(Skill.class, id);
            session.delete(s);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }
    
}
