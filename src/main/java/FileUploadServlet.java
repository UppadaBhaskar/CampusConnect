import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, 
    maxFileSize = 1024 * 1024 * 10,      
    maxRequestSize = 1024 * 1024 * 100  
)
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String department = request.getParameter("Branch");
        String subject = request.getParameter("Subject");
        String material_name = request.getParameter("material_name");
        
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String file_location = "C:\\Users\\UPPADA BHASKAR\\Desktop\\sc\\" + fileName;

        try {
            long fileSize = filePart.getSize();
            if (fileSize > 1024 * 1024 * 10) { // Max file size is 10 MB
                throw new IOException("File size exceeds the maximum limit (10 MB).");
            }

            File existingFile = new File(file_location);
            if (existingFile.exists()) {
                throw new IOException("A file with the same name already exists. Please choose a different file name.");
            }

            try (InputStream fileInputStream = filePart.getInputStream();
                 OutputStream fileOutputStream = new FileOutputStream(file_location)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                    fileOutputStream.write(buffer, 0, bytesRead);
                }
            }

            try (Connection connection = Database.getConnection()) {
                String sql = "INSERT INTO material (department, subject, material_name, file_location) VALUES (?, ?, ?, ?)";
                PreparedStatement ps = connection.prepareStatement(sql);

                ps.setString(1, department);
                ps.setString(2, subject);
                ps.setString(3, material_name);
                ps.setString(4, fileName);

                int rowsInserted = ps.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("A new material record was inserted successfully!");
                } else {
                    System.out.println("Failed to insert material record!");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Database operation failed", e);
            }

            request.setAttribute("msg", "File Uploaded Successfully");
            request.getRequestDispatcher("material_upload.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("material_upload.jsp").forward(request, response);
        }
    }
}
