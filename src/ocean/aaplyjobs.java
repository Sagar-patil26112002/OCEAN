package ocean;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import ocean.*;

/**
 * Servlet implementation class aaplyjobs
 */
@WebServlet("/aaplyjobs")
public class aaplyjobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aaplyjobs() {
        super();
        // TODO Auto-generated constructor stub
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
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
