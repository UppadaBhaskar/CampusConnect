import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class Getting_a_row_along_withIts_column_name {
    public static void main(String[] args) {
       
        String url = "jdbc:mysql://localhost:3306/aliet"; // Replace 'database_name' with your database name
        String username = "root"; // Replace 'your_username' with your MySQL username
        String password = "9848@Mysql"; // Replace 'your_password' with your MySQL password
        String tableName = "student"; // Replace 'your_table_name' with your table name
        
        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM " + tableName;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            ResultSetMetaData metaData = resultSet.getMetaData();
            
            int columnCount = metaData.getColumnCount();
            
            // Print column names
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(metaData.getColumnName(i) + "\t");
            }
            System.out.println();
            
            // Print row data
            while (resultSet.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(resultSet.getString(i) + "\t");
                }
                System.out.println();
            }
            
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
