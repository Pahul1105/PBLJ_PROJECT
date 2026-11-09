package com.studentproject.dao;
import com.studentproject.model.Student;
import com.studentproject.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * StudentDAO — Data Access Object for Student entity
 * 
 * This class contains ALL database operations (CRUD) for the students table.
 * It uses PreparedStatement for secure, parameterized SQL queries.
 * 
 * Design Pattern: DAO Pattern
 * - Separates database logic from controller (Servlet) logic
 * - Servlets call DAO methods instead of writing SQL directly
 * 
 * Methods:
 * - addStudent()    → INSERT (Create)
 * - getAllStudents() → SELECT * (Read all)
 * - getStudentById()→ SELECT WHERE (Read one)
 * - updateStudent() → UPDATE (Update)
 * - deleteStudent() → DELETE (Delete)
 */
public class StudentDAO {

    // 1. ADD STUDENT (CREATE)
    /**
     * Inserts a new student record into the database.
     * @param student The Student object containing name and marks
     * @return true if insertion was successful, false otherwise
     */
    
    public boolean addStudent(Student student) {
        String sql = "INSERT INTO students (name, marks) VALUES (?, ?)";

        try {
            // Get database connection
            Connection conn = DBConnection.getConnection();

            // Create PreparedStatement with parameterized query
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set parameter values (index starts from 1)
            ps.setString(1, student.getName());   // ? at position 1 = name
            ps.setDouble(2, student.getMarks());
            int rowsAffected = ps.executeUpdate();
            ps.close();
            conn.close();

            // Return true if at least 1 row was inserted
            return rowsAffected > 0;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error adding student: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    // 2. GET ALL STUDENTS (READ ALL)
    /**
     * Retrieves all student records from the database.
     * 
     * @return List of all Student objects
     */

    
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students ORDER BY id ASC";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            // Execute SELECT query — returns a ResultSet
            ResultSet rs = ps.executeQuery();

            // Loop through each row in the result
            while (rs.next()) {
                // Create a Student object from each row
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setMarks(rs.getDouble("marks"));

                // Add to the list
                students.add(student);
            }

            // Close resources
            rs.close();
            ps.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error fetching students: " + e.getMessage());
            e.printStackTrace();
        }

        return students;
    }

    // =============================================
    // 3. GET STUDENT BY ID (READ ONE)
    // =============================================
    /**
     * Retrieves a single student by their ID.
     * 
     * @param id The student ID to search for
     * @return Student object if found, null if not found
     */
    public Student getStudentById(int id) {
        Student student = null;
        String sql = "SELECT * FROM students WHERE id = ?";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set the ID parameter
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            // If a row is found, create a Student object
            if (rs.next()) {
                student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setMarks(rs.getDouble("marks"));
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error searching student: " + e.getMessage());
            e.printStackTrace();
        }

        return student;
    }

    // =============================================
    // 4. UPDATE STUDENT (UPDATE)
    // =============================================
    /**
     * Updates an existing student's name and marks.
     * 
     * @param student The Student object with updated values
     * @return true if update was successful, false otherwise
     */
    public boolean updateStudent(Student student) {
        String sql = "UPDATE students SET name = ?, marks = ? WHERE id = ?";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, student.getName());
            ps.setDouble(2, student.getMarks());
            ps.setInt(3, student.getId());

            int rowsAffected = ps.executeUpdate();

            ps.close();
            conn.close();

            return rowsAffected > 0;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error updating student: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // =============================================
    // 5. DELETE STUDENT (DELETE)
    // =============================================
    /**
     * Deletes a student record by their ID.
     * 
     * @param id The ID of the student to delete
     * @return true if deletion was successful, false otherwise
     */
    public boolean deleteStudent(int id) {
        String sql = "DELETE FROM students WHERE id = ?";

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            int rowsAffected = ps.executeUpdate();

            ps.close();
            conn.close();

            return rowsAffected > 0;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error deleting student: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
