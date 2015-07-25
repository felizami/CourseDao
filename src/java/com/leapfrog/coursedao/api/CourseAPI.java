/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.coursedao.api;

import com.leapfrog.coursedao.entity.Course;
import com.leapfrog.coursedao.service.CourseService;
import java.sql.SQLException;
import java.util.List;
import javax.print.attribute.standard.Media;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Anuz
 */
@Path("courses")
public class CourseAPI {

    @Context
    private UriInfo context;

    @GET
    @Produces(value = MediaType.APPLICATION_JSON)
    public List<Course> getAllCourse() throws ClassNotFoundException, SQLException{
        CourseService cs=new CourseService();
    return cs.getAll();
    }
    
    @GET
    @Path("/{courseId}")
    @Produces(value = MediaType.APPLICATION_JSON)
    public Course getAllCourse(@PathParam(value="courseId") int id) throws ClassNotFoundException, SQLException{
        CourseService cs=new CourseService();
    return cs.getById(id);
    }
    
  
    
    
    
    
    
    
    
}
