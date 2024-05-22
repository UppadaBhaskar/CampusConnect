package test;
import java.sql.*;

public class tableNameStatrWithR20 {
    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/aliet", "root", "9848@Mysql")) {
            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet resultSet = metaData.getTables(null, null, "R20%", new String[]{"TABLE"});
            
            while (resultSet.next()) {
                String tableName = resultSet.getString("TABLE_NAME");
                System.out.println("Table Name: " + tableName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
