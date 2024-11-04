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

/**
 * Servlet implementation class createhr
 */
@WebServlet("/createhr")
public class createhr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createhr() {
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
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			long mno = Long.parseLong(request.getParameter("mno"));
			String psw = request.getParameter("psw");
			String city = request.getParameter("city");
			
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
			response.sendRedirect("viewhr.jsp");
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		
	}

}
