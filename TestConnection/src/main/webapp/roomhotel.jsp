<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.Room" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Chambres - ${hotelName}</title>
    <!-- Link to external CSS -->
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Gestion des Chambres pour Hôtel : ${hotelName}</h1>
        <br>
        
        <!-- Form for filtering rooms by price -->
        <form action="RoomHotelServlet" method="get" class="form-container">
            <div class="form-group">
                <label for="maxPrice">Prix maximum :</label>
                <input type="number" name="maxPrice" id="maxPrice" class="form-control">
            </div>
            <input type="hidden" name="hotelId" value="<%= request.getAttribute("hotelId") %>">
            <button type="submit" class="btn btn-primary">Filtrer</button>
        </form>

        <!-- List of rooms -->
        <h2>Liste des Chambres</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Label</th>
                    <th>Capacité</th>
                    <th>Prix</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                    for (Room room : rooms) {
                %>
            <tr>
                <td><%= room.label%></td>
                <td><%= room.capacity%></td>
                <td><%= room.price%></td>
               
            </tr>
        <%} %>
    </table>

  
</body>
</html>