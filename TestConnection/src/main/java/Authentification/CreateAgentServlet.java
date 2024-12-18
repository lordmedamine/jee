package Authentification;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.AdminDao;
import dao.DataBaseConnection;
public class CreateAgentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String email = request.getParameter("email");

       AdminDao.createAccount(username, password, role, email);

        // Redirection vers la page admin après l'ajout
        response.sendRedirect("AdminServlet");
    }
}
