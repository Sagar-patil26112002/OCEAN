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
String jtitle = request.getParameter("name");
String jdesc = request.getParameter("desc");
String salary = request.getParameter("salary");
String qualitiess = request.getParameter("qualities");
int experience = Integer.parseInt(request.getParameter("experience"));

Connection cn = dbconnection.connects();
PreparedStatement stmt = cn.prepareStatement("insert into jobs values(?,?,?,?,?,?,?)");

stmt.setInt(1, 0);
stmt.setInt(2, GetSet.getHid());
stmt.setString(3, jtitle);
stmt.setString(4, jdesc);
stmt.setString(5, salary);
stmt.setString(6, qualitiess);
stmt.setInt(7, experience);

int i = stmt.executeUpdate();
if(i>0){
	response.sendRedirect("viewhr.jsp");
}else{
	response.sendRedirect("jobadd.html");
}
%>


</body>
</html>