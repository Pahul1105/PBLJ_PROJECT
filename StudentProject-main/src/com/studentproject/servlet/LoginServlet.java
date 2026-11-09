package com.studentproject.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * LoginServlet — Handles Admin Login
 * URL Pattern: /login
 * Method: POST (form submission)
 * How it works:
 * 1. Receives username and password from login.jsp form
 * 2. Checks against hardcoded credentials (admin/admin123)
 * 3. If valid: creates session and redirects to dashboard
 * 4. If invalid: sends error message back to login page
 * 
 * Session Management:
 * - On successful login, stores "user" attribute in session
 * - Other servlets/JSPs check this attribute to verify login
 */
public class LoginServlet extends HttpServlet {

    // Hardcoded admin credentials (simple approach for university project)
    // In real-world apps, these would come from a database with hashed passwords
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "admin123";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"
        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setMaxInactiveInterval(30 * 60);
            response.sendRedirect("dashboard.jsp");

        } else {
            request.setAttribute("errorMessage", "Invalid Username or Password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
