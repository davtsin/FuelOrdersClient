/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fuelordersclient;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Properties;

/**
 *
 * @author denis
 */
public class PetrolDBConnection {

    private Connection conn;

    private String dbms = "mysql";
    private String dbName = "petrol";
    private String userName = "root";
    private String password = "nbuser";

    private String serverName = "localhost";
    private String portNumber = "3306";

    /**
     * Creates a new instance of MyDBConnection
     */
    public PetrolDBConnection() {

    }

    public Connection getPetrolConnection() {
        Properties connectionProps = new Properties();
        connectionProps.put("user", this.userName);
        connectionProps.put("password", this.password);
        connectionProps.put("useUnicode", "true");
        connectionProps.put("characterEncoding", "UTF-8");

        String currentUrlString = null;

        try {

            currentUrlString = "jdbc:" + this.dbms + "://" + this.serverName
                + ":" + this.portNumber + "/";
            conn
                = DriverManager.getConnection(currentUrlString,
                    connectionProps);

//            this.urlString = currentUrlString + this.dbName;
            conn.setCatalog(this.dbName);
        } catch (Exception e) {
            System.out.println("Failed to get connection");
            e.printStackTrace();
        }
        System.out.println("Connected to database");
        return conn;
    }

    public void close(ResultSet rs) {

        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
            }
        }
    }

    public void close(java.sql.Statement stmt) {

        if (stmt != null) {
            try {
                stmt.close();
            } catch (Exception e) {
            }
        }
    }

    public void destroy() {

        if (conn != null) {

            try {
                conn.close();
            } catch (Exception e) {
            }
        }
    }
}
