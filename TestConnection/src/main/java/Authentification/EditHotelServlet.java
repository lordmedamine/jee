package Authentification;



import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import Models.Hotel;
import dao.AgentDao;
import dao.DataBaseConnection;

public class EditHotelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hotelId = Integer.parseInt(request.getParameter("hotelId"));
        Hotel hotel=AgentDao.getHotelById(hotelId);
        
        request.setAttribute("hotel", hotel);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edithotel.jsp");
        dispatcher.forward(request, response);
    }
}
