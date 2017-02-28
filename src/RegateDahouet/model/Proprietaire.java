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
public class Proprietaire extends Personne {

    int id_proprietaire;
    Personne personne;

    public Proprietaire(int id_personne, String nom, String prenom, String email, String nomClub, int numLicence, int anneeLicence, int dateNaissance) {
        super(id_personne, nom, prenom, email, nomClub, numLicence, anneeLicence, dateNaissance);
    }

    public Proprietaire(int id_proprietaire, Personne personne, int id_personne, String nom, String prenom, String email, String nomClub, int numLicence, int anneeLicence, int dateNaissance) {
        super(id_personne, nom, prenom, email, nomClub, numLicence, anneeLicence, dateNaissance);
        this.id_proprietaire = id_proprietaire;
        this.personne = personne;
    }

    public Proprietaire(int id_proprietaire, String nom, String prenom) {
        super(id_proprietaire, nom, prenom);
        this.id_proprietaire = id_proprietaire;
    }

    public int getId_proprietaire() {
        return id_proprietaire;
    }

    public void setId_proprietaire(int id_proprietaire) {
        this.id_proprietaire = id_proprietaire;
    }

    public Personne getPersonne() {
        return personne;
    }

    public void setPersonne(Personne personne) {
        this.personne = personne;
    }

    @Override
    public String toString() {
        return super.toString();
    }

}
