<%@page import="com.leapfrog.coursedao.service.CourseService"%>
<%@page import="com.leapfrog.coursedao.entity.Course"%>


<%@include file="../sHeader.jsp" %>

<form name="editForm" method="POST" action="edit">
    
    <div>    
        <label>Course name:</label>
        <input name="courseName" type="text" value="${requestScope.c.getCourseName()}">
    </div>
    <div>
        <label>Description:</label>
        <textarea name="description">${requestScope.c.getDescription()} </textarea>
    </div>
    <div>
        <label>  Duration: </label>
        <input name="duration" type="text" value="${requestScope.c.getDuration()}">
    </div>
    <div>
        <label>  Duration type:</label>
        
        <select name="durationType">
            
            <option value="Years" >Years  </option>
            <option value="Months">Months</option>
            <option value="Weeks">Weeks</option>
            <option value="Days">Days</option>
        </select>
    </div>
    <div>        
        <label>Amount:</label>
        <input name="amount" value="${requestScope.c.getAmount()}" />
    </div>
    <div>
        <label>Status:</label>
        <label><input name="status" type="radio" value="1" > Yes </label>
        <label><input name="status" type="radio" value="0"  >No </label>
    </div>
        
    <input type="hidden" name="course_id" value="${c.getId()}" />
        <button type="submit" name="btnSave">Save</button>  
        
    </form>
 
 
 <%@include file="../footer.jsp" %>