<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Gestion Hôtelière</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <a href="#" class="navbar-brand">Gestion Hôtelière</a>
        </div>
    </nav>

    <div class="container">
        <div class="form-container text-center">
            <h1 class="mb-20">Bienvenue !</h1>
            <p class="mb-20">Choisissez une option :</p>
            <a href="login.jsp" class="btn btn-primary mt-20">Se connecter</a>
            <form action="VisiteurServlet" method="get" class="mt-20">
                <button type="submit" class="btn btn-secondary">Accéder en tant que visiteur</button>
            </form>
        </div>
    </div>
</body>
</html>