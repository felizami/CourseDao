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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
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
    private CourseService cs=new CourseService();
    @Context
    private UriInfo context;

    @GET
    @Produces(value = MediaType.APPLICATION_JSON)
    public List<Course> getAllCourse() throws ClassNotFoundException, SQLException {
        return cs.getAll();
    }

    @GET
    @Path("/{courseId}")
    @Produces(value = MediaType.APPLICATION_JSON)
    public Course getCourseById(@PathParam(value = "courseId") int id) throws ClassNotFoundException, SQLException {
        return cs.getById(id);
    }

    @POST
    @Path("/add")
    public String add(@Context HttpServletRequest request,@Context HttpServletResponse response) throws ClassNotFoundException, SQLException {
        Course c = new Course();
        c.setCourseName(request.getParameter("courseName"));
        c.setDescription(request.getParameter("description"));
        c.setDuration(Double.parseDouble(request.getParameter("duration")));
        c.setDurationType(request.getParameter("durationType"));
        c.setAmount(Integer.parseInt(request.getParameter("amount")));
        String status = request.getParameter("status");
        c.setStatus((status.equals("1")));
        System.out.println(c.toString());
        int i = cs.insert(c);
        if(i==0){
            return "insert denied";
        }else{
            return "insert Success";
        }
    }
    
    @GET
    @Path("/multiply/{fno}/{sno}")
    public int mul(@PathParam(value = "fno")int fnumber,@PathParam(value = "sno")int snumber){
      //  int x=Integer.parseInt(request.getParameter("fnumber"));
      //  int y=Integer.parseInt(request.getParameter("snumber"));
       return snumber*fnumber;
    }
    @POST
    @Path("/multiply")
    @Produces(MediaType.TEXT_PLAIN)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public int mul(@Context HttpServletRequest request,@Context HttpServletResponse response){
        int x=Integer.parseInt(request.getParameter("fnumber"));
        int y=Integer.parseInt(request.getParameter("snumber"));
       return x*y;
    }
}
