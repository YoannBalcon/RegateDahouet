/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.Dao;

import RegateDahouet.model.Proprietaire;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
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

    public static void create(Proprietaire p) throws Exception {
        Connection cn = (Connection) ConnectDb.getConnection();

        PreparedStatement stAddPersonne;
        PreparedStatement stAddProprietaire;

        try {
            cn.setAutoCommit(false);

            stAddPersonne = (PreparedStatement) cn.prepareStatement(
                    "INSERT INTO personne (nom, prenom, email, nomClub, numLicence, anneeLicence, dateNaissance) VALUES (?, ?, ?, ?, ?, ?, ? );",
                    Statement.RETURN_GENERATED_KEYS);
            stAddPersonne.setString(1, p.getNom());
            stAddPersonne.setString(2, p.getPrenom());
            stAddPersonne.setString(3, p.getEmail());
            stAddPersonne.setString(4, p.getNomClub());
            stAddPersonne.setInt(5, p.getNumLicence());
            stAddPersonne.setInt(6, p.getAnneeLicence());
            stAddPersonne.setInt(7, p.getDateNaissance());

            stAddPersonne.executeUpdate();

            ResultSet rs = (ResultSet) stAddPersonne.getGeneratedKeys();
            if (!rs.next()) {
                throw new Exception("Cannot generate \"personne_id\"");
            }
            p.setId_personne(rs.getInt(1));

            stAddProprietaire = (PreparedStatement) cn.prepareStatement("INSERT INTO proprietaire (id_proprietaire, id_personne) VALUES (?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            stAddProprietaire.setInt(1, p.getId_proprietaire());
            stAddProprietaire.setInt(2, p.getId_personne());
            stAddProprietaire.executeUpdate();

            rs = (ResultSet) stAddProprietaire.getGeneratedKeys();
            if (!rs.next()) {
                throw new Exception("Cannot generate \"personne_id\"");
            }
            p.setId_proprietaire(rs.getInt(1));
            cn.commit();
            stAddPersonne.close();
            stAddProprietaire.close();

        } catch (SQLException e) {
            cn.rollback();
            throw new Exception("error during the creation process" + e.getMessage());
        }
    }
}
