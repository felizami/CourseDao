/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.coursedao.service;

import com.leapfrog.coursedao.dao.CourseDAO;
import com.leapfrog.coursedao.dao.impl.CourseDbDAOImpl;
import com.leapfrog.coursedao.dao.impl.CourseListDAOImpl;
import com.leapfrog.coursedao.entity.Course;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Anuz
 */
public class CourseService {
    private CourseDAO courseDAO=new CourseDbDAOImpl();
    
    public int insert(Course c) throws ClassNotFoundException, SQLException {
       return courseDAO.insert(c);
    }
    public int update(Course c) throws ClassNotFoundException, SQLException{
        return courseDAO.update(c);
    }
    public int delete(int id) throws ClassNotFoundException, SQLException{
        return courseDAO.delete(id);
    }
    public List<Course> getAll() throws ClassNotFoundException, SQLException{
        return courseDAO.getAll();
    }
    public Course getById(int id) throws ClassNotFoundException, SQLException{
        return courseDAO.getById(id);
    }
   
}
