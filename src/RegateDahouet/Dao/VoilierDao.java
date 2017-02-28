/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.Dao;

import RegateDahouet.model.Classe;
import RegateDahouet.model.Proprietaire;
import RegateDahouet.model.Voilier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ybalcon
 */
public class VoilierDao {

    public static Statement st = null;
    public static ResultSet rs = null;

    public static void create(Voilier v) throws SQLException {
        Connection cn = ConnectDb.getConnection();
        {
            try {
                PreparedStatement st = cn.prepareStatement(
                        "INSERT INTO voilier (nom, numVoile, id_proprietaire, id_classe) VALUES (?, ?, ?, ?);",
                        Statement.RETURN_GENERATED_KEYS);
                st.setString(1, v.getNom());
                st.setInt(2, v.getNumVoile());
                st.setInt(3, v.getProprietaire().getId_proprietaire());
                st.setInt(4, v.getClasse().getId_classe());
                st.executeUpdate();

                ResultSet rs = (ResultSet) st.getGeneratedKeys();
                if (!rs.next()) {
                    return;
                }
                v.setId_voilier(rs.getInt(1));
            } catch (SQLException e) {
                throw new RuntimeException();
            } finally {
                try {
                    if (cn != null) {
                        cn.close();
                    }
                    if (st != null) {
                        st.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static List<Voilier> findAll() {
        List<Voilier> stagiaires = new ArrayList<>();
        PreparedStatement st;

        try {
            Connection cn = ConnectDb.getConnection();
            st = (PreparedStatement) cn.prepareStatement("SELECT v.id_voilier, v.nom, v.numvoile, pro.id_proprietaire, per.nom, per.prenom, c.nom FROM voilier v INNER JOIN proprietaire pro ON v.id_proprietaire=pro.id_proprietaire INNER JOIN classe c ON v.id_classe= c.id_classe INNER JOIN personne per ON pro.id_personne=per.id_personne");

            ResultSet rs = (ResultSet) st.executeQuery();

            while (rs.next()) {
                int id_voilier = rs.getInt("v.id_voilier");
                String nom = rs.getString("v.nom");
                int numVoile = rs.getInt("v.numVoile");
                Proprietaire proprietaire = new Proprietaire(rs.getInt("pro.id_proprietaire"), rs.getString("per.nom"), rs.getString("per.prenom"));
                Classe classe = new Classe(rs.getString("c.nom"));

                Voilier v = new Voilier(id_voilier, nom, numVoile, proprietaire, classe);

                stagiaires.add(v);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException();
        }
        return stagiaires;

    }
}
