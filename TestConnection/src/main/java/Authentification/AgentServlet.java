package Authentification;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Models.Hotel;
import dao.AgentDao;
import dao.DataBaseConnection;

public class AgentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filterName = request.getParameter("name");
        String filterCity = request.getParameter("city");
        String filterStars = request.getParameter("stars");

        List<Hotel> hotels = AgentDao.getHotels(filterName, filterCity, filterStars);
        request.setAttribute("hotel", hotels);
        RequestDispatcher dispatcher = request.getRequestDispatcher("agent.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

       
            if ("addHotel".equals(action)) {
                String name = request.getParameter("name");
                String city = request.getParameter("city");
                int stars = Integer.parseInt(request.getParameter("stars"));
                String description = request.getParameter("description");
                StringBuilder error=new StringBuilder();
                boolean test=false;
                if(city.length()<2) {
                	test=true;
                	error.append("city name is incorrect");
                }
                
                if(name.length()<2) {
                	test=true;
                	error.append("name is incorrect");
                }
                
                if(stars<=0 ) {
                	test=true;
                  error.append("nomber de stars invalide");
                }
                if(test) {
                	String errorMessage=error.toString();
                	   request.setAttribute("errorMessage", errorMessage);
                       request.setAttribute("hotel", AgentDao.getHotels("", "", ""));
                       request.getRequestDispatcher("agent.jsp").forward(request, response);
                }
               AgentDao.createHotel(name, city, stars, description);
            } else if ("deleteHotel".equals(action)) {
                char id = request.getParameter("id").charAt(0);
                String idd=String.valueOf(id);
               AgentDao.deleteHotel(idd);
            }
            
        
        response.sendRedirect("AgentServlet");
    }
}
