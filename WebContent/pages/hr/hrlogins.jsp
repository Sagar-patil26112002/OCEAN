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
    
    String email = request.getParameter("email");
	String psw = request.getParameter("psw");

	Connection cn = dbconnection.connects();
	PreparedStatement stmt = cn.prepareStatement("select hid from hr where hemail=? and hpws=?");
	stmt.setString(1, email);
	stmt.setString(2, psw);
	
	ResultSet rs = stmt.executeQuery();
	if(rs.next()){
		GetSet.setHid(rs.getInt(1));
	    response.sendRedirect("viewhr.jsp");
	}else{
		response.sendRedirect("../../hrlogin.html");
	}
    
    
    %>

</body>
</html>