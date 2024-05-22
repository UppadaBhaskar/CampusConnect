import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class marks_sub extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        String Examination_Type = request.getParameter("Examination_Type");
        String Regulation = request.getParameter("Regulation");
        String Year = request.getParameter("Year");
        String Semester = request.getParameter("Semester");
        String Branch = request.getParameter("Branch");
        String Subject = request.getParameter("Subject");
        
        String table_name=Regulation+'_'+Branch+'_'+Semester+'_'+Examination_Type;
        
        try {
            connection = Database.getConnection();
                String sql1 = "UPDATE "+table_name+" SET "+Subject+" = ? where roll_number=?";
                preparedStatement = connection.prepareStatement(sql1);
                
                for (String rollNumber : request.getParameterMap().keySet()) {
                	
                    String mark = request.getParameter(rollNumber);
                    
                    preparedStatement.setString(1, mark);
                    preparedStatement.setString(2,rollNumber);
                    preparedStatement.executeUpdate();
                }            
            response.sendRedirect("Marks_added.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.closeStatement(preparedStatement);
            Database.closeConnection(connection);
        }
    }
}
