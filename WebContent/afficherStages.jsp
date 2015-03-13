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
<jsp:include page='/header.jsp' flush="true"/>

<div class="row">
	<p align="center">
		<h2>Listing&nbsp;des Stages</h2>
	</p>

    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Numero</th>
                    <th>Libellé</th>
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
                    <td>
                        <a href="Controleur?action=suppressionStage&&id=${item.id}">
                        <button type="button" class="btn btn-default" aria-label="Suppression">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        </button></a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page='/footer.jsp' flush="true"/>
</body>
</html>
