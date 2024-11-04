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
int age = Integer.parseInt(request.getParameter("age"));
int exp = Integer.parseInt(request.getParameter("experience"));
String cemail= request.getParameter("email");
int o=0,c=0,e=0,a=0,n=0;
Connection cn = dbconnection.connects();
PreparedStatement stmt = cn.prepareStatement("insert into candidate values(?,?,?,?,?,?,?,?,?,?,?,?)");
stmt.setInt(1, 0);
stmt.setInt(2, jid);
stmt.setString(3, request.getParameter("name"));
stmt.setString(4, request.getParameter("email"));
stmt.setInt(5, age);
stmt.setString(6,request.getParameter("education") );
stmt.setInt(7,exp);
stmt.setInt(8, o);
stmt.setInt(9, c);
stmt.setInt(10, e);
stmt.setInt(11, a);
stmt.setInt(12, n);
int i = stmt.executeUpdate();
if(i>0){
	GetSet.setCemail(cemail);
	response.sendRedirect("test.jsp");
	
}


%>


</body>
</html>