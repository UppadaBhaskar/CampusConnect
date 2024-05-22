import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class marks_insert_test {
	public static void main(String args[]) throws IOException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        try {
            connection = Database.getConnection();
            
            String sql = "INSERT INTO marks (roll_number, mark) VALUES (?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            
           
                preparedStatement.setString(1, "20HP1A1232");
                preparedStatement.setInt(2, 45);
                preparedStatement.executeUpdate();
            
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.closeStatement(preparedStatement);
            Database.closeConnection(connection);
        }
    }

}





