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
<body>

<%
   int jid = Integer.parseInt(request.getParameter("jid"));
   String name = request.getParameter("name");
   String email = request.getParameter("email");
   
%>

<%
	    
	  Connection cn = dbconnection.connects();
	  PreparedStatement stmt = cn.prepareStatement("insert into notification values(?,?,?)");
	  
	  stmt.setInt(1,jid);
	  stmt.setString(2,name);
	  stmt.setString(3,email);
	  
	  int i =stmt.executeUpdate();
	  
	  if(i>0){
		  response.sendRedirect("short.jsp?jid="+jid);
	  }
	  
%>





</body>
</html>