<?php

$isEmailOkay = TRUE;

// =============== VERIFICATION DE L'ADRESSE MAIL ===============
try
{
    $listes = $utilisateur->selectAllUtilisateur();
    foreach ($listes as $data)
    {
        if ($data['mail_utilisateur'] == $_POST['email'])
        {
            $message = "E-mail already exists in database";
            $isEmailOkay = FALSE;
        }
    }
}
catch(Exception $e)
{
    $message = "Impossible to check the email";
}

// =============== INSERTION DE L'UTILISATEUR SI E-MAIL OK ===============
if ($isEmailOkay)
{
    try
    {
        $utilisateur->createUtilisateur($_POST['pseudo'], $_POST['email'], $_POST['password']);

        $success = TRUE;
        $message = "User created";
    }
    catch(Exception $e)
    {
        $message = "Impossible to insert the user";
    }
}

?>