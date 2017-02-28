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
public class Voilier {
    int id_voilier;
    String nom;
    int numVoile;
    
    Proprietaire proprietaire;
    Classe classe;

    public Voilier(int id_voilier, String nom, int numVoile) {
        this.id_voilier = id_voilier;
        this.nom = nom;
        this.numVoile = numVoile;
    }

    public Voilier(int id_voilier, String nom, int numVoile, Proprietaire proprietaire, Classe classe) {
        this.id_voilier = id_voilier;
        this.nom = nom;
        this.numVoile = numVoile;
        this.proprietaire = proprietaire;
        this.classe = classe;
    }
    
    

    public int getId_voilier() {
        return id_voilier;
    }

    public void setId_voilier(int id_voilier) {
        this.id_voilier = id_voilier;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getNumVoile() {
        return numVoile;
    }

    public void setNumVoile(int numVoile) {
        this.numVoile = numVoile;
    }

    public Proprietaire getProprietaire() {
        return proprietaire;
    }

    public Classe getClasse() {
        return classe;
    }
    
}
