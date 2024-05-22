

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.Database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class display_faculty_feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Map<String, List<Object>> rowData = new HashMap<>();
         List<String> columnNames = new ArrayList<>();

    	 String regulation = request.getParameter("Regulation");
         String department = request.getParameter("Branch");
         String semester = request.getParameter("Semester");
         String faculty = request.getParameter("faculty");
         
    	 
    	 
         try (Connection conn = Database.getConnection()) {
             String sql = "SELECT * FROM faculty_rating where regulation=? and department=? and semester=? and faculty_name=?";
             PreparedStatement ps = conn.prepareStatement(sql);
             ps.setString(1, regulation);
             ps.setString(2, department);
             ps.setString(3, semester);
             ps.setString(4, faculty);
             ResultSet rs = ps.executeQuery();

             ResultSetMetaData metaData = rs.getMetaData();
             int columnCount = metaData.getColumnCount();
             for (int i = 1; i <= columnCount; i++) {
                 String columnName = metaData.getColumnName(i);
                 columnNames.add(columnName);
             }
             

             while (rs.next()) {
                 String id = rs.getString("id");
                 List<Object> values = new ArrayList<>();

                 for (int i = 1; i <= columnCount; i++) {
                     values.add(rs.getObject(i));
                 }

                 rowData.put(id, values);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
      
         request.setAttribute("rowData", rowData);
         request.setAttribute("columnNames", columnNames);
         RequestDispatcher dispatcher = request.getRequestDispatcher("display_faculty_feedback.jsp");
         dispatcher.forward(request, response);
    	
	}

}
