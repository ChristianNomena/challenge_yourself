<?php
    include_once("./Controller/ControllerUtilisateur.php");

    if ($_POST['entity'] == 'utilisateur')
    {
        $utilisateur = new ControllerUtilisateur();

        if ($_POST['operation'] == 'registerUtilisateur')
        {
            $success = FALSE;
            $message = "This will contain a feedback of the operation";

            require_once("./Operation/register_utilisateur.php");

            echo json_encode([
                "success" => $success,
                "message" => $message
            ]);
        }

        if ($_POST['operation'] == 'loginUtilisateur')
        {
            $success = FALSE;
            $message = "This will contain a feedback of the operation";

            require_once("./Operation/login_utilisateur.php");

            echo json_encode([
                "success" => $success,
                "message" => $message
            ]);
        }
    }
?>