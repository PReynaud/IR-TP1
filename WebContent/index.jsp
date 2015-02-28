<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.util.Date,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Accueil</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page='/header.jsp' flush="true"/>

<div class="row">
    <h1> Gestion des Stages HIGH TECH </h1>

    <h2> Nous sommes le <%= DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.FULL).format(new Date()) %>
    </h2>
    <h5>Application de gestion des stages: Utilisation d'une base de données sous MySQL intitulée "messtages"</h5>
    <h5>Un utilisateur "userepul" possédant les bons droits d'administration est nécessaire</h5>
    <h5>Son mot de passe est "epul"</h5>


</div>
<jsp:include page='/footer.jsp' flush="true"/>

</body>
</html> 
