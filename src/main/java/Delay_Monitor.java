import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Date;
public class Delay_Monitor {
	

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/aliet";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "9848@Mysql";
    

    private static Connection connection = null;
    private static PreparedStatement preparedStatement = null;

    public static void main(String[] args) {
        try {
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);

            String sqlQuery = "INSERT INTO new_table (roll_number, late_tag, report_time, date, attendance, AN_attendance) VALUES (?, ?, ?, ?, ?, ?)";

            preparedStatement = connection.prepareStatement(sqlQuery);

            preparedStatement.setString(1, "1234567891");
            preparedStatement.setString(2, "Yes"); 
            preparedStatement.setTime(3, new Time(System.currentTimeMillis())); 
            preparedStatement.setDate(4, new Date(System.currentTimeMillis())); 
            preparedStatement.setString(5, "Present"); 
            preparedStatement.setString(6, "Regular"); 

            preparedStatement.executeUpdate();

            System.out.println("Data inserted successfully.");

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}





