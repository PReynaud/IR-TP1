<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Accueil</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="js/main.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-inverse navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">TP1 Informatique répartie</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Accueil</a></li>
                        <li><a href="Controleur?action=saisieStage">Saisie d'un stage</a></li>
                        <li><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="row">
        <h1> Gestion des Stages  HIGH TECH </h1>
        <h2> Nous sommes le <%= DateFormat.getDateTimeInstance(DateFormat.FULL,DateFormat.FULL).format(new Date()) %> </h2>
          <!--  <li><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></li>   -->
          <h5>Application de gestion des stages: Utilisation d'une base de données sous MySQL intitulée "messtages"</h5>
          <h5>Un utilisateur "userepul" possédant les bons droits d'administration est nécessaire</h5>
          <h5>Son mot de passe est "epul"</h5>
    </div>

    <div class="navbar navbar-inverse navbar-default" id="footer">
        <div id="conteneurFooter">TP1 Informatique répartie - Pierre REYNAUD - Février 2015</div>
    </div>
</body>
</html> 
