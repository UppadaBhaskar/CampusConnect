package test;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class add_student extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	    String rollNumber = request.getParameter("rollNumber");
    	    String name = request.getParameter("name");
    	    String phoneNumber = request.getParameter("phoneNumber");
    	    String email = request.getParameter("email");
    	    String parentNumber = request.getParameter("parentNumber");
    	    String address = request.getParameter("address");
    	    String age = request.getParameter("age");
    	    String department = request.getParameter("department");
    	    String regulation = request.getParameter("regulation");

    	    if (parentNumber == null || parentNumber.trim().isEmpty()) {
    	        parentNumber = null; 
    	    }
    	    if (address == null || address.trim().isEmpty()) {
    	        address = null; 
    	    }
    	    if (age == null || age.trim().isEmpty()) {
    	        age = null; 
    	    }

    	    try (Connection conn = Database.getConnection()) {
    	        String sql = "INSERT INTO student (roll_number, name, phone_number, email, parent_number, address, age, department, regulation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    	        PreparedStatement statement = conn.prepareStatement(sql);
    	        statement.setString(1, rollNumber);
    	        statement.setString(2, name);
    	        statement.setString(3, phoneNumber);
    	        statement.setString(4, email);
    	        statement.setString(5, parentNumber);
    	        statement.setString(6, address);
    	        statement.setString(7, age);
    	        statement.setString(8, department);
    	        statement.setString(9, regulation);
    	        
    	        int rowsInserted = statement.executeUpdate();
    	        if (rowsInserted > 0) {
    	            request.setAttribute("message", "Student added successfully!");
    	        } else {
    	            request.setAttribute("message", "Failed to add student!");
    	        }
    	        request.getRequestDispatcher("add_student.jsp").forward(request, response);
    	    } catch (SQLIntegrityConstraintViolationException e) {
    	        e.printStackTrace(); 
    	        request.setAttribute("message", "Duplicate entry: The student with the provided roll number already exists.");
    	        request.getRequestDispatcher("add_student.jsp").forward(request, response);
    	    }catch (SQLException e) {
    	        e.printStackTrace();
	        	request.setAttribute("message", "Database operation failed");

    	        throw new ServletException("Database operation failed", e);
    	    }
    	}

    }

