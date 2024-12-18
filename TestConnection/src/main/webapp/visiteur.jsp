<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.Hotel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Visiteur - Liste des Hôtels</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="container">
            <a href="#" class="navbar-brand">Gestion Hôtelière</a>
            <div class="navbar-menu">
                <a href="#">Accueil</a>
                <a href="#">Hôtels</a>
                <a href="#">Réservations</a>
                <a href="#">Contact</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center mb-20">Liste des Hôtels</h1>

        <!-- Formulaire de Filtrage -->
        <div class="form-container">
            <form action="VisiteurServlet" method="get">
                <div class="form-group">
                    <label for="city">Ville :</label>
                    <input type="text" name="city" id="city" class="form-control" placeholder="Entrez une ville">
                </div>
                
                <div class="form-group">
                    <label for="minStars">Étoiles (min) :</label>
                    <input type="number" name="minStars" id="minStars" class="form-control" min="1" max="5">
                </div>

                <div class="text-center mt-20">
                    <button type="submit" class="btn btn-primary">Filtrer</button>
                </div>
            </form>
        </div>

        <!-- Liste des Hôtels -->
        <table class="table">
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Ville</th>
                    <th>Étoiles</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
                if (hotels != null && !hotels.isEmpty()) {
                    for (Hotel hotel : hotels) { 
                %>
                    <tr>
                        <td><%= hotel.name %></td>
                        <td><%= hotel.city %></td>
                        <td><%= hotel.stars %></td>
                        <td><%= hotel.descriptions %></td>
                        <td>
                            <form action="RoomHotelServlet" method="get" style="display:inline;">
                                <input type="hidden" name="hotelId" value="<%= hotel.id %>">
                                <button type="submit" class="btn btn-secondary">Détails</button>
                            </form>
                            <form action="RoomHotelServlet" method="get" style="display:inline;">
                                <input type="hidden" name="hotelId" value="<%= hotel.id %>">
                                <button type="submit" class="btn btn-secondary">Reserver</button>
                            </form>
                        </td>
                    </tr>
                <% 
                    } 
                } else { 
                %>
                    <tr>
                        <td colspan="5" class="text-center">Aucun hôtel trouvé</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>