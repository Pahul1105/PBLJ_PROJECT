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
 * SearchStudentServlet — Handles Searching for a Student by ID
 * 
 * URL Pattern: /searchStudent
 * Method: GET (form with GET method)
 * 
 * How it works:
 * 1. Checks if user is logged in
 * 2. Gets the search ID from the form/URL parameter
 * 3. Calls StudentDAO.getStudentById() to find the student
 * 4. If found: forwards to searchResult.jsp with student data
 * 5. If not found: forwards with error message
 */
public class SearchStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String idStr = request.getParameter("id");

        // If no ID provided, show the search form
        if (idStr == null || idStr.trim().isEmpty()) {
            request.getRequestDispatcher("searchStudent.jsp").forward(request, response);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);

            // Search for the student in the database
            StudentDAO dao = new StudentDAO();
            Student student = dao.getStudentById(id);

            if (student != null) {
                // Student found — pass to JSP
                request.setAttribute("student", student);
                request.setAttribute("searchSuccess", true);
            } else {
                // Student not found
                request.setAttribute("searchSuccess", false);
                request.setAttribute("searchMessage", "No student found with ID: " + id);
            }

            // Forward to search result page
            request.getRequestDispatcher("searchResult.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("searchSuccess", false);
            request.setAttribute("searchMessage", "Invalid ID! Please enter a valid number.");
            request.getRequestDispatcher("searchResult.jsp").forward(request, response);
        }
    }

    /**
     * Also handle POST for search form submissions
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
