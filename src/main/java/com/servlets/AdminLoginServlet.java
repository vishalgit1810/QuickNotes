package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve email and password parameters from the request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if the email and password match the admin credentials
        if ("Admin@123".equals(email) && "admin".equals(password)) {
            // If credentials match, create a new session and set a flag to indicate admin login
            HttpSession session = request.getSession();
            session.setAttribute("isAdminLoggedIn", true);

            // Redirect to the admin dashboard or any other admin-specific page
            response.sendRedirect("adminPage.jsp");
        } else {
            // If credentials do not match, set an error message and redirect back to the login page
            request.setAttribute("failMsg", "Invalid email or password for admin login.");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
    }
}

