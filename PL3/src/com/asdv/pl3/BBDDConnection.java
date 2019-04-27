package com.asdv.pl3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Antonio Serrano
 */
public class BBDDConnection {
    
    private Connection connection = null;


    public Connection getConnection() {
        return connection;
    }

    boolean connect() throws InstantiationException, IllegalAccessException, ClassNotFoundException {

        System.out.println("Checking postgres driver");

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException cnfe) {
            System.out.println("Driver not found\nExiting");
            cnfe.printStackTrace();
            System.exit(1);
        }
        System.out.println("Loaded driver");

        try {

            String url = "jdbc:postgresql://127.0.0.1:5432/tienda_musica";
            String user = "postgres";
            String password = "admin";

            this.connection =  DriverManager.getConnection(url, user, password);
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean disconnect(){
        try {
            this.connection.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    Statement createStatement(){
        try{
            return this.connection.createStatement();
        }
        catch (SQLException se){
            return null;
        }
    }

    
}
