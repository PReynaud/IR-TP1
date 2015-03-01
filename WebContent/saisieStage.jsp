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
    <jsp:include page='/header.jsp' flush="true"/>

	<div class="row">
		<h1>Formulaire d'ajout d'un stage</h1>

		<input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
		<form method="post" action="Controleur" onsubmit="return verif();">
			<input type="hidden" name="type" value="ajout"  id="type"/>
			<input type="hidden" name="action" value="ajoutStage" />
			<div class="row">
				<div class="row">
					<div class="col-sm-2">Numéro</div>
					<div class="col-sm-2">
						<input type="text" name="id" value="${stage.id}" id="id" placeholder="Numéro du stage" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Libellé</div>
					<div class="col-sm-2">
						<input type="text" name="libelle" value="${stage.libelle}" id="libelle" placeholder="Libellé du stage" required/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Date de début du stage</div>
					<div class="col-sm-2">
						<input id="datedebut" name="datedebut" value="${stage.datedebut}" type="text" placeholder="Date de naissance" required>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">Date de fin de stage</div>
					<div class="col-sm-2">
                        <input id="datefin" name="datefin" value="${stage.datefin}" type="text" placeholder="Date de naissance" required>
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

    <jsp:include page='/footer.jsp' flush="true"/>
</body>
</html>
