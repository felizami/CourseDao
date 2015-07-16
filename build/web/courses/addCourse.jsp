<%-- 
    Document   : add
    Created on : Jul 12, 2015, 11:48:08 AM
    Author     : Anuz
--%>

<%@include file="../sHeader.jsp" %>
<form name="addForm" method="POST" action="add" class="form-horizontal">
    
    <div class="form-group">    
        <label class="control-label col-sm-2" >Course name:</label>
        <input name="courseName" type="text" >
    </div>
   <div class="form-group">   
        <label class="control-label col-sm-2">Description:</label>
        <textarea name="description"> </textarea>
    </div>
   <div class="form-group">   
        <label class="control-label col-sm-2">Duration: </label> <input type="number" name="duration" />
        <select name="durationType">
            <option value="Years">Years  </option>
            <option value="Months">Months</option>
            <option value="Weeks">Weeks</option>
            <option value="Days">Days</option>
        </select>
    </div>
    <div class="form-group">      
        <label class="control-label col-sm-2">    Amount:</label>
        <input name="amount" type="number">
    </div>
   <div class="form-group">   
        <label class="control-label col-sm-2">Status:</label>
        <label><input name="status" type="radio" value="1"> Yes </label>
        <label><input name="status" type="radio" value="0">No </label>
    </div>
        
    <input type="hidden" name="course_id" />
   
   <div class="form-group"> 
    <div class="col-sm-offset-2 ">
    <button type="submit" name="btnSave" class="btn btn-primary">Save</button>  
     </div>
  </div>        
    </form>
    
 
 
 <%@include file="../footer.jsp" %>