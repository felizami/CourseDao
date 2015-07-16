<%-- 
    Document   : index
    Created on : Jul 16, 2015, 12:58:46 PM
    Author     : Anuz
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../sHeader.jsp" %>
      
        <div class="container" align="right">
            <a href="${pageContext.request.contextPath}/courses/add">   <button title="Add new" class="btn btn-primary"  onclick=""> <span class="glyphicon glyphicon-plus"></span></button></a>
        </div>
       
           
        <div class="container">
        <table class="table table-hover table-striped table-responsive">
            <tr>
                <th>Id</th>
                <th>Course name</th>
                <th>Description</th>
                <th>Duration</th>
                <th>Duration type</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Action</th>
                
                
                
                
            </tr>
          
        <c:forEach var="i" items="${requestScope.cl}">
            <tr>
                <td>${i.getId()}</td>
                <td>${i.getCourseName()}</td>
                <td>${i.getDescription()}</td>
                <td>${i.getDuration()}</td>
                <td>${i.getDurationType()}</td>
                <td>${i.getAmount()}</td>
                <td>${i.isStatus()}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/courses/edit?editId=${i.id}"><button class="btn btn-primary" title="Edit"><span class="glyphicon glyphicon-edit"></span></button></a>
            <a href="${pageContext.request.contextPath}/courses/delete?deleteId=${i.id}"><button class="btn btn-danger" title="Delete" onclick="return confirm('Are You sure?')"><span class="glyphicon glyphicon-remove"></span></button></a>
            
        </td>

             </tr>
        </c:forEach>
            </table>
        
        </div> <!-- end of container div-->
        
   
    </body>
</html>
