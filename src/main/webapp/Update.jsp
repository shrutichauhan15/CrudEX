<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
     <h2>Change your Password</h2>
   <form action ="Update" method="post">
       <h3>Enter your old Password</h3>
       OldPassword : <input type= "oldpassword" name="oldpassword">
       NewPassword : <input type= "newpassword" name="newpassword">
       <input type= "submit" value="Password changed">
        
   </form>
   <a href ="Logout">Logout</a>
</body>
</html>