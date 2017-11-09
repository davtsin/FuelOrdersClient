/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fuelordersclient;

import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;

/**
 *
 * @author denis
 */
public class GasStationsCBModel extends AbstractListModel<String>
    implements ComboBoxModel<String> {

    private ArrayList<String> resultSet;
    private String selection = null;

    public GasStationsCBModel(ResultSet rs) {
        resultSet = new ArrayList<String>();

        try {
            if (rs != null) {

                if (!rs.next()) {
                    //then there are no rows.
                    System.out.println(
                        "No records found in Gas_stations table");

                } else {

                    do {
                        // Get data from the current row and use it
                        
                        // from Gas_station table:
                        // id + code + address in string
                        String item
                            = rs.getString(1) + ":" + rs.getString(3)
                            + ":" + rs.getString(4);

                        resultSet.add(item);
                    } while (rs.next());

                    setSelectedItem(resultSet.get(0));
                }
            }
        } catch (Exception e) {
            System.out.println("Exception in GasStationsCBModel");
            e.printStackTrace();
        }
    }

    @Override
    public int getSize() {
        return resultSet.size();
    }

    @Override
    public String getElementAt(int index) {
        return resultSet.get(index);
    }

    // Methods implemented from the interface ComboBoxModel
    // to select and register an item from the pull-down list
    @Override
    public void setSelectedItem(Object anItem) {
        selection = (String) anItem;
    }

    // to add the selection to the combo box
    @Override
    public Object getSelectedItem() {
        return selection;
    }
}
