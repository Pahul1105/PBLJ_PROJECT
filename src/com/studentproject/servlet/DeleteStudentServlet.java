package com.studentproject.servlet;

import com.studentproject.dao.StudentDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * DeleteStudentServlet — Handles Deleting a Student
 * 
 * URL Pattern: /deleteStudent
 * Method: GET (triggered by clicking Delete button/link)
 * 
 * How it works:
 * 1. Checks if user is logged in
 * 2. Gets student ID from URL parameter
 * 3. Calls StudentDAO.deleteStudent() to remove from database
 * 4. Redirects to viewStudents with success/error message
 */
public class DeleteStudentServlet extends HttpServlet {

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
            // Get the student ID from URL parameter (e.g., /deleteStudent?id=1)
            int id = Integer.parseInt(request.getParameter("id"));

            // Call DAO to delete the student
            StudentDAO dao = new StudentDAO();
            boolean success = dao.deleteStudent(id);

            // Set appropriate message
            if (success) {
                session.setAttribute("successMessage", "Student deleted successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to delete student. Student may not exist.");
            }

        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Invalid student ID!");
        }

        // Redirect back to view all students
        response.sendRedirect("viewStudents");
    }
}
