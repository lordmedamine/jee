<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.Account" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Admin</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="container">
            <span class="navbar-brand">Page Admin</span>
            <div class="navbar-menu">
                <a href="login.jsp">Retour à la Connexion</a>
                <a href="#createForm">Créer un Agent</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center mb-20">Liste des Agents</h1>

        <!-- Agents Table -->
        <table class="table">
            <thead>
                <tr>
                    <th>Nom d'utilisateur</th>
                    <th>Mot de passe</th>
                    <th>Rôle</th>
                    <th>Email</th>
                    <th>ID</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Account> agents = (List<Account>) request.getAttribute("agents"); 
                if (agents != null && !agents.isEmpty()) {
                    for (Account agent : agents) { 
                %>
                    <tr>
                        <td><%= agent.username %></td>
                        <td><%= agent.password %></td>
                        <td><%= agent.role %></td>
                        <td><%= agent.email %></td>
                        <td><%= agent.id %></td>
                        <td>
                            <form action="DeleteAgentServlet" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="<%= agent.id %>">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                <% 
                    } 
                } else { 
                %>
                    <tr>
                        <td colspan="6" class="text-center">Aucun agent trouvé</td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Create Agent Form -->
        <div class="form-container" id="createForm">
            <h2 class="text-center mb-20">Créer un Nouvel Agent</h2>
            <form action="CreateAgentServlet" method="post">
                <div class="form-group">
                    <label>Nom d'utilisateur :</label>
                    <input type="text" name="username" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>Mot de passe :</label>
                    <input type="password" name="password" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>Rôle :</label>
                    <input type="text" name="role" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>Email :</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="text-center mt-20">
                    <button type="submit" class="btn btn-primary">Créer</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>