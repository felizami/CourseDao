/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.coursedao.servlet;

import com.leapfrog.coursedao.entity.Course;
import com.leapfrog.coursedao.service.CourseService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anuz
 */
public class CRUDCourseServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        CourseService cs=new CourseService();
        
        if(request.getParameter("editId")!=null){
            int editId=Integer.parseInt(request.getParameter("editId")); 

            try {
                request.setAttribute("c", cs.getById(editId));
                request.getRequestDispatcher("/courses/editCourse.jsp").forward(request,response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(CRUDCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(request.getParameter("deleteId")!=null){
            int deleteId=Integer.parseInt(request.getParameter("deleteId"));  
            try {
                cs.delete(deleteId);
                  response.sendRedirect(request.getContextPath()+"/courses");

                    } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(CRUDCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        request.getRequestDispatcher("/courses/addCourse.jsp").forward(request,response);

        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Course c=new Course();
        c.setCourseName(request.getParameter("courseName"));
        c.setDescription(request.getParameter("description"));
        c.setDuration(Double.parseDouble(request.getParameter("duration")));
        c.setDurationType(request.getParameter("durationType"));
        c.setAmount(Double.parseDouble(request.getParameter("amount")));
        String status=request.getParameter("status");

        c.setStatus((status.equals("1"))?true :false );
    
        CourseService cs=new CourseService();
        

       // System.out.println(cName+" "+description);
        PrintWriter out=response.getWriter();
        
        String id=request.getParameter("course_id");  
         try{
        if(id.equals("")){
            cs.insert(c);
        }
        else
        {
            c.setId(Integer.parseInt(id));
            cs.update(c);
        }
        }catch(ClassNotFoundException | SQLException | NumberFormatException ex){
            out.println(ex.getMessage());
            
        }
         
        response.sendRedirect(request.getContextPath()+"/courses");

    
    }
    
    
    
}
