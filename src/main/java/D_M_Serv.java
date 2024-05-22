import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;

import com.mysql.cj.protocol.Message;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/D_M_Serv")
public class D_M_Serv extends HttpServlet {
    private static Connection connection = null;
    private static PreparedStatement preparedStatement = null;
    private static ResultSet rs=null;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	final long serialVersionUID = 1L;
    	String decodedText = request.getParameter("decodedText");
    	System.out.println(decodedText);
    	
        
   	 Time currentTime = new Time(System.currentTimeMillis());

        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        String formattedTime = sdf.format(currentTime);

       
           String[] parts = formattedTime.split(":");
           int hours = Integer.parseInt(parts[0]);
           int minutes = Integer.parseInt(parts[1]);
           
    	try {
            connection = Database.getConnection();
            String sqlQuery1="select name from student where roll_number=?";
            PreparedStatement ps1=connection.prepareStatement(sqlQuery1);
            ps1.setString(1,decodedText);
            rs=ps1.executeQuery();
            if(rs.next()) {
            	
            
            int i=1;
            
            if (hours ==9 && minutes > 10) {
            	String sqlQuery = "INSERT INTO delay (roll_number, late_tag, report_time, date, attendance) VALUES (?, ?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(sqlQuery);
                preparedStatement.setString(++i, "Late");
            }else if (hours <= 9 && (hours>7 && minutes>30)){
            	String sqlQuery = "INSERT INTO delay (roll_number, report_time, date, attendance) VALUES (?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(sqlQuery);
                
            }
            else if (hours > 9 && hours<13 ){
            	String sqlQuery = "INSERT INTO delay (roll_number, report_time, date, attendance, AN_attendance) VALUES ( ?, ?, ?, ?, ?)";
            	
                preparedStatement = connection.prepareStatement(sqlQuery);
                preparedStatement.setString(5, "AN");
            }
            
            
            preparedStatement.setString(1, decodedText); // Example roll_number
            preparedStatement.setTime(++i, new Time(System.currentTimeMillis())); // Example report_time
            preparedStatement.setDate(++i, new Date(System.currentTimeMillis())); // Example date
            preparedStatement.setString(++i, "Present"); // Example attendance
            

            preparedStatement.executeUpdate();

            System.out.println("Data inserted successfully.");
            }

        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
      System.out.println("Decoded Text1: " + decodedText);
      
      response.setContentType("text/plain");
      
      response.getWriter().write("Received: " + decodedText);
    }
}
