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

String ans[]= new String [20];
ans[0]=request.getParameter("q1");
ans[1]=request.getParameter("q2");
ans[2]=request.getParameter("q3");
ans[3]=request.getParameter("q4");
ans[4]=request.getParameter("q5");
ans[5]=request.getParameter("q6");
ans[6]=request.getParameter("q7");
ans[7]=request.getParameter("q8");
ans[8]=request.getParameter("q9");
ans[9]=request.getParameter("q10");
ans[10]=request.getParameter("q11");
ans[11]=request.getParameter("q12");
ans[12]=request.getParameter("q13");
ans[13]=request.getParameter("q14");
ans[14]=request.getParameter("q15");
ans[15]=request.getParameter("q16");
ans[16]=request.getParameter("q17");
ans[17]=request.getParameter("q18");
ans[18]=request.getParameter("q19");
ans[19]=request.getParameter("q20");

int o=0,c=0,e=0,a=0,n=0;
int i=0;


	
	Connection cn= dbconnection.connects();
	PreparedStatement stmt= cn.prepareStatement("select * from test where id=?");
	
	for(i=1;i<=20;i++){
	
		stmt.setInt(1, i);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		String result = null;
		
		if(ans[i-1].equals("Strongly Disagree")){
			result = rs.getString(3);
		}
		else
			if(ans[i-1].equals("Disagree")){
				result = rs.getString(4);
			}
			else
				if(ans[i-1].equals("Neutral")){
					result = rs.getString(5);
				}
				else
					if(ans[i-1].equals("Agree")){
						result = rs.getString(6);
					}
					else
						if(ans[i-1].equals("Strongly Agree")){
							result = rs.getString(7);
						}
		
		switch(result.charAt(0)){
		
		case 'o': 
			 o+= Character.getNumericValue(result.charAt(1));
			 break;
			 
		case 'c':
			 c+= Character.getNumericValue(result.charAt(1));
			 break;
			 
		case 'e':
			 e+= Character.getNumericValue(result.charAt(1));
			 break;
			 
		case 'a':
			 a+= Character.getNumericValue(result.charAt(1));
			 break;
			 
		case 'n':
			 n+= Character.getNumericValue(result.charAt(1));
			 break;
		
		}
		
	}
	
	
	PreparedStatement stmt2 = cn.prepareStatement("update candidate set o=?,c=?,e=?,a=?,n=? where cemail=?");
	stmt2.setString(6, GetSet.getCemail());
	stmt2.setInt(1,o);
	stmt2.setInt(2,c);
	stmt2.setInt(3,e);
	stmt2.setInt(4,a);
	stmt2.setInt(5,n);
	
	int j = stmt2.executeUpdate();
	if(j>0){
		response.sendRedirect("../../index.html");
	}

%>

</body>
</html>