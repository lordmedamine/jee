<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.Room" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier une Chambre</title>
    <link rel="stylesheet" href="style.css"> <!-- Link to your provided CSS file -->
</head>
<body>
    <div class="container">
        <h1 class="text-center">Modifier la Chambre</h1>
        <% Room room = (Room) request.getAttribute("room"); %>
        <form action="UpdateRoomServlet" method="post" class="form-container">
            <input type="hidden" name="id" value="<%= room.id %>">

            <div class="form-group">
                <label for="label">Label :</label>
                <input type="text" id="label" name="label" class="form-control" value="<%= room.label %>" required>
            </div>

            <div class="form-group">
                <label for="capacity">Capacité :</label>
                <input type="number" id="capacity" name="capacity" class="form-control" value="<%= room.capacity %>" required>
            </div>

            <div class="form-group">
                <label for="price">Prix :</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" value="<%= room.price %>" required>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
            </div>
        </form>
    </div>
</body>
</html>
