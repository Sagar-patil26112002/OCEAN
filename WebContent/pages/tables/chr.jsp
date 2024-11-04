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
<% String name = request.getParameter("name");
String email = request.getParameter("email");
long mno = Long.parseLong(request.getParameter("mno"));
String psw = request.getParameter("psw");
String city = request.getParameter("city");
%>
<%
Connection cn = dbconnection.connects();
PreparedStatement stmt = cn.prepareStatement("insert into hr values(?,?,?,?,?,?)");
stmt.setInt(1, 0);
stmt.setString(2,name);
stmt.setString(3,email);
stmt.setLong(4,mno);
stmt.setString(5,psw);
stmt.setString(6,city);

int i = stmt.executeUpdate();

if(i>0){
GetSet.setHname(name);
GetSet.setHemail(email);
GetSet.setHmno(mno);
GetSet.setHpsw(psw);
GetSet.setHcity(city);
response.sendRedirect("ok.jsp"); 
}
%>


</body>
</html>