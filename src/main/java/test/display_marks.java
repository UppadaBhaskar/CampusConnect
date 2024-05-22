package test;

import java.io.IOException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class display_marks extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 Map<String, List<Object>> rowData = new HashMap<>();
         List<String> columnNames = new ArrayList<>();

    	 String Regulation = request.getParameter("Regulation");
         String department = request.getParameter("Branch");
         String semester = request.getParameter("Semester");
         String Examination_Type = request.getParameter("Examination_Type");
         
         String table_name=Regulation+'_'+department+'_'+semester+'_'+Examination_Type;
    	 
    	 
         try (Connection conn = Database.getConnection()) {
             String sql = "SELECT * FROM " + table_name;
             Statement statement = conn.createStatement();
             ResultSet rs = statement.executeQuery(sql);

             ResultSetMetaData metaData = rs.getMetaData();
             int columnCount = metaData.getColumnCount();
             for (int i = 1; i <= columnCount; i++) {
                 String columnName = metaData.getColumnName(i);
                 columnNames.add(columnName);
             }
             

             while (rs.next()) {
                 String rollNumber = rs.getString("roll_number");
                 List<Object> values = new ArrayList<>();

                 for (int i = 1; i <= columnCount; i++) {
                     values.add(rs.getObject(i));
                 }

                 rowData.put(rollNumber, values);
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
         for (Map.Entry<String, List<Object>> entry : rowData.entrySet()) {
             System.out.println("Roll Number: " + entry.getKey());
             System.out.println("Values: " + entry.getValue());
             System.out.println("-------------------------");
         }
         request.setAttribute("rowData", rowData);
         request.setAttribute("columnNames", columnNames);
         RequestDispatcher dispatcher = request.getRequestDispatcher("display_marks.jsp");
         dispatcher.forward(request, response);
    	

    }
}
