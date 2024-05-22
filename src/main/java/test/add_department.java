package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class add_department extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departmentName = request.getParameter("departmentName");

        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO department (department_name) VALUES (?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, departmentName);
            
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("message", "Department added successfully!");
            } else {
                request.setAttribute("message", "Failed to add department!");
            }
            request.getRequestDispatcher("add_department.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database operation failed", e);
        }
    }
}
