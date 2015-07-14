<%-- 
    Document   : add
    Created on : Jul 12, 2015, 11:48:08 AM
    Author     : Anuz
--%>

<%@include file="../header.jsp" %>
<form name="addForm" method="POST" action="${pageContext.request.contextPath}/course/save.jsp">
    <div class="form-group">
    <div>    
        <label>Course name:</label>
        <input name="courseName" type="text">
    </div>
    <div>
        <label>Description:</label>
        <input name="description" type="text">
    </div>
    <div>
        <label>Duration: </label> <input type="number" name="duration" />
        <select name="durationType">
            <option value="Years">Years  </option>
            <option value="Months">Months</option>
            <option value="Weeks">Weeks</option>
            <option value="Days">Days</option>
        </select>
    </div>
    <div>        
        <label>    Amount:</label>
        <input name="amount" type="number">
    </div>
    <div>
        <label>Status:</label>
        <label><input name="status" type="radio" value="1"> Yes </label>
        <label><input name="status" type="radio" value="0">No </label>
    </div>
        <input type="hidden" name="course_id" />
        <button type="submit" name="btnSave">Save</button>  
    
    
    </div> <!-- end of div form -->
           
    </form>
    
 
 
 <%@include file="../footer.jsp" %>