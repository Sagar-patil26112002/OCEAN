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
 * Servlet implementation class addjobs
 */
@WebServlet("/addjobs")
public class addjobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addjobs() {
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
		
			String jtitle = request.getParameter("name");
			String jdesc = request.getParameter("desc");
			String salary = request.getParameter("salary");
			String qualitiess = request.getParameter("qualities");
			int experience = Integer.parseInt(request.getParameter("experience"));
			
			Connection cn = dbconnection.connects();
			PreparedStatement stmt = cn.prepareStatement("insert into jobs values(?,?,?,?,?,?,?)");
			
            stmt.setInt(1, 0);
            stmt.setInt(2, GetSet.getHid());
            stmt.setString(3, jtitle);
            stmt.setString(4, jdesc);
            stmt.setString(5, salary);
            stmt.setString(6, qualitiess);
            stmt.setInt(7, experience);
            
            int i = stmt.executeUpdate();
            if(i>0){
            	response.sendRedirect("viewjobs.jsp");
            }else{
            	response.sendRedirect("addjobs.html");
            }
            
            
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
