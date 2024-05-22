package test;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class add_regulation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String regulationName = request.getParameter("regulationName");

        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO regulations (Regulation_name) VALUES (?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, regulationName);
            
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                PrintWriter out = response.getWriter();
                out.println("<html><body><h2>Regulation inserted successfully!</h2></body></html>");
            } else {
                PrintWriter out = response.getWriter();
                out.println("<html><body><h2>Failed to insert regulation!</h2></body></html>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database operation failed", e);
        }
    }
}
