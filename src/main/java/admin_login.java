

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		 Connection con = null;
	        Statement stmt = null;
	         ResultSet rs = null;
	         PreparedStatement ps=null;
		 try {
	            con = Database.getConnection();
	            ps=con.prepareStatement("select name from admin where email=? and password=? ");	
	            System.out.println(email+" "+password);
	            ps.setString(1,email);
	            ps.setString(2,password);
	            rs = ps.executeQuery();
	             if (rs.next()){ 
	            	 
	            	 RequestDispatcher rd=request.getRequestDispatcher("home_page_admin.jsp");
	            	 rd.forward(request, response);
	            	 
	             }
	             else {
	            	 request.setAttribute("msg1", "Login Failed");
	            	 RequestDispatcher rd=request.getRequestDispatcher("home_page_admin.jsp");
	            	 rd.forward(request, response);
	            	 
	            	 
	             }
	             
	            	 
	            	 
	             
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } 
	}

}
