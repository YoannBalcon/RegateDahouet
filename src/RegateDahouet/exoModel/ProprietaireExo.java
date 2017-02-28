/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.exoModel;

/**
 *
 * @author ybalcon
 */
public class ProprietaireExo extends PersonneExo{
    
    public ProprietaireExo(String nom, String prenom, String email, int anneeNaissance) {
        super(nom, prenom, email, anneeNaissance);
    }

    public ProprietaireExo() {
    }
    
    
public String toString(){
    return super.toString();
}    
}
