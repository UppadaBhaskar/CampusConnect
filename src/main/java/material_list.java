

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;


public class material_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> l=new ArrayList<>();

		List<String> material_names=new ArrayList<>();

		String material_name=request.getParameter("material_name");

		String department=request.getParameter("Branch");

		String subject=request.getParameter("Subject");
		System.out.println(material_name+department+subject);
		 try (Connection connection = Database.getConnection()) {
             String sql = "SELECT file_location,material_name FROM material WHERE";
             if(material_name!="") {
            	 sql+=" material_name='"+material_name+"' AND ";
             }
             if(department!="") {
            	 sql+=" department='"+department+"'";
             }
             if(subject!=null) {
            	 sql+=" AND subject='"+subject+"'";
             }
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql);
             int flag=0;
             
             while(rs.next()) {
            	 flag=1;
            	 l.add(rs.getString("file_location"));
            	 material_names.add(rs.getString("material_name"));
             }
             if(flag==0) {
            	 
            	
            	 request.setAttribute("msg", "No files found...");
                 request.getRequestDispatcher("material_download.jsp").forward(request, response);

            	 
             }
             request.setAttribute("list", l);
             request.setAttribute("material_names", material_names);
             request.getRequestDispatcher("material_download.jsp").forward(request, response);
         } catch (SQLException e) {
             e.printStackTrace();
             throw new ServletException("Database operation failed", e);
         }

		
	}

}
