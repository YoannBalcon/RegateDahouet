/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.exoModel;

import java.util.regex.Pattern;

/**
 *
 * @author ybalcon
 */
public class emailValidation {

    public static boolean isEmail(String email) {
        //Pattern : 2 caractères @ 2 caractères . 2 caractères  
        boolean mail = Pattern.matches("^[_A-Za-z0-9-]{2,}+@[A-Za-z0-9-]{2,}+(\\.[A-Za-z]{2,})$", email);
        return mail;
    }
}
