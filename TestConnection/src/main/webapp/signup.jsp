<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Créer un compte</title>
    <link rel="stylesheet" href="style.css"> <!-- Link to your provided CSS file -->
</head>
<body>
    <div class="container">
        <h2 class="text-center">Créer un compte</h2>

        <form action="SignUpServlet" method="POST" class="form-container">
            <div class="form-group">
                <label for="username">Nom d'utilisateur :</label>
                <input type="text" name="username" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="password">Mot de passe :</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="phone">Numéro de téléphone :</label>
                <input type="tel" name="phone" class="form-control" required>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Créer un compte</button>
            </div>
        </form>
    </div>
</body>
</html>
