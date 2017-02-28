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
public class Classe {
    int id_classe;
    String nom;
    double coefficient;
    Serie serie;

    public Classe() {
    }

    public Classe(String nom) {
        this.nom = nom;
    }

    public Classe(int id_classe, String nom, double coefficient, Serie serie) {
        this.id_classe = id_classe;
        this.nom = nom;
        this.coefficient = coefficient;
        this.serie = serie;
    }
    
    public Classe(int id_classe, String nom, double coefficient){
        this.id_classe = id_classe;
        this.nom = nom;
        this.coefficient = coefficient;
    }

    public int getId_classe() {
        return id_classe;
    }

    public void setId_classe(int id_classe) {
        this.id_classe = id_classe;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getCoefficient() {
        return coefficient;
    }

    public void setCoefficient(double coefficient) {
        this.coefficient = coefficient;
    }

    public Serie getSerie() {
        return serie;
    }

    public void setSerie(Serie serie) {
        this.serie = serie;
    }
    public String toString(){
        return nom;
    }
}
