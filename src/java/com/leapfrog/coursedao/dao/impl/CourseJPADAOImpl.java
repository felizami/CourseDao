/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.coursedao.dao.impl;

import com.leapfrog.coursedao.dao.CourseDAO;
import com.leapfrog.coursedao.entity.Course;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Anuz
 */
public class CourseJPADAOImpl implements CourseDAO{
    EntityManagerFactory emf;
    EntityManager em;

    public CourseJPADAOImpl() {
    emf=Persistence.createEntityManagerFactory("JPU");
    em=emf.createEntityManager();
            
    }
    
    @Override
    public int insert(Course t) {
        em.getTransaction().begin();
        em.persist(t);
        em.getTransaction().commit();
        return 1;
    }

    @Override
    public int update(Course t) {
//        Course c=new Course();
//        em.getTransaction().begin();
//        c.setCourseName(t.getCourseName());
//        em.persist(t);
//        em.getTransaction().commit();
        return 0;
    }

    @Override
    public int delete(int id)  {
        em.remove(id);
     return 1;
    }

    @Override
    public List<Course> getAll()  {
        return em.createQuery("SELECT c from Course c").getResultList();
   }

    @Override
    public Course getById(int id)  {
        return em.find(Course.class, id);   
    }
    
}
