<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Account</title>
</head>
<%  
session= request.getSession(false);
if(session ==null || session.getAttribute("username") == null) {
	
response.sendRedirect("index.html");
return;
}
%>
<body>
      <h3> Welcome <%= session.getAttribute("username") %></h3>
    <a href  ="Welcome.jsp"> welcome page</a>
     <h2>Delete your Account</h2>
   <form action ="Delete" method="post">
       <h3>Enter your Password</h3>
       Password : <input type= "password" name="password">
      
       <input type= "submit" value="Delete Account">
        
   </form>
   <a href ="Logout">Logout</a>
</body>
</html>