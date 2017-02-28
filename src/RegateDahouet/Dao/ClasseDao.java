/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.Dao;

import RegateDahouet.model.Classe;
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
public class ClasseDao {
            public static List<Classe> findAll() throws SQLException {

            java.sql.Connection cn = ConnectDb.getConnection();

        List<Classe> classes = new ArrayList<>();
        Statement st;
        try {
            st = (Statement) cn.createStatement();

            String sql = "select * from classe cl INNER JOIN serie s ON cl.id_serie=s.id_serie";
            ResultSet rs = (ResultSet) st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("cl.id_classe");
                String nom = rs.getString("cl.nom");
                double coefficient = rs.getDouble("cl.coefficient");

                Classe c = new Classe(id, nom, coefficient);

                classes.add(c);
            }
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException();
        }

        return classes;

    }
}
