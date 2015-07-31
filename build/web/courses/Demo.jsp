<%-- 
    Document   : Demo
    Created on : Jul 28, 2015, 1:23:39 PM
    Author     : Anuz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../jquery-2.1.4.min.js" type="text/javascript"></script>
    </head>
    <body>
        
        
        <form id="id" method="POST">
            firstNumber:<input type="text" id="fnumber" name="fnumber">
            secondNumber:<input type="text" id="snumber" name="snumber">
            
        </form>
        
            <button id="btnClick">Result</button>
            <div id="result"></div>
        <script>
            $(document).on("ready",function(){
               $("#btnClick").on("click",function(){
                        $.post("http://localhost:8080/CourseDao/api/courses/multiply/", $("#id").serialize(),function(data){
                            $("#result").html(data);
                        });
                    return false;   
                }); 
                
            });
        
        </script>
            
            
        
    </body>
</html>
