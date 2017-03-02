/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.Dao;

import RegateDahouet.model.Classe;
import RegateDahouet.model.Serie;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ybalcon
 */
public class SerieDao {
     public static List<Serie> findAll() throws SQLException {

            java.sql.Connection cn = ConnectDb.getConnection();

        List<Serie> series = new ArrayList<>();
        Statement st;
        try {
            st = (Statement) cn.createStatement();

            String sql = "select * from serie";
            ResultSet rs = (ResultSet) st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_serie");
                String nom = rs.getString("nom");

                Serie s = new Serie(id, nom);

                series.add(s);
            }
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }

        return series;

    }
}
