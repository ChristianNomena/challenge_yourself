<?php

$isEmailOkay = FALSE;

// =============== VERIFICATION DE L'ADRESSE MAIL ===============
try
{
    $listes = $utilisateur->selectAllUtilisateur();
    foreach ($listes as $data)
    {
        if ($data['mail_utilisateur'] == $_POST['email'])
        {
            $isEmailOkay = TRUE;
            break;
        }
        else
        {
            $message = "E-mail does not exist in database";
        }
    }
}
catch(Exception $e)
{
    $message = "Impossible to check the email";
}

// =============== VERIFICATION DE L'ADRESSE MAIL AVEC LE MOT DE PASSE CORRESPONDANT ===============
if ($isEmailOkay)
{
    try
    {
        $listes = $utilisateur->selectAllUtilisateur();
        foreach ($listes as $data)
        {
            if ($data['mail_utilisateur'] == $_POST['email'])
            {
                if ($data['password_utilisateur'] == sha1($_POST['password']))
                {
                    $message = "login succeeded";
                    $success = TRUE;
                }
                break;
            }
            else
            {
                $message = "The password is not correct";
            }
        }
    }
    catch(Exception $e)
    {
        $message = "Impossible to verify if the password is correct";
    }
}

?>