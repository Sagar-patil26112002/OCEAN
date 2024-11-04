<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="ocean.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
  String que = request.getParameter("que");
  Connection cn = dbconnection.connects();
  PreparedStatement stmt = cn.prepareStatement("insert into test values(?,?,?,?,?,?,?)");
  stmt.setInt(1, 0);
  stmt.setString(2, request.getParameter("que"));
  stmt.setString(3, request.getParameter("o1"));
  stmt.setString(4, request.getParameter("o2"));
  stmt.setString(5, request.getParameter("o3"));
  stmt.setString(6, request.getParameter("o4"));
  stmt.setString(7, request.getParameter("o5"));
  
  int i = stmt.executeUpdate();
  if(i>0){
	  response.sendRedirect("adminpage.html");
  }
  
  
%>




</body>
</html>