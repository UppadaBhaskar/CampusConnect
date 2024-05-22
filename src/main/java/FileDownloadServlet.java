
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class FileDownloadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        if (fileName != null && !fileName.isEmpty()) {
            String uploadDirectory = "C:\\Users\\UPPADA BHASKAR\\Desktop\\sc\\"; 

            File file = new File(uploadDirectory + fileName);

            if (file.exists()) {
                response.setContentType("application/pdf"); 
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

                FileInputStream fis = new FileInputStream(file);
                int c;
                while ((c = fis.read()) != -1) {
                    response.getOutputStream().write(c);
                }
                fis.close();
            } else {
                response.getWriter().println("File not found: " + fileName);
            }
        } else {
            response.getWriter().println("File name not provided.");
        }
    }
}
