import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

       
        try {
            
            Connection connection = Database.getConnection();

            // SQL query to insert contact information into the database
            String sql = "INSERT INTO contacts (name, email, message) VALUES (?, ?, ?)";

            // Prepare the statement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, message);

            // Execute the query
            statement.executeUpdate();

            request.setAttribute("msg", "Submitted Successfully");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Submission Failed");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        }
    }
}
