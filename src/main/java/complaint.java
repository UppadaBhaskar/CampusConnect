

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class complaint
 */
public class complaint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        String subject=request.getParameter("subject");
        String complaint = request.getParameter("complaint");
        
        
        
        
        try {
            connection = Database.getConnection();
            
            String sql = "Insert into complaint (complaint_subject,complaint_message) values(?,?)";
            preparedStatement = connection.prepareStatement(sql);
            
           
                preparedStatement.setString(1,subject);
                preparedStatement.setString(2, complaint);
                preparedStatement.executeUpdate();
            
            
                request.setAttribute("message", "Submitted successfully");
    	        
    	        request.getRequestDispatcher("complaint.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.closeStatement(preparedStatement);
            Database.closeConnection(connection);
        }
		
	}

}
