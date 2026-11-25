<?php

// chargement des bibliothèques de fonctions
require_once('./php/bibli_rapc.php');
require_once('./php/bibli_generale.php');

affEntete();

// génération du contenu de la page
affContenuL();

affPiedDePage();

// envoi du buffer
ob_end_flush();


/*********************************************************
 *
 * Définitions des fonctions locales de la page
 *
 *********************************************************/
//_______________________________________________________________
/**
 * Affichage du contenu principal de la page
 *
 * @return  void
 */
function affContenuL() : void {
    echo '<main>',
            '<p>Tentative de connexion à la base de données</p>';
            
    $bd = bdConnect();

    // Fermeture de la connexion au serveur de BdD
    mysqli_close($bd);

    echo '</main>';
}

