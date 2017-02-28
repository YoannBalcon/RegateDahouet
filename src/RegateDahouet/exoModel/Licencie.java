/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.exoModel;

import java.util.Calendar;

/**
 *
 * @author ybalcon
 */
public class Licencie extends Personne {

    int numLicence;
    double pointFFV;
    int anneeLicence;

    public Licencie(String nom, String prenom, String email, int anneeNaissance, int numLicence, double pointFFV, int anneeLicence)  {
        super(nom, prenom, email, anneeNaissance);
        this.numLicence = numLicence;
        this.pointFFV = pointFFV;
        this.anneeLicence = anneeLicence;
    }

    public Licencie() {
    }

    public int getNumLicence() {
        return numLicence;
    }

    public void setNumLicence(int numLicence) {
        this.numLicence = numLicence;
    }

    public double getPointFFV() {
        return pointFFV;
    }

    public void setPointFFV(double pointFFV) {
        this.pointFFV = pointFFV;
    }

    public int getAnneeLicence() {
        return anneeLicence;
    }

    public void setAnneeLicence(int anneeLicence) {
        this.anneeLicence = anneeLicence;
    }

    public String toString() {
        return super.toString() + ", numéro de licence : " + numLicence + ", points FFV : " + pointFFV + ", année de licence : " + anneeLicence;
    }

    public void calculPoints(int points, Calendar dateLicence) throws Exception{
        if (anneeLicence == dateLicence.get(Calendar.YEAR)) {

            pointFFV = pointFFV + points;
        } else {
            throw new Exception("La date ne correspond pas !");
        }
    }
}
