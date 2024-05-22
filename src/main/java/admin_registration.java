import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class admin_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		Connection con = null;
        
         PreparedStatement ps=null;
         
	 try {
            con = Database.getConnection();
            PreparedStatement ps1=con.prepareStatement("select name from admin where email=?");
            ps1.setString(1,email);
            ResultSet rs1 = ps1.executeQuery();
            
            if(rs1.next()) {
            	request.setAttribute("msg","User already exists.");
            	RequestDispatcher rd=request.getRequestDispatcher("admin_register.jsp");
           	 rd.forward(request, response);
            }else {
            	ps=con.prepareStatement("insert into admin(name,email,password) values(?,?,?) ");	
            	System.out.println(name+" "+password);
                ps.setString(1,name);
                ps.setString(2,email);
                ps.setString(3,password);
                
                
                ps.executeUpdate();
            	request.setAttribute("msg","registered successfully");

                
                RequestDispatcher rd=request.getRequestDispatcher("admin_login.jsp");
                
           	 	rd.forward(request, response);
           	 	
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 

        
		
		
	
	}

}
