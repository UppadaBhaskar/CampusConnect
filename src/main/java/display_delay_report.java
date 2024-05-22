

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
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


public class display_delay_report extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Map<String, List<Object>> rowData = new HashMap<>();
         List<String> columnNames = new ArrayList<>();

//    	 String Regulation = request.getParameter("Regulation");
//         String department = request.getParameter("Branch");
//         String semester = request.getParameter("Semester");
         String duration = request.getParameter("Duration");
         String roll_number=request.getParameter("roll_number");
         
         
         
    	 
    	 
         try (Connection conn = Database.getConnection()) {
             String sql = "SELECT * FROM delay WHERE " ;
             
             
             
            	 if(duration.equals("week")) {
            		 sql+=" date >= DATE_SUB(CURDATE(), INTERVAL 1 WEEK)\r\n"
            		 		+ "  AND date < CURDATE()";
            		 
            		 
            	 }
            	 else if(duration.equals("month")) {
            		 sql+=" YEAR(date) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)\r\n"
            		 		+ "AND MONTH(date) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)";
            		 
            	 }
             
             
             
            	 sql+="and roll_number=?";
             
             
             
            	 PreparedStatement ps = conn.prepareStatement(sql);
            	 ps.setString(1, roll_number);
                 ResultSet rs = ps.executeQuery();
                 
                 ResultSetMetaData metaData = rs.getMetaData();
                 int columnCount = metaData.getColumnCount();
             for (int i = 1; i <= columnCount; i++) {
                 String columnName = metaData.getColumnName(i);
                 columnNames.add(columnName);
             }
             
             int late_count=0;
             int attended_count=0;
             while (rs.next()) {
                 String rollNumber = rs.getString("roll_number");
                 List<Object> values = new ArrayList<>();

                 for (int i = 1; i <= columnCount; i++) {
                	 
                	 if (rs.getObject(i) != null) {
                	        values.add(rs.getObject(i));
                	    } else {
                	        // Handle the case where the value is null
                	        values.add("null"); // Or any other appropriate handling
                	    }
                	 
                     
                 }System.out.println(values);
                 
                 System.out.println(values.get(4));
                 
                 if(!values.get(1).equals("null")&& (values.get(1).equals("Late") || values.get(1).equals("late"))) {
                	 System.out.println(values.get(1));
                	 late_count++;
                 }
                 
                 if(!values.get(4).equals("null") && (values.get(4).equals("Present") || values.get(4).equals("present"))) {
                	 attended_count++;
                     System.out.println(values.get(4));

                 }
                 

                 rowData.put(rollNumber, values);
             }
             request.setAttribute("late_count", late_count);
             request.setAttribute("attended_count", attended_count);
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
         RequestDispatcher dispatcher = request.getRequestDispatcher("display_delay_report.jsp");
         dispatcher.forward(request, response);
    	
	}

}
