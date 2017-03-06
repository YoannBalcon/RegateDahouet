/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import RegateDahouet.exoModel.emailValidation;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ybalcon
 */
public class testMail {

    public testMail() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    @Test
    public void testEmail() {
        
// Exemples vérifiant le pattern
        assertTrue(emailValidation.isEmail("test@test.test"));
        assertTrue(emailValidation.isEmail("te@st.fr"));
        
// Exemples na vérifiant pas le pattern
        assertFalse(emailValidation.isEmail("test.test@test"));
        assertFalse(emailValidation.isEmail("t@t.t"));
        assertFalse(emailValidation.isEmail("test@t.t"));
    }
}
