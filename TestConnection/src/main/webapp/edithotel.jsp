<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.Hotel" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier l'Hôtel</title>
    <link rel="stylesheet" href="style.css"> <!-- Link to your provided CSS file -->
</head>
<body>
    <div class="container">
        <form action="AgentServlet" method="get" class="form-actions">
            <input type="submit" value="Hotels Liste" class="btn btn-secondary">
        </form>

        <h1 class="text-center">Modifier l'Hôtel</h1>

        <% Hotel hotel = (Hotel) request.getAttribute("hotel"); %>
        <form action="UpdateHotelServlet" method="post" class="form-container">
            <input type="hidden" name="id" value="<%= hotel.id %>">

            <div class="form-group">
                <label for="name">Nom :</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= hotel.name %>" required>
            </div>

            <div class="form-group">
                <label for="city">Ville :</label>
                <input type="text" id="city" name="city" class="form-control" value="<%= hotel.city %>" required>
            </div>

            <div class="form-group">
                <label for="stars">Étoiles :</label>
                <input type="number" id="stars" name="stars" class="form-control" min="1" max="5" value="<%= hotel.stars %>" required>
            </div>

            <div class="form-group">
                <label for="description">Description :</label>
                <textarea id="description" name="description" class="form-control" required><%= hotel.descriptions %></textarea>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
            </div>
        </form>
    </div>
</body>
</html>
