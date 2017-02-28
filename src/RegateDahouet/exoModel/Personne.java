/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.exoModel;

import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author ybalcon
 */
public class Personne {

    String nom;
    String prenom;
    String email;
    int anneeNaissance;

    public Personne(String nom, String prenom, String email) {
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
    }

    public Personne(String nom, String prenom, int anneeNaissance) {
        this.nom = nom;
        this.prenom = prenom;
        this.anneeNaissance = anneeNaissance;
    }

    public Personne(String nom, String prenom, String email, int anneeNaissance) {
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.anneeNaissance = anneeNaissance;
    }

    public Personne() {
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

    public int getAnneeNaissance() {
        return anneeNaissance;
    }

    public void setAnneeNaissance(int anneeNaissance) {
        this.anneeNaissance = anneeNaissance;
    }


    public int getAge() {                  
        Calendar today = new GregorianCalendar();

        int age = today.get(Calendar.YEAR) - this.getAnneeNaissance();
        return age;
    }

    public String toString() {
        return "prenom : " + prenom + ",nom :" + nom +", age : "+ getAge();
    }
}
