/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.main;

import RegateDahouet.model.DahouetFrame;
import java.sql.SQLException;

/**
 *
 * @author ybalcon
 */
public class RegateDahouet {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        DahouetFrame mainFrame = new DahouetFrame();
        mainFrame.setVisible(true);
    }

}
