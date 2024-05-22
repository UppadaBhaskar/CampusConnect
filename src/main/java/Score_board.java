import java.io.IOException;
import java.io.PrintWriter;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Score_board extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String parameter1 = request.getParameter("Examination_Type");
        String parameter2 = request.getParameter("Regulation");
        String parameter3 = request.getParameter("Year");
        String parameter4 = request.getParameter("Semester");
        String parameter5 = request.getParameter("Branch");
        String parameter6 = request.getParameter("Subject");

        String htmlResponse = "<!DOCTYPE html>" +
                              "<html lang=\"en-GB\">" +
                              "<head>" +
                              "<meta charset=\"UTF-8\">" +
                              "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
                              "<title>Submitted Values</title>" +
                              "</head>" +
                              "<body>" +
                              "<h2>Submitted Values</h2>" +
                              "<p>Parameter 1: " + parameter1 + "</p>" +
                              "<p>Parameter 2: " + parameter2 + "</p>" +
                              "<p>Parameter 3: " + parameter3 + "</p>" +
                              "<p>Parameter 4: " + parameter4 + "</p>" +
                              "<p>Parameter 5: " + parameter5 + "</p>" +
                              "<p>Parameter 6: " + parameter6 + "</p>" +
                              "</body>" +
                              "</html>";

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println(htmlResponse);
 
    }
}
