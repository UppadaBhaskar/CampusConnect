

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Edit_marks extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        String Examination_Type=request.getParameter("Examination_Type");
        String Regulation = request.getParameter("Regulation");
        String Year=request.getParameter("Year");
        String Semester=request.getParameter("Semester");
        String Branch = request.getParameter("Branch");
        String Subject=request.getParameter("Subject");
        
        String Dept_sem=Regulation+'_'+Branch+'_'+Semester+'_'+Examination_Type;
        
        try {
            connection = Database.getConnection();
            
            String sql = "UPDATE "+Dept_sem +" SET "+Subject+"=? where roll_number=?";
            preparedStatement = connection.prepareStatement(sql);
            
           
                preparedStatement.setInt(1,Integer.parseInt(request.getParameter("mark")));
                preparedStatement.setString(2, request.getParameter("roll_number"));
                preparedStatement.executeUpdate();
            
            
                request.setAttribute("message", "Updated Successfully!");
    	        
    	        request.getRequestDispatcher("Edit_button_test.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.closeStatement(preparedStatement);
            Database.closeConnection(connection);
        }
	}

}
