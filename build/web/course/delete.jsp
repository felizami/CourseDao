<%@page import="com.leapfrog.coursedao.service.CourseService"%>
<%

int id=(Integer.parseInt(request.getParameter("deleteId")));

CourseService cs=new CourseService();
cs.delete(id);

response.sendRedirect(request.getContextPath()+"/course/index.jsp");




%>