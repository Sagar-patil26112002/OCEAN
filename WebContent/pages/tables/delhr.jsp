<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="ocean.*"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	background-image: url("image2.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

      <%
      
	  int id = Integer.parseInt(request.getParameter("id"));  
	  Connection cn = dbconnection.connects();
	  PreparedStatement stmt = cn.prepareStatement("delete from hr where hid=?");
	  stmt.setInt(1, id);
	  int i = stmt.executeUpdate();
	  
	  if(i>0){
		  response.sendRedirect("ok.jsp");
	  }else{
		  response.sendRedirect("hrdelete.jsp");
	  }
	  %>
	  
</body>
</html>