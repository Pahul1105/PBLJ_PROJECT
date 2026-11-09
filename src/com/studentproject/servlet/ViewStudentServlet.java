package com.studentproject.servlet;

import com.studentproject.dao.StudentDAO;
import com.studentproject.model.Student;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * ViewStudentServlet — Displays All Students in a Table
 * 
 * URL Pattern: /viewStudents
 * Method: GET
 * 
 * How it works:
 * 1. Checks if user is logged in
 * 2. Calls StudentDAO.getAllStudents() to get all records
 * 3. Passes the list to viewStudents.jsp as a request attribute
 * 4. Forwards to viewStudents.jsp for display
 */
public class ViewStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Step 2: Get all students from database
        StudentDAO dao = new StudentDAO();
        List<Student> studentList = dao.getAllStudents();

        // Step 3: Set the list as a request attribute
        // JSP will access this using ${studentList}
        request.setAttribute("studentList", studentList);

        // Step 4: Forward to the JSP page for display
        request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
    }
}
