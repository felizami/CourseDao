<%@page import="com.leapfrog.coursedao.service.CourseService"%>
<%@page import="com.leapfrog.coursedao.entity.Course"%>

<%@include file="../header.jsp" %>


<%

int id=(Integer.parseInt(request.getParameter("editId")));

Course c=new Course();
CourseService cs=new CourseService();
c=cs.getById(id);




%>

<form name="editForm" method="POST" action="${pageContext.request.contextPath}/course/save.jsp">
    
    <div>    
        <label>Course name:</label>
        <input name="courseName" type="text" value="<%=c.getCourseName()%>">
    </div>
    <div>
        <label>Description:</label>
        <textarea name="description"><%=c.getDescription()%> </textarea>
    </div>
    <div>
        <label>  Duration: </label>
        <input name="duration" type="text" value="<%=c.getDuration()%>">
    </div>
    <div>
        <label>  Duration type:</label>
        
        <select name="durationType">
            
            <option value="Years" <% out.println((c.getDurationType().equalsIgnoreCase("Years"))?"selected='selected'":"" );%>>Years  </option>
            <option value="Months"<% out.println((c.getDurationType().equalsIgnoreCase("Months"))?"selected='selected'":"" );%>>Months</option>
            <option value="Weeks"<% out.println((c.getDurationType().equalsIgnoreCase("Weeks"))?"selected='selected'":"" );%>>Weeks</option>
            <option value="Days"<% out.println((c.getDurationType().equalsIgnoreCase("Days"))?"selected='selected'":"" );%>>Days</option>
        </select>
    </div>
    <div>        
        <label>    Amount:</label>
        <input name="amount" value="<%=c.getAmount()%>" />
    </div>
    <div>
        <label>Status:</label>
        <label><input name="status" type="radio" value="1" <% out.println((c.isStatus())?"checked='checked'":"" ); %>> Yes </label>
        <label><input name="status" type="radio" value="0"  <% out.println((!c.isStatus())?"checked='checked'":"" ); %>>No </label>
    </div>
        
    <input type="hidden" name="course_id" value="<%=c.getId()%>" />
        <button type="submit" name="btnSave">Save</button>  
        
    </form>
 
 
 <%@include file="../footer.jsp" %>