<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Models.Room" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Chambres - ${hotelName}</title>
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center">Gestion des Chambres pour Hôtel : ${hotelName}</h1>

        <!-- Liste des Chambres -->
        <h2>Liste des Chambres</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Label</th>
                    <th>Capacité</th>
                    <th>Prix</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                for (Room room : rooms) { %>
                <tr>
                    <td><%= room.label %></td>
                    <td><%= room.capacity %></td>
                    <td><%= room.price %></td>
                    <td>
                        <!-- Supprimer la chambre -->
                        <form action="RoomServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="deleteRoom">
                            <input type="hidden" name="roomId" value="<%= room.id %>">
                            <input type="hidden" name="hotelId" value="<%= room.hotelId %>">
                            <button class="btn btn-danger" type="submit">Supprimer</button>
                        </form>
                        <!-- Modifier la chambre -->
                    	<form action="EditRoomServlet" method="get" style="display:inline;">
                    		<input type="hidden" name="roomId" value=<%=room.id%>>
                    		<button class="btn " type="submit">Modifier</button>
                        </form>	
                        
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) { %>
        <p class="text-center" style="color: red;"><%= error %></p>
        <% } %>

        <!-- Ajouter une nouvelle chambre -->
        <h2>Ajouter une Chambre</h2>
        <form action="RoomServlet" method="post" class="form-container">
            <input type="hidden" name="action" value="addRoom">
            <input type="hidden" name="hotelId" value="<%= request.getAttribute("hotelId") %>">
            
            <div class="form-group">
                <label for="label">Label :</label>
                <input type="text" name="label" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="capacity">Capacité :</label>
                <input type="number" name="capacity" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="price">Prix :</label>
                <input type="number" step="0.01" name="price" class="form-control" required>
            </div>
            <button class="btn btn-primary" type="submit">Ajouter</button>
        </form>
    </div>
</body>
</html>
