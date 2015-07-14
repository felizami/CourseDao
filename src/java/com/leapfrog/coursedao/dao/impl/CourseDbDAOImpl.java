/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.coursedao.dao.impl;

import com.leapfrog.coursedao.dao.CourseDAO;
import com.leapfrog.coursedao.dbUtil.DBConnection;
import com.leapfrog.coursedao.entity.Course;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anuz
 */
public class CourseDbDAOImpl implements CourseDAO {
    private DBConnection conn;

    public CourseDbDAOImpl() {
        conn=new DBConnection();
    }
    
    @Override
    public int insert(Course c) throws ClassNotFoundException, SQLException {
        int status=(c.isStatus())?1:0;
        String sql="insert into course(courseName,description,duration,durationType,amount,status) "
                + "values('"+c.getCourseName()+"','"+c.getDescription()+"',"+c.getDuration()+",'"+c.getDurationType()+"','"+ c.getAmount()+"','"+ status+"')";
        conn.open();
        int result=conn.executeUpdate(sql);
        conn.close();
        return result;
        
    }

    @Override
    public int update(Course c) throws ClassNotFoundException, SQLException {
        int status=(c.isStatus())?1:0;
        
        String sql="UPDATE course"
                + " SET courseName='"+c.getCourseName()+"',description='"+c.getDescription()+"',duration='"+c.getDuration()+"',durationType='"+c.getDurationType()+"',amount='"+c.getAmount()+"',status='"+status+"' where id="+c.getId();          
        conn.open();
        int result=conn.executeUpdate(sql);
        conn.close();
        return result;
    }

    @Override
    public int delete(int id) throws SQLException, ClassNotFoundException {
       String sql="delete from course where id="+id;
        conn.open();
        
        int result=conn.executeUpdate(sql);
        
        conn.close();
  
        return result;
    }

    @Override
    public List<Course> getAll() throws ClassNotFoundException, SQLException {
        List<Course> courseList=new ArrayList();
        String sql="select * from course";
        
        conn.open();
        ResultSet rs=conn.executeQuery(sql);
        while(rs.next()){
            Course c=new Course();
            c.setId(rs.getInt("id"));
            c.setCourseName(rs.getString("courseName"));
            c.setDescription(rs.getString("description"));
            c.setDuration(Double.parseDouble(rs.getString("duration")));
            
            c.setDurationType(rs.getString("durationType"));
            c.setAmount(Integer.parseInt(rs.getString("amount")));
            
           
            c.setStatus(rs.getBoolean("status"));
            
            
            courseList.add(c);
        }
        conn.close();
        return courseList;
        
    }

    @Override
    public Course getById(int id) throws SQLException, ClassNotFoundException {
       
        String sql="select * from course where id="+id;
        conn.open();
        
        ResultSet rs=conn.executeQuery(sql);
        Course c=new Course();
           
        while(rs.next()){
            c.setId(rs.getInt("id"));
            c.setCourseName(rs.getString("courseName"));
            c.setDescription(rs.getString("description"));
            c.setDuration(Double.parseDouble(rs.getString("duration")));
            
            c.setDurationType(rs.getString("durationType"));
            c.setAmount(Integer.parseInt(rs.getString("amount")));
            
           
            c.setStatus(rs.getBoolean("status"));
            
            
        }     
        
        conn.close();
  
        return c;
    }

   
    
}
