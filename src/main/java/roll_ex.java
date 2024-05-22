import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class roll_ex extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> rollNumbers = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedstatement = null;
        ResultSet resultSet = null;
        
        String Examination_Type=request.getParameter("Examination_Type");
        String Regulation = request.getParameter("Regulation");
        String Year=request.getParameter("Year");
        String Semester=request.getParameter("Semester");
        String Branch = request.getParameter("Branch");
        String Subject=request.getParameter("Subject");
        String table_name=Regulation+'_'+Branch+'_'+Semester+'_'+Examination_Type;

        int flag=0;
        
        try {
            connection = Database.getConnection();
            preparedstatement = connection.prepareStatement("SELECT roll_number FROM "+table_name);
            
            
            
            
            resultSet = preparedstatement.executeQuery();
            
            while (resultSet.next()) {
            	flag=1;
            	
                rollNumbers.add(resultSet.getString("roll_number"));
                
            }
            if(flag==0 ) {
            	response.setContentType("text/plain");
            	response.getWriter().println("No students information is uploaded in to database");            	
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.closeResultSet(resultSet);
            Database.closeStatement(preparedstatement);
            Database.closeConnection(connection);
        }
        
        System.out.println(Examination_Type+","+Regulation+","+Year);

        
        
        
        if(flag==1) {
        request.setAttribute("rollNumbers", rollNumbers);
        request.setAttribute("Examination_Type", Examination_Type);
        request.setAttribute("Regulation", Regulation);
        request.setAttribute("Year", Year);
        request.setAttribute("Semester", Semester);
        request.setAttribute("Branch", Branch);
        request.setAttribute("Subject", Subject);
        
        request.getRequestDispatcher("roll_ex1.jsp").forward(request, response);
        }
    }
}