/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.exos;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import RegateDahouet.exoModel.CommissaireExo;
import RegateDahouet.exoModel.LicencieExo;
import RegateDahouet.exoModel.PersonneExo;
import RegateDahouet.exoModel.ProprietaireExo;
import RegateDahouet.exoModel.emailValidation;
import java.util.Scanner;

/**
 *
 * @author ybalcon
 */
public class ExoEcf {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {

        Calendar cal = new GregorianCalendar();
        cal.set(Calendar.YEAR, 2017);
        cal.set(Calendar.MONTH, 11);
        cal.set(Calendar.DAY_OF_MONTH, 27);
        
//Vérification d'e-mail\\
        Scanner sc = new Scanner(System.in);
        System.out.println("entrez une adresse mail :");
        String v_mail = sc.nextLine();

        System.out.println(emailValidation.isEmail(v_mail));

        if (!emailValidation.isEmail(v_mail)) {
            System.out.println("adresse non valide");
        } else {
            System.out.print("adresse valide");
        }

//METHODE toString()\\
        PersonneExo pers = new PersonneExo("Balcon", "Yoann", 1987);
        System.out.println(pers.toString());

// METHODE calculPoints()\\
        LicencieExo pers2 = new LicencieExo("Du Test", "jean-Charles", "jc@test.fr", 1999, 1545, 1414, 2017);

        pers2.calculPoints(14, cal);
        try {
            System.out.println(pers2);
        } catch (Exception e) {
        }

//JEU D'ESSAI\\
        ProprietaireExo pro1 = new ProprietaireExo("Test", "Anthony", "antho@test.fr", 1981);
        ProprietaireExo pro2 = new ProprietaireExo("Test", "Benjamin", "benj@test.fr", 1982);
        LicencieExo lic1 = new LicencieExo("Test", "Cécile", "ceci@test.fr", 1983, 0001, 1500, 2017);
        LicencieExo lic2 = new LicencieExo("Test", "Dominique", "dom@test.fr", 1984, 0002, 1465, 2016);
        LicencieExo lic3 = new LicencieExo("Test", "Eric", "ric@test.fr", 1985, 0003, 8945, 2017);
        CommissaireExo com1 = new CommissaireExo("Test", "François", "fanch@test.fr", 1987, "Finistère");

        ArrayList list = new ArrayList();
        list.add(pro1);
        list.add(pro2);
        list.add(lic1);
        list.add(lic2);
        list.add(lic3);
        list.add(com1);

        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }

        double moyenne = calculMoyenneAge(list);
        System.out.println("moyenne d'age : " + moyenne);

        double mediane = ageMedian(list);
        System.out.println("age médian : " + mediane);
    }

//CALCUL DE LA MOYENNE D'AGE\\
    public static double calculMoyenneAge(ArrayList<PersonneExo> liste) {
        int somme = 0;
        for (int i = 0; i < liste.size(); i++) {
            somme = somme + liste.get(i).getAge();
        }
        double result = somme / liste.size();
        return result;
    }

//CALCUL DE L'AGE MEDIAN\\
    public static double ageMedian(ArrayList<PersonneExo> liste) {

        double tab[] = new double[liste.size()];
        for (int i = 0; i < liste.size(); i++) {
            tab[i] = liste.get(i).getAge();
        }
        Arrays.sort(tab);
    // on recupère l'index médian
        int x = tab.length / 2;
    //calcul de la médiane
        if (tab.length % 2 == 0) {
            return (tab[x - 1] + tab[x]) / 2;
        } else {

            return tab[x];
        }

    }
}
