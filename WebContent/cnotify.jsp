<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="ocean.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="table.css">
</head>
<body>

       <%
       Connection cn = dbconnection.connects();
       String name="";
       String jname="",salary="";
       int jid=0, i=0;
       String email= request.getParameter("email");
       
       
       PreparedStatement stmt4= cn.prepareStatement("select cname from candidate where cemail=?");
       stmt4.setString(1, email);
       
       ResultSet rs4 = stmt4.executeQuery();
       if(rs4.next()){
    	   i=8;
       }
       else{
    	   response.sendRedirect("cmail.html");
       }
       
       if(i==8){
    	   
       
       PreparedStatement stmt= cn.prepareStatement("select * from notification where email=?");
       stmt.setString(1, email);
       
       ResultSet rs = stmt.executeQuery();
       
       while(rs.next()){
    	   jid = rs.getInt(1);
    	   name = rs.getString(2);
    	   i=4;
    	  
       }
       
       
	   PreparedStatement stmt2 = cn.prepareStatement("select jname,salary from jobs where jid=?");
	   stmt2.setInt(1,jid);
	   ResultSet rs1= stmt2.executeQuery();
	   
	   while(rs1.next()){
		   jname= rs1.getString(1);
		   salary= rs1.getString(2);
		   
	   }
       
  
       if(i==4){
    	   
     %>
    	     <h1>
    	  VIEW NOTIFICATION 
    	</h1>
    	<p>
    	</p>
    	
    	  <table>
    	    <thead>
    	      <tr>
    	        <th>
    	          NOTIFICATION
    	        </th>
    	      </tr>
    	         
    	    </thead>
    	    <tfoot>
    	      <tr>
    	       
    	      </tr>
    	    </tfoot>
    	    <tbody>
    	      <tr>
    	       <tr>
    	        <td data-title='jid'>
    	          <%= "congratulation " +name+ " you are selected for the next round you apply for the job as "+jname+ " and salary between range "+salary+ " wish you all the best for next round" %>
    	        </td>
    	        
    	        
    	      </tr>
    	     
    	      <tr>
    	      <%} %>
    	      <%}
       
               
       
       
       
               %>
    	     <center>
    	      <a href = "index.html"> 
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
    	
    	<!-- partial -->
    	  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>
    	  
       
       
       
       
       





</body>
</html>