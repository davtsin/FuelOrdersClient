/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fuelordersclient;

import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author denis
 */
public class PetrolTableModel extends AbstractTableModel {

    private int colnum = 9;
    private int rownum;
    private String[] colNames = {
        "Собственник", "Код АЗС", "Адрес", "Дата заправки", "Тип топлива",
        "Цена за литр", "Скидка", "Всего литров", "Общая стоимость"
    };
    private ArrayList<String[]> ResultSets;

    /**
     * Creates a new instance of FoodTableModel
     */
    public PetrolTableModel(ResultSet rs) {

        ResultSets = new ArrayList<String[]>();

        try {
            while (rs.next()) {

                String[] row = {
                    rs.getString("name"), rs.getString("code"), 
                    rs.getString("address"), rs.getString("date"),
                    rs.getString("gas_type"), rs.getString("cost_per_liter"),
                    rs.getString("discount"), rs.getString("amount_liters"),
                    rs.getString("total_cost")
                };
                ResultSets.add(row);

            }
        } catch (Exception e) {
            System.out.println("Exception in PetrolTableModel");
            e.printStackTrace();
        }

    }

    public Object getValueAt(int rowindex, int columnindex) {

        String[] row = ResultSets.get(rowindex);
        return row[columnindex];

    }

    public int getRowCount() {
        return ResultSets.size();
    }

    public int getColumnCount() {
        return colnum;
    }

    public String getColumnName(int param) {
        return colNames[param];
    }
}
