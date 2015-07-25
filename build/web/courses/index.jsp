<%-- 
    Document   : index
    Created on : Jul 16, 2015, 12:58:46 PM
    Author     : Anuz
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../sHeader.jsp" %>

<!--<div class="container" align="right">
    <a href="${pageContext.request.contextPath}/courses/add">   <button title="Add new" class="btn btn-primary" > <span class="glyphicon glyphicon-plus"></span></button></a>
</div>-->


<div class="container" align="right">
    <button title="Add new" class="btn btn-primary" id="btn-add" > <span class="glyphicon glyphicon-plus"></span></button>       </div>

<div id="addFormJQ">
   
<!--    <form name="addForm" method="POST" action="add" class="form-horizontal">-->
   
<form name="addForm" method="POST" action="${pageContext.request.contextPath}/courses/add" class="form-horizontal" >

        <div class="form-group">    
            <label class="control-label col-sm-2" >Course name:</label>
            <input name="courseName" id="courseName" type="text" >
        </div>
        <div class="form-group">   
            <label class="control-label col-sm-2">Description:</label>
            <textarea name="description" id="description"> </textarea>
        </div>
        <div class="form-group">   
            <label class="control-label col-sm-2">Duration: </label> <input type="number" name="duration" id="duration" />
            <select name="durationType" id="durationType">
                <option value="Years">Years  </option>
                <option value="Months">Months</option>
                <option value="Weeks">Weeks</option>
                <option value="Days">Days</option>
            </select>
        </div>
        <div class="form-group">      
            <label class="control-label col-sm-2">    Amount:</label>
            <input name="amount" type="number" id="number">
        </div>
        <div class="form-group">   
            <label class="control-label col-sm-2">Status:</label>
            <label><input name="status" id="status" type="radio" value="1"> Yes </label>
            <label><input name="status" id="status" type="radio" value="0">No </label>
        </div>

        <input type="hidden" name="course_id" />

        <div class="form-group"> 
            <div class="col-sm-offset-2 ">
                <button type="submit" name="btnSave" id="btn-save" class="btn btn-primary">Save</button>  
            </div>
        </div>        
    </form>
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
<!--                    <a href="${pageContext.request.contextPath}/courses/edit?editId=${i.id}"><button class="btn btn-primary" title="Edit"><span class="glyphicon glyphicon-edit"></span></button></a>
                    <a href="${pageContext.request.contextPath}/courses/delete?deleteId=${i.id}"><button class="btn btn-danger" title="Delete" onclick="return confirm('Are You sure?')"><span class="glyphicon glyphicon-remove"></span></button></a>-->

                    <button class="btn btn-primary" title="Edit" id="editInfo"><span class="glyphicon glyphicon-edit"></span></button>
                    <button class="btn btn-danger" title="Delete" id="deleteInfo" onclick="getCourse(${i.id})" ><span class="glyphicon glyphicon-remove"></span></button>

                </td>

            </tr>
        </c:forEach>
    </table>

</div> <!-- end of container div-->

<script>
    $(document).on("ready", function () {
        var addFormJQ=$("#addFormJQ")
        //$("#addFormJQ").hide();
       addFormJQ.hide();

        $("#btn-add").on("click",function () {
            addFormJQ.toggle("slow");
        });
        
        $("#btn-save").on("click",function(){
            $.ajax({
                type: "POST",
                url: "courses/add",
                data: addFormJQ.serialize(),
                success: null,
                dataType: null
            });
        });
        
     
        
           
        
        
    });
     function getCourse(id){
           $("#deleteInfo").on("click",function(){
            $.ajax({
                type: "GET",
                url: "courses/delete/",
                data: id,
                success: null,
                dataType: null
            });
        });
        }
        
</script>


</body>
</html>
