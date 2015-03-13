package main.java.controle;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.text.*;

import main.java.metier.*;
import main.java.persistance.*;
import main.java.meserreurs.*;

@WebServlet("/Controleur")
public class Controleur extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String ACTION_TYPE = "action";
    private static final String SAISIE_STAGE = "saisieStage";
    private static final String AFFICHER_STAGE = "afficheStage";
    private static final String RECHERCHER_STAGE = "rechercheStage";
    private static final String CHERCHER_TYPE = "recherche";
    private static final String AJOUT_STAGE = "ajoutStage";
    private static final String MODIFIER_STAGE = "modifierStage";
    private static final String AJOUTER_MODIFICATION_STAGE = "ajouterModificationStage";
    private static final String SELECT_STAGE = "selectStage";
    private static final String SUPPRIMER = "suppressionStage";
    private static final String ERROR_PAGE = null;

    public Controleur() {
        super();
    }

    // le format est une combinaison de MM dd yyyy avec / ou
    // exemple dd/MM/yyyy
    public Date conversionChaineenDate(String unedate, String unformat) throws Exception {
        Date datesortie;
        // on définit un format de sortie
        SimpleDateFormat defFormat = new SimpleDateFormat(unformat);
        datesortie = defFormat.parse(unedate);
        return datesortie;
    }


    protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MonException, Exception {
        String actionName = request.getParameter(ACTION_TYPE);
        String destinationPage = ERROR_PAGE;
        List<Stage> listeStages = null;
        // execute l'action

        Map<String, String[]> parameters = request.getParameterMap();

        if (SAISIE_STAGE.equals(actionName)) {
            request.setAttribute("stage", new Stage());
            destinationPage = "/saisieStage.jsp";
        } else if (AJOUT_STAGE.equals(actionName)) {
            try {
                Stage unStage = new Stage();
                unStage.setId(request.getParameter("id"));
                unStage.setLibelle(request.getParameter("libelle"));
                unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "dd/MM/yyyy"));
                unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "dd/MM/yyyy"));
                unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
                unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbplaces"))).intValue());
                unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbinscrits"))).intValue());
                unStage.insertionStage();
                destinationPage = "/index.jsp";
            } catch (Exception e) {
                request.setAttribute("MesErreurs", e.getMessage());
                System.out.println(e.getMessage());
            }

        } else if (AFFICHER_STAGE.equals(actionName)) {
            try {
                Stage unStage = new Stage();
                request.setAttribute("affichageListe", 1);
                listeStages = unStage.rechercheLesStages();
                request.setAttribute("liste", listeStages);
                destinationPage = "/afficherStages.jsp";
            } catch (MonException e) {
                request.setAttribute("MesErreurs", e.getMessage());
                destinationPage = "/Erreur.jsp";
            }

        } else if (RECHERCHER_STAGE.equals(actionName)) {
            try{
                Stage unStage = new Stage();
                request.setAttribute("affichageListe", 1);
                if(parameters.size() > 1){
                    String parametreRecherche = request.getParameter(CHERCHER_TYPE);
                    listeStages = unStage.rechercheLesStages(parametreRecherche);
                }
                else{
                    listeStages = unStage.rechercheLesStages();
                }
                request.setAttribute("liste", listeStages);
                destinationPage= "/rechercherStages.jsp";
            } catch (MonException e){
                request.setAttribute("MesErreurs", e.getMessage());
                destinationPage = "/Erreur.jsp";
            }
        } else if (MODIFIER_STAGE.equals(actionName)){
            try {
                Stage unStage = new Stage();
                listeStages = unStage.rechercheLesStages();
                request.setAttribute("listeStages", listeStages);

                if(parameters.size() > 1){
                    String idStage = request.getParameter(SELECT_STAGE);
                    //TO DO ajouter vérification
                    Stage stageTrouve = unStage.getStageFromId(idStage);
                    request.setAttribute("stage", stageTrouve);
                }

                destinationPage = "/modifierStage.jsp";
            } catch (Exception e) {
                request.setAttribute("MesErreurs", e.getMessage());
                System.out.println(e.getMessage());
            }
        } else if(AJOUTER_MODIFICATION_STAGE.equals(actionName)){
            try {
                Stage unStage = new Stage();
                unStage.setId(request.getParameter("id"));
                unStage.setLibelle(request.getParameter("libelle"));
                unStage.setDatedebut(conversionChaineenDate(request.getParameter("datedebut"), "dd/MM/yyyy"));
                unStage.setDatefin(conversionChaineenDate(request.getParameter("datefin"), "dd/MM/yyyy"));
                unStage.setNbplaces(Integer.parseInt(request.getParameter("nbplaces")));
                unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbplaces"))).intValue());
                unStage.setNbinscrits(Integer.valueOf((request.getParameter("nbinscrits"))).intValue());
                unStage.modificationStage(request.getParameter("id"));

                destinationPage = "/modificationValidee.jsp";
            } catch (Exception e) {
                request.setAttribute("MesErreurs", e.getMessage());
                System.out.println(e.getMessage());
            }
        } else if (SUPPRIMER.equals(actionName)){
            try{
                Stage unStage=new Stage();
                unStage.setId(request.getParameter("id"));
                unStage.suppressionStage();
                destinationPage = "/modificationValidee.jsp";
            }catch (Exception e){
                request.setAttribute("MesErreurs", e.getMessage());
                destinationPage = "/Erreur.jsp";
            }
        }
        // Redirection vers la page jsp appropriee
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
        dispatcher.forward(request, response);
    }

    //L'appel de cette procédure se fait avec :

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processusTraiteRequete(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processusTraiteRequete(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}