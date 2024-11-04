<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
  font-family: Calibri, Helvetica, sans-serif;
  background-color: #AA336A;
}
.container {
    padding: 50px;
  background-color: white;
}

input[type=text], input[type=password], textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: beige;
  outline: none;
}
 div {
            padding: 10px 0;
         }
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
.registerbtn:hover {
  opacity: 1;
}
</style>
</head>
<body>
<form action="testprocess.jsp" method="post">
  <div class="container">
  <center>  <h1> CANDIDATE ASSESSMENT TEST</h1> </center>
  <hr>
  

<%@ page import="java.sql.*" %>
<%@ page import="ocean.*" %>


<% 
 Connection cn = dbconnection.connects();
Statement stmt ;
stmt = cn.createStatement();
ResultSet rs=stmt.executeQuery("select id,question from test");

%>



<table>
  <tr>
    <th>No.</th>
    <th>Questions</th>
    <th>         </th>
    <th>         </th>
    <th>         </th>
    <th>         </th>
    <br>
  </tr>
  <%int count=1; %>
  <% while(rs.next()) { %>
  <tr>
    <td><%= rs.getLong(1) %></td>
    <td><%= rs.getString(2) %></td>
    <th><input type="radio" value="Strongly Disagree" name="q<%=Integer.toString(count)%>" > Strongly Disagree </th>
    <th><input type="radio" value="Disagree" name="q<%=Integer.toString(count) %>" > Disagree </th>
    <th><input type="radio" value="Neutral" name="q<%=Integer.toString(count) %>" > Neutral </th>
    <th><input type="radio" value="Agree" name="q<%=Integer.toString(count) %>" > Agree </th>
    <th><input type="radio" value="Strongly Agree" name="q<%=Integer.toString(count) %>" > Strongly Agree</th>
    <%count++; %>
  </tr>
 <% } %>
 
</table>
<center>
	<div class="submit">
      <button type="submit" class="submit">Submit</button>
    </div>
</center>
    
       </div>
  </form>


</body>
</html>