<%-- 
    Document   : index
    Created on : Jul 12, 2015, 11:47:59 AM
    Author     : Anuz
--%>
<%@include file="../header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="courseService" class="com.leapfrog.coursedao.service.CourseService"></jsp:useBean>
<div class="container" align="right">
    <a href="${pageContext.request.contextPath}/course/add.jsp">   <button title="Add new" class="btn btn-primary"  onclick=""> <span class="glyphicon glyphicon-plus"></span></button></a>

   
<br/>
<br/>
<table class="table table-hover table-responsive table-striped">
    
    <tr>
        <th>id</th>
        <th>Course name</th>
        <th>Description</th>
        <th>Duration</th>
        <th>Duration type</th>
        <th>Amount</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

   
    <c:forEach var="c" items="${courseService.all}">
    <tr>
        <td>${c.id}</td>
        <td>${c.courseName}</td>
        <td>${c.description}</td>
        <td>${c.duration}</td>
        <td>${c.durationType}</td>
        <td>${c.amount}</td>
        <td>${c.status}</td>
        <td>
            <a href="${pageContext.request.contextPath}/course/edit.jsp?editId=${c.id}"><button class="btn btn-primary" title="Edit"><span class="glyphicon glyphicon-edit"></span></button></a>
            <a href="${pageContext.request.contextPath}/course/delete.jsp?deleteId=${c.id}"><button class="btn btn-danger" title="Delete" onclick="return confirm('Are You sure?')"><span class="glyphicon glyphicon-remove"></span></button></a>
            
        </td>
    </tr>
               
    </c:forEach>
        
        
    
</table>
</div>
        
        
                
<%@include file="../footer.jsp" %>