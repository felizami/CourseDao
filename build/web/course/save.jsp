<%@page import="com.leapfrog.coursedao.service.CourseService"%>
<%@page import="com.leapfrog.coursedao.entity.Course"%>
<%
if(request.getParameter("btnSave")==null){
response.sendRedirect(request.getContextPath()+"/course/index.jsp");
}
    Course c=new Course();
    c.setCourseName(request.getParameter("courseName"));
    c.setDescription(request.getParameter("description"));
    c.setDuration(Double.parseDouble(request.getParameter("duration")));
    c.setDurationType(request.getParameter("durationType"));
    c.setAmount(Integer.parseInt(request.getParameter("amount")));
    String status=request.getParameter("status");
    
    c.setStatus((status.equals("1"))?true :false );
    
    
    
    CourseService cs=new CourseService();
    
    String id=request.getParameter("course_id");
    if(id.equals("")){
    cs.insert(c);
    }
    else
    {
        c.setId(Integer.parseInt(id));
        cs.update(c);
    }
    
    
    response.sendRedirect(request.getContextPath()+"/course/index.jsp");

%>
    