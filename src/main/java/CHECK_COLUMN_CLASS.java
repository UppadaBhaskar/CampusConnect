import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CHECK_COLUMN_CLASS{
    public static void main(String args[]) {
        String url = "jdbc:mysql://localhost:3306/aliet"; 
        String username = "root"; 
        String password = "9848@Mysql"; 
        String tableName = "student";
        String columnName = "roll"; 
        
        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet resultSet = metaData.getColumns(null, null, tableName, columnName);
            
            if (resultSet.next()) {
                System.out.println("Yes");
            } else {
                System.out.println("No");
            }
            
            resultSet.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
