package com.studentproject.servlet;

import com.studentproject.dao.StudentDAO;
import com.studentproject.model.Student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * AddStudentServlet — Handles Adding a New Student
 * 
 * URL Pattern: /addStudent
 * Method: POST (form submission from addStudent.jsp)
 * 
 * How it works:
 * 1. Checks if user is logged in (session check)
 * 2. Gets student name and marks from the form
 * 3. Validates the input
 * 4. Creates a Student object
 * 5. Calls StudentDAO.addStudent() to insert into database
 * 6. Redirects to viewStudents with success/error message
 */
public class AddStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Session check — verify user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Step 2: Get form data
            String name = request.getParameter("name");
            String marksStr = request.getParameter("marks");

            // Step 3: Validate input
            if (name == null || name.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Student name cannot be empty!");
                response.sendRedirect("addStudent.jsp");
                return;
            }

            if (marksStr == null || marksStr.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Marks cannot be empty!");
                response.sendRedirect("addStudent.jsp");
                return;
            }

            double marks = Double.parseDouble(marksStr);

            // Validate marks range
            if (marks < 0 || marks > 100) {
                session.setAttribute("errorMessage", "Marks must be between 0 and 100!");
                response.sendRedirect("addStudent.jsp");
                return;
            }

            // Step 4: Create Student object
            Student student = new Student(name.trim(), marks);

            // Step 5: Call DAO to add student to database
            StudentDAO dao = new StudentDAO();
            boolean success = dao.addStudent(student);

            // Step 6: Set success/error message and redirect
            if (success) {
                session.setAttribute("successMessage", "Student '" + name + "' added successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to add student. Please try again.");
            }

            response.sendRedirect("viewStudents");

        } catch (NumberFormatException e) {
            // Handle case where marks is not a valid number
            HttpSession sess = request.getSession();
            sess.setAttribute("errorMessage", "Invalid marks value! Please enter a number.");
            response.sendRedirect("addStudent.jsp");
        }
    }

    /**
     * GET request — show the add student form
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Forward to add student form
        request.getRequestDispatcher("addStudent.jsp").forward(request, response);
    }
}
