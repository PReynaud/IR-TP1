<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Affichage de tous les stages</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/main.css">
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="js/jquery-ui.js" type="text/javascript"></script>
	<script src="js/main.js" type="text/javascript"></script>
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
					<li><a href="index.jsp">Accueil</a></li>
					<li><a href="Controleur?action=saisieStage">Saisie d'un stage</a></li>
					<li class="active"><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>

<div class="row">
	<p align="center">
		<h2>Listing&nbsp;des Stages</h2>
	</p>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th> Numero</th>
				<th> Libellé</th>
				<th>Date début</th>
				<th>Date fin</th>
				<th>Nombre de places</th>
				<th>Nombre d'inscrits</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${liste}" var="item">
			<tr>
				<td>${item.id}</td>
				<td>${item.libelle}</td>
				<td>
					<fmt:formatDate type="both" dateStyle="short"
					timeStyle="short" value="${item.datedebut}" pattern="dd/MM/yyyy"/>
				</td>
				<td>
					<fmt:formatDate type="both" dateStyle="short"
					timeStyle="short" value="${item.datefin}" pattern="dd/MM/yyyy"/>
				</td>
				<td>${item.nbplaces}</td>
				<td>${item.nbinscrits}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="navbar navbar-inverse navbar-default" id="footer">
	<div id="conteneurFooter">TP1 Informatique répartie - Pierre REYNAUD - Février 2015</div>
</div>
</body>
</html>
