package ocean;

import java.io.IOException;

//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class admincheck
 */
@WebServlet("/admincheck")
public class admincheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public admincheck() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
			
			String email = request.getParameter("email");
			String psw = request.getParameter("psw");
			
			
			Connection cn = dbconnection.connects();
			PreparedStatement stmt = cn.prepareStatement("select aname from admin where aemail=? and apsw=?");
		
	        stmt.setString(1, email);
	        stmt.setString(2, psw);
	        
	        ResultSet rs = stmt.executeQuery();
	        
	        if(rs.next()){
	        	GetSet.setAname(rs.getString(1));
	        	GetSet.setAemail(email);
	        	GetSet.setApsw(psw);
	        	
	        	response.sendRedirect("pages/tables/ok.jsp");
	        }else{
	        	
	        	
	        	response.sendRedirect("alogin.html");
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
