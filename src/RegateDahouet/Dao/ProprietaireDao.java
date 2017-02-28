/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.Dao;

import RegateDahouet.model.Proprietaire;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ybalcon
 */
public class ProprietaireDao {
    
        public static List<Proprietaire> findAll() throws SQLException {

            java.sql.Connection cn = ConnectDb.getConnection();

        List<Proprietaire> proprietaires = new ArrayList<>();
        Statement st;
        try {
            st = (Statement) cn.createStatement();

            String sql = "select * from proprietaire pr INNER JOIN personne pe ON pr.id_personne=pe.id_personne";
            ResultSet rs = (ResultSet) st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_proprietaire");
                String nom = rs.getString("nom");
                String prenom = rs.getString("prenom");

                Proprietaire p = new Proprietaire(id, nom, prenom);

                proprietaires.add(p);
            }
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }

        return proprietaires;

    }
}
