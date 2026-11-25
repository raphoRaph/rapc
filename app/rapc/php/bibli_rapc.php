<?php
/*********************************************************
 *        Bibliothèque de fonctions spécifiques          *
 *        à l'application Système de RàPC                *
 *********************************************************/

// Force l'affichage des erreurs
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting( E_ALL );

// Phase de développement (IS_DEV = true) ou de production (IS_DEV = false)
define ('IS_DEV', true);

/** Constantes : les paramètres de connexion au serveur MariaDB */
define ('BD_NAME', 'rapc_bd');
define ('BD_USER', 'rapc_user');
define ('BD_PASS', 'rapc_pass');
define ('BD_SERVER', 'mariadb-hostname');

// Définit le fuseau horaire par défaut à utiliser. Disponible depuis PHP 5.1
date_default_timezone_set('Europe/Paris');

//_______________________________________________________________
/**
 * Affichage du début de la page HTML (head + menu + header).
 *
 * @param  string  $titre       le titre de la page (<head> et <h1>)
 * @param  string  $prefixe     le préfixe du chemin relatif vers la racine du site
 *
 * @return void
 */
function affEntete() : void {

    echo
        '<!doctype html>',
        '<html lang="fr">',
            '<head>',
                '<meta charset="UTF-8">',
                '<title>Système de raisonnement à partir de cas</title>',
            '</head>',
            '<body>';

    echo        '<header>',
                    '<h1>Système de raisonnement à partir de cas</h1>',
                '</header>';
}

//_______________________________________________________________
/**
 * Affichage du pied de page.
 *
 * @return  void
 */
function affPiedDePage() : void {

    echo        '<footer>&copy; Licence Informatique - Septembre 2024 - Tous droits réservés</footer>',
            '</body></html>';
}