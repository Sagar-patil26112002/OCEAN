<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="ocean.*"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="table.css">
</head>
<body>

   <%
	  // String email= request.getParameter("hemail");
      // String psw= request.getParameter("hpsw");
	  Connection cn = dbconnection.connects();
	  PreparedStatement stmt1 = cn.prepareStatement("select hid from hr where hemail=? and hpws=? ");
	  stmt1.setString(1, request.getParameter("hemail"));
	  stmt1.setString(2, request.getParameter("hpsw"));
	  ResultSet rs1 = stmt1.executeQuery();
	  
	  while(rs1.next()){
		  int hid = rs1.getInt(1);
		  GetSet.setHid(hid);
	  }
	  
	  %>
       
      <%
	    
	  Connection cn1 = dbconnection.connects();
	  PreparedStatement stmt = cn1.prepareStatement("select * from jobs where hid=?");
	  stmt.setInt(1, GetSet.getHid());
	  ResultSet rs = stmt.executeQuery();
	  
	  %>
       
     <h1>
  JOBS
</h1>
<p>
</p>
<main>
  <table>
    <thead>
      <tr>
        <th>
          JOB ID
        </th>
        <th>
          JOB TITLE
        </th>
        <th>
          JOB DESCRIPTION
        </th>
        <th>
          SALARY RANGE
        </th>
        <th>
          QUALITIES
        </th>
        <th>
          EXPERIENCE
        </th>
        <th>
          SHORTLIST
        </th>
      </tr>
         <%while(rs.next()) { %>
    </thead>
    <tfoot>
   
    </tfoot>
    <tbody>
      <tr>
       <tr>
        <td data-title='jid'>
          <%=rs.getInt(1) %>
        </td>
        <td data-title='jtitle'>
          <%=rs.getString(3)%>
        </td>
        <td data-title='jobdesc'>
          <%=rs.getString(4)%>
        </td>
        <td data-title='salaryrange'>
          <%=rs.getString(5)%>
        </td>
        <td data-title='wualities'>
          <%=rs.getString(6)%>
        </td>
         <td data-title='experience'>
          <%=rs.getInt(7)%>
        </td>
         <td data-title='experience'>
          <button>  <a  href="short.jsp?jid=<%=rs.getInt(1)%>">short</a></button>
        </td>
        
     
      <tr>
      <%} %>
       <center>
      <a href = "adminpage.html"> 
      <marquee  height=25px behavior="alternate" bgcolor="HotPink" width = "50%">GO BACK TO MAIN MENU</marquee>
      </a>
    </center>
       
       
      </tr>
    </tbody>
  </table>
  <div class='detail'>
    <div class='detail-container'>
      <dl>
        <dt>
          Provider Name
        </dt>
        <dd>
          John Doe
        </dd>
        <dt>
          E-mail
        </dt>
        <dd>
          email@example.com
        </dd>
        <dt>
          City
        </dt>
        <dd>
          Detroit
        </dd>
        <dt>
          Phone-Number
        </dt>
        <dd>
          555-555-5555
        </dd>
        <dt>
          Last Update
        </dt>
        <dd>
          Jun 20 2014
        </dd>
        <dt>
          Notes
        </dt>
        <dd>
          Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.
        </dd>
      </dl>
    </div>
    <div class='detail-nav'>
      <button class='close'>
        Close
      </button>
    </div>
  </div>
</main>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>

</body>
</html>
     
