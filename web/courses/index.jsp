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
    <button title="Add new" class="btn btn-primary" id="btn-add" > <span class="glyphicon glyphicon-plus"></span></button>     
</div>


<form  id="addFormJQ" action="" class="form-horizontal" method="POST">

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

<div class="modal fade edit-form-popup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-md">
    <div class="modal-content" >
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Update data</h4>
      </div>
      <div class="modal-body">
        <form name="editForm" method="POST" action="" class="form-horizontal" >
           
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
            
              
            
        </form>
          
          
      </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="submit"  name="btnSave" id="btn-save" class="btn btn-primary">Save</button>
        </div>
   
    </div>
  </div>
</div>

<!--        
<div id="editFormJQ">

    
</div>
-->


<div class="container">
    <div id="table-form">
        <table class="table table-hover table-striped table-responsive" id="courseTable">
            
                
        </table>
    </div>
</div> <!-- end of container div-->

<script>
    $(document).on("ready", function () {
        tableform();
        function tableform(){
            $("#courseTable").html("<tr><th>Id</th><th>Course name</th>"+
                "<th>Description</th>"
                +"<th>Durations</th>"
                +"<th>Duration type</th>"
                +"<th>Amount</th>"
                +"<th>Status</th>"
                +"<th>Action</th>"
            +"</tr>");
    
            $.get("http://localhost:8080/CourseDao/api/courses", function(data){
                $.each(data, function(i,o){
                  $("#courseTable").append("<tr><td>"+o.id+"</td> <td>"+o.courseName+"</td> <td>"+o.description+"</td> <td>"+o.duration+"</td> <td>"+o.durationType+"</td> <td>"+o.amount+"</td> <td>"+o.status+"</td>"+
                          '<td><button class="btn btn-primary" title="Edit" id="editCourse" data-toggle="modal" data-target=".edit-form-popup"><span class="glyphicon glyphicon-edit"></span></button>'+
                        '<button class="btn btn-danger" title="Delete"  id="deleteCourse" ><span class="glyphicon glyphicon-remove"></span></button></td></tr>');
                    
                });
            });
        }
        var addFormJQ = $("#addFormJQ");
        //$("#addFormJQ").hide();
        addFormJQ.hide();

        $("#btn-add").on("click", function () {
            addFormJQ.toggle("slow");
        });

//        $("#btn-save").on("click", function () {
//            $.ajax({
//                type: "POST",
//                url: "http://localhost:8080/CourseDao/api/courses/add",
//                data: addFormJQ.serialize(),
//                success: null,
//                dataType: null
//            });
//        });       

        $("#btn-save").on('click', function () {
            $.post('http://localhost:8080/CourseDao/api/courses/add', $("#addFormJQ").serialize(), function (data) {
                alert(data);
                $("#courseTable").empty();
                tableform();
                addFormJQ.empty();
                
            });
            
            return false;

        });
        
        



    });


//    $("#deleteInfo").on("click", function (id) {
//
//        confirm("Are you sure?");
//        $.ajax({
//            type: "GET",
//            url: "courses/delete/" + id,
//            data: null,
//            success: null,
//            dataType: null
//        });
//
//    }

</script>


</body>
</html>
