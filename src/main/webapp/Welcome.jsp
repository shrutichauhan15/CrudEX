<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome page</title>
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
     <a href= "Update.jsp">ChangePassword</a>
     <a href= "Delete.jsp">DeleteAccount</a>
      <a href ="logout" >Logout </a>
     
</body>
</html>