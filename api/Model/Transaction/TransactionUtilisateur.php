<?php

include_once("./Model/Connection.php");
include_once("./Model/Entity/Utilisateur.php");

class TransactionUtilisateur extends Utilisateur
{
    public function ajouter()
    {
        $pseudo = $this->getPseudo();
        $email = $this->getEmail();
        $password = $this->getPassword();

        $connection = new Connection();

        $requeteString = "INSERT INTO utilisateur(pseudo_utilisateur, mail_utilisateur, password_utilisateur)
                          VALUES (:pseudo, :email, :password)";
        $requete = $connection->bdd->prepare($requeteString);

        $requete->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);
        $requete->bindParam(':email', $email, PDO::PARAM_STR);
        $requete->bindParam(':password', $password, PDO::PARAM_STR);

        $pseudo = htmlspecialchars($pseudo);
        $email = htmlspecialchars($email);
        $password = sha1(htmlspecialchars($password));

        $requete->execute();
        $requete->closeCursor();
    }

    public function afficher($id)
    {
        $donnee = array();

        $connection = new Connection();

        $requeteString = "SELECT * FROM utilisateur WHERE id = $id";
        $requete = $connection->bdd->query($requeteString);

        if ($data = $requete->fetch())
        {
            $donnee['id'] = $data['id_utilisateur'];
            $donnee['pseudo'] = $data['pseudo_utilisateur'];
            $donnee['email'] = $data['mail_utilisateur'];
            $donnee['password'] = $data['password_utilisateur'];
        }

        $requete->closeCursor();

        return $donnee;
    }

    public function afficherTout()
    {
        $donnees = array();

        $connection = new Connection();

        $requeteString = 'SELECT * FROM utilisateur';
        $requete = $connection->bdd->query($requeteString);

        while ($data = $requete->fetch())
        {
            array_push($donnees, $data);
        }

        $requete->closeCursor();

        return $donnees;
    }
}
