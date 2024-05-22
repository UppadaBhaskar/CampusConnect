package test;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class feed extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String department=request.getParameter("Branch");
    	String subject=request.getParameter("Subject");
    	String semester=request.getParameter("Semester");
    	String regulation=request.getParameter("Regulation");
    	String rating1=request.getParameter("rating1");
    	String rating2=request.getParameter("rating2");
    	String rating3=request.getParameter("rating3");
    	String rating4=request.getParameter("rating4");
    	String rating5=request.getParameter("rating5");
    	String rating6=request.getParameter("rating6");
    	String rating7=request.getParameter("rating7");
    	String rating8=request.getParameter("rating8");
    	String rating9=request.getParameter("rating9");
    	String rating10=request.getParameter("rating10");
    	String feedback=request.getParameter("feedback");
    	String faculty_name=request.getParameter("faculty");

    	
    	
    	
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = Database.getConnection();
            
            String sql = "INSERT INTO faculty_rating (department, subject, semester, regulation, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10,feedback,faculty_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, department);
            pstmt.setString(2, subject);
            pstmt.setString(3, semester);
            pstmt.setString(4, regulation);
            pstmt.setString(5, rating1);
            pstmt.setString(6, rating2);
            pstmt.setString(7, rating3);
            pstmt.setString(8, rating4);
            pstmt.setString(9, rating5);
            pstmt.setString(10, rating6);
            pstmt.setString(11, rating7);
            pstmt.setString(12, rating8);
            pstmt.setString(13, rating9);
            pstmt.setString(14, rating10);
            pstmt.setString(15, feedback);
            pstmt.setString(16, faculty_name);

            pstmt.executeUpdate();
            request.setAttribute("msg", "submitted successfully");
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        
    	

        RequestDispatcher rd=request.getRequestDispatcher("feed.jsp");
        
   	 	rd.forward(request, response);

        


    }
}
