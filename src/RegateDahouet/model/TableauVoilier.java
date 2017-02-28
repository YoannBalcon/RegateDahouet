/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegateDahouet.model;

import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author ybalcon
 */
public class TableauVoilier extends AbstractTableModel {

    private final String[] titre = {"nom", "propriétaire", "numéro de voile"};
    private List<Voilier> voiliers;

    public TableauVoilier(List<Voilier> voiliers) {
        this.voiliers = voiliers;
                fireTableDataChanged();

    }

    public void setModel(List<Voilier> voiliers) {
        this.voiliers = voiliers;
    }

    public void addVoilier(Voilier voilier) {
        this.voiliers.add(voilier);
        this.fireTableDataChanged();
    }

    public Voilier getVoilier(int rowIndex) {
        return voiliers.get(rowIndex);
    }

    @Override
    public String getColumnName(int column) {
        return titre[column];
    }

    @Override
    public int getRowCount() {
        return voiliers.size();
    }

    @Override
    public int getColumnCount() {
        return titre.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex) {
            case 0:
                return voiliers.get(rowIndex).getNom();
            case 1:
                return voiliers.get(rowIndex).getProprietaire();
            case 2:
                return voiliers.get(rowIndex).getNumVoile();
            default:
                throw new IllegalArgumentException();
        }
    }

}
