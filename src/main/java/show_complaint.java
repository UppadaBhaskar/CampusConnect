

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.Database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class show_complaint
 */
public class show_complaint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<List<String>> subjects = new ArrayList<>();
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT * FROM complaint";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
            	List<String> l = new ArrayList<>();
            	
            	l.add(resultSet.getString("complaint_subject"));
                l.add(resultSet.getString("complaint_message"));
                subjects.add(l);  
                }
            request.setAttribute("subjects", subjects);
            request.getRequestDispatcher("display_complaint.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

}
