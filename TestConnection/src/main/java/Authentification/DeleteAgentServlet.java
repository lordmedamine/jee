package Authentification;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dao.AdminDao;
import dao.DataBaseConnection;

public class DeleteAgentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String agentId = request.getParameter("id"); // Récupère l'id de l'agent depuis la requête
        	
       AdminDao.deleteAccount(agentId);

        // Redirection vers la page admin après suppression
        response.sendRedirect("AdminServlet");
    }
}

