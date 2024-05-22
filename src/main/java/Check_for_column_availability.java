import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Check_for_column_availability extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 Connection connection = null;
     ResultSet resultSet1 = null;
     
     String Examination_Type = request.getParameter("Examination_Type");
     String Regulation = request.getParameter("Regulation");
     String Year = request.getParameter("Year");
     String Semester = request.getParameter("Semester");
     String Branch = request.getParameter("Branch");
     String Subject = request.getParameter("Subject");
     
     String table_name=Regulation+'_'+Branch+'_'+Semester+'_'+Examination_Type;
     System.out.println(table_name);
     
     try {
      
         connection = Database.getConnection();
         
         DatabaseMetaData metaData = connection.getMetaData();
         resultSet1 =metaData.getTables(null, null, table_name, null);
         
         request.setAttribute("Examination_Type", Examination_Type);
         request.setAttribute("Regulation", Regulation);
         request.setAttribute("Year", Year);
         request.setAttribute("Semester",Semester);
         request.setAttribute("Branch", Branch);
         request.setAttribute("Subject", Subject);
         
         if (resultSet1.next()) {
             
        	 ResultSet rs=metaData.getColumns(null, null, table_name, Subject);
        	 if(rs.next()) {
        		 System.out.println("TABLE YES,COLUMN YES");
        		 RequestDispatcher rd=request.getRequestDispatcher("Edit_button_test.jsp");
            	 
                 rd.forward(request, response);
        		 
        	 }
        	 else {
        		 String sql = "ALTER TABLE " + table_name + " ADD COLUMN " + Subject + " INT";
        		 Statement statement = connection.createStatement();
            	 statement.executeUpdate(sql);
        		 
        		 RequestDispatcher rd=request.getRequestDispatcher("/roll_ex");
                 rd.forward(request, response);
        		 
        	 }
        	
             
         } else {        	 
        	 String createTableSQL = "CREATE TABLE IF NOT EXISTS "+table_name+" (roll_number varchar(15)  PRIMARY KEY NOT NULL , "+Subject+ " varchar(50))";
        	 Statement statement = connection.createStatement();
        	 statement.executeUpdate(createTableSQL);
        	 String sql = "INSERT INTO "+table_name+" (roll_number) " +
                     "SELECT roll_number FROM student WHERE regulation = ? AND department = ?";
        	 PreparedStatement ps = connection.prepareStatement(sql);
        	 ps.setString(1, Regulation);
        	 ps.setString(2, Branch);
        	 ps.executeUpdate();
        	 
        

        	 
        	 
        	 RequestDispatcher rd=request.getRequestDispatcher("/roll_ex");
             rd.forward(request, response);
         }               
         
         
         
         
     } catch (SQLException e) {
         e.printStackTrace();
     } finally {
         Database.closeResultSet(resultSet1);
         Database.closeConnection(connection);
     }
     
	}

}
