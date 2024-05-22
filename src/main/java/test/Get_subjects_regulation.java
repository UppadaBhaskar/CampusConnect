package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Get_subjects_regulation {
    public static List<String> getSubjectNames() {
        List<String> subjects = new ArrayList<>();
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT subject_name FROM subjects";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                subjects.add(resultSet.getString("subject_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjects;
    }
    
    public static List<String> getRegulationNames() {
        List<String> regulations = new ArrayList<>();
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT regulation_name FROM regulations";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                regulations.add(resultSet.getString("regulation_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return regulations;
    }
    
    public static List<String> getDepartments() {
        List<String> departments = new ArrayList<>();
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT department_name FROM department";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                departments.add(resultSet.getString("department_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departments;
    }
    public static List<String> get_faculty_names() {
        List<String> faculty = new ArrayList<>();
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT name FROM admin";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                faculty.add(resultSet.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return faculty;
    }
}
