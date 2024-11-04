package ocean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class hrlogins
 */
@WebServlet("/hrlogins")
public class hrlogins extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hrlogins() {
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
			
			String email = request.getParameter("email");
			String psw = request.getParameter("psw");
		
			Connection cn = dbconnection.connects();
			PreparedStatement stmt = cn.prepareStatement("select hid from hr where hemail=? and hpws=?");
			stmt.setString(1, email);
			stmt.setString(2, psw);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				GetSet.setHid(rs.getInt(1));
			    response.sendRedirect("hrpage.html");
			}else{
				response.sendRedirect("hrlogin.html");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
