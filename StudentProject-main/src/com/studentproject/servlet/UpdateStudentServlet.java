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
 * UpdateStudentServlet — Handles Updating Student Data
 * 
 * URL Pattern: /updateStudent
 * 
 * Two modes:
 * - GET:  Load the edit form with current student data
 * - POST: Process the update form submission
 * 
 * GET Flow:
 * 1. Receive student ID from URL parameter
 * 2. Fetch student data from database
 * 3. Forward to editStudent.jsp with student data
 * 
 * POST Flow:
 * 1. Receive updated data from edit form
 * 2. Validate input
 * 3. Call DAO to update the database
 * 4. Redirect to viewStudents with message
 */
public class UpdateStudentServlet extends HttpServlet {

    /**
     * GET — Load student data into edit form
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

        try {
            // Get the student ID from URL parameter (e.g., /updateStudent?id=1)
            int id = Integer.parseInt(request.getParameter("id"));

            // Fetch the student from database
            StudentDAO dao = new StudentDAO();
            Student student = dao.getStudentById(id);

            if (student != null) {
                // Set student data as request attribute for JSP
                request.setAttribute("student", student);
                // Forward to edit form
                request.getRequestDispatcher("editStudent.jsp").forward(request, response);
            } else {
                session.setAttribute("errorMessage", "Student with ID " + id + " not found!");
                response.sendRedirect("viewStudents");
            }

        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Invalid student ID!");
            response.sendRedirect("viewStudents");
        }
    }

    /**
     * POST — Process the edit form submission
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Get form data
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String marksStr = request.getParameter("marks");

            // Validate input
            if (name == null || name.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Student name cannot be empty!");
                response.sendRedirect("updateStudent?id=" + id);
                return;
            }

            if (marksStr == null || marksStr.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Marks cannot be empty!");
                response.sendRedirect("updateStudent?id=" + id);
                return;
            }

            double marks = Double.parseDouble(marksStr);

            if (marks < 0 || marks > 100) {
                session.setAttribute("errorMessage", "Marks must be between 0 and 100!");
                response.sendRedirect("updateStudent?id=" + id);
                return;
            }

            // Create Student object with updated data
            Student student = new Student(id, name.trim(), marks);

            // Call DAO to update
            StudentDAO dao = new StudentDAO();
            boolean success = dao.updateStudent(student);

            if (success) {
                session.setAttribute("successMessage", "Student updated successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to update student!");
            }

            response.sendRedirect("viewStudents");

        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Invalid input data!");
            response.sendRedirect("viewStudents");
        }
    }
}
