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
public class Serie {

    int id_serie;
    String nom;

    public Serie() {
    }

    public Serie(int id_serie, String nom) {
        this.id_serie = id_serie;
        this.nom = nom;
    }

    public int getId_serie() {
        return id_serie;
    }

    public void setId_serie(int id_serie) {
        this.id_serie = id_serie;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String toString() {
        return nom;
    }
}
