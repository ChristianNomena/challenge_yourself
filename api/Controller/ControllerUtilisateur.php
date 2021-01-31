<?php

include_once("./Model/Transaction/TransactionUtilisateur.php");

class ControllerUtilisateur
{
    public function createUtilisateur($pseudo, $email, $password)
    {
        $utilisateur = new TransactionUtilisateur();

        $utilisateur->setPseudo($pseudo);
        $utilisateur->setEmail($email);
        $utilisateur->setPassword($password);

        $utilisateur->ajouter();
    }

    public function selectUtilisateur($id)
    {
        $utilisateur = new TransactionUtilisateur();

        return $utilisateur->afficher($id);
    }

    public function selectAllUtilisateur()
    {
        $utilisateur = new TransactionUtilisateur();

        return $utilisateur->afficherTout();
    }
}
