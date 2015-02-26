<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Ajout d'un stage</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/main.css">
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="js/jquery-ui.js" type="text/javascript"></script>
	<script src="js/main.js" type="text/javascript"></script>
</head>

<body onLoad="Chargement();">
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
					<a class="navbar-brand" href="index.jsp">TP1 Informatique r�partie</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="index.jsp">Accueil</a></li>
						<li class="active"><a href="Controleur?action=saisieStage">Saisie d'un stage</a></li>
						<li><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<div class="row">
		<h1>Formulaire d'ajout d'un stage</h1>

		<input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
		<form method="post" action="Controleur" onsubmit="return verif();">
			<input type="hidden" name="type" value="ajout"  id="type"/>
			<input type="hidden" name="action" value="ajoutStage" />
			<div class="row">
				<div class="row">
					<div class="col-sm-2">Num�ro</div>
					<div class="col-sm-2">
						<input type="text" name="id" value="${stage.id}" id="id" placeholder="Num�ro du stage" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Libell�</div>
					<div class="col-sm-2">
						<input type="text" name="libelle" value="${stage.libelle}" id="libelle" placeholder="Libell� du stage" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Date de d�but du stage</div>
					<div class="col-sm-2">
						<input type="text" name="datedebut" value="${stage.datedebut}" id="datedebut" placeholder="yyyy/mm/dd" required/>
						<input id="dateNaissance" name="dateNaissance" type="text" placeholder="Date de naissance" required>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Date de fin de stage</div>
					<div class="col-sm-2">
						<input type="text" name="datefin" value="${stage.datefin}" id="datefin" placeholder="yyyy/mm/dd" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Nombre de places</div>
					<div class="col-sm-2">
						<input type="text" name="nbplaces" value="${stage.nbplaces}" id="nbplaces" placeholder="Nombre de places" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Nombre d'inscrits</div>
					<div class="col-sm-2">
						<input type="text" name="nbinscrits" value="${stage.nbinscrits}" id="nbinscrits" placeholder="Nombre d'inscrits" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-offset-2 col-sm-2">
                        <input type="submit" name="ajouter" value="Ajouter"/>
                    </div>
				</div>
			</div>
		</form>
	</div>

	<div class="navbar navbar-inverse navbar-default" id="footer">
		<div id="conteneurFooter">TP1 Informatique r�partie - Pierre REYNAUD - Dimitri RODARIE - F�vrier 2015</div>
	</div>
</body>
</html>
