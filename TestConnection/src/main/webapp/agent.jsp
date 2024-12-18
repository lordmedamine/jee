<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.Hotel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Hôtels</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="container">
            <span class="navbar-brand">Gestion des Hôtels</span>
            <div class="navbar-menu">
                <a href="login.jsp">Retour à la Connexion</a>
                <a href="#creerHotel">Créer un Hotel</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center mb-20">Gestion des Hôtels</h1>
        
        <!-- Formulaire de filtres -->
        <div class="form-container">
            <h2>Filtres</h2>
            <form action="AgentServlet" method="get">
                <div class="form-group">
                    <label>Nom :</label>
                    <input type="text" name="name" class="form-control">
                </div>
                <div class="form-group">
                    <label>Ville :</label>
                    <input type="text" name="city" class="form-control">
                </div>
                <div class="form-group">
                    <label>Étoiles :</label>
                    <input type="number" name="stars" min="0" class="form-control">
                </div>
                <div class="text-center mt-20">
                    <button type="submit" class="btn btn-primary">Filtrer</button>
                </div>
            </form>
        </div>

        <!-- Liste des Hôtels -->
        <h2 class="text-center">Liste des Hôtels</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Ville</th>
                    <th>Étoiles</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotel"); 
                if (hotels != null && !hotels.isEmpty()) {
                    for (Hotel hotel : hotels) { 
                %>
                    <tr>
                        <td><%= hotel.name %></td>
                        <td><%= hotel.city %></td>
                        <td><%= hotel.stars %></td>
                        <td><%= hotel.descriptions %></td>
                        <td>
                            <form action="AgentServlet" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= hotel.id %>">
                                <input type="hidden" name="action" value="deleteHotel">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                            </form>
                            
                            <form action="EditHotelServlet" method="get" style="display:inline;">
                            	<input type="hidden" name="hotelId" value="<%= hotel.id %>">
                            	<button type="submit" class="btn">Modifier</button>
                        	</form>	
                            
                            <form action="RoomServlet" method="get" style="display:inline;">
                                <input type="hidden" name="hotelId" value="<%= hotel.id %>">
                                <button type="submit" class="btn btn-secondary">Gérer les Chambres</button>
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

        <!-- Formulaire pour Ajouter un Hôtel -->
        <div id="creerHotel" class="form-container">
            <h2 class="text-center">Ajouter un Hôtel</h2>
            <form action="AgentServlet" method="post">
                <input type="hidden" name="action" value="addHotel">
                <div class="form-group">
                    <label>Nom :</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Ville :</label>
                    <input type="text" name="city" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Étoiles :</label>
                    <input type="number" name="stars" min="0" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Description :</label>
                    <textarea name="description" class="form-control" required></textarea>
                </div>
                <div class="text-center mt-20">
                    <button type="submit" class="btn btn-primary">Ajouter</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>