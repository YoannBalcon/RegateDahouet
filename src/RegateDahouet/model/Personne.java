/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.model;

/**
 *
 * @author ybalcon
 */
public class Personne {
    int id_personne;
    String nom;
    String prenom;
    String email;
    String nomClub;
    int numLicence;
    int anneeLicence;
    int dateNaissance;

    public Personne(int id_personne, String nom, String prenom, String email, String nomClub, int numLicence, int anneeLicence, int dateNaissance) {
        this.id_personne = id_personne;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.nomClub = nomClub;
        this.numLicence = numLicence;
        this.anneeLicence = anneeLicence;
        this.dateNaissance = dateNaissance;
    }

    public int getId_personne() {
        return id_personne;
    }

    public void setId_personne(int id_personne) {
        this.id_personne = id_personne;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNomClub() {
        return nomClub;
    }

    public void setNomClub(String nomClub) {
        this.nomClub = nomClub;
    }

    public int getNumLicence() {
        return numLicence;
    }

    public void setNumLicence(int numLicence) {
        this.numLicence = numLicence;
    }

    public int getAnneeLicence() {
        return anneeLicence;
    }

    public void setAnneeLicence(int anneeLicence) {
        this.anneeLicence = anneeLicence;
    }

    public int getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(int dateNaissance) {
        this.dateNaissance = dateNaissance;
    }
    
    
}
