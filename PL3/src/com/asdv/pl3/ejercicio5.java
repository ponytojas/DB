package com.asdv.pl3;

import org.postgresql.util.PSQLException;

import java.sql.*;

public class ejercicio5 {
    private Connection connection = null;

    void realizarConsultas(int numConsulta) throws SQLException {

        switch (numConsulta){
            case 1:
                System.out.println("Trying queries for user gestor_tienda");
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
                    String user = "gestor_tienda";
                    String password = "1234";

                    connection =  DriverManager.getConnection(url, user, password);
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }

                assert connection != null;
                Statement stmnt = connection.createStatement();
                try {
                    System.out.println("CREATE TABLE test(id_test serial PRIMARY KEY);");
                    String st = "CREATE TABLE test(id_test serial PRIMARY KEY);";
                    ResultSet rs = stmnt.executeQuery(st);
                }catch (PSQLException e){
                    System.out.println("Not possible to create table as user gestor_tienda");
                }

                try {
                    System.out.println("CREATE TABLE test(id_test serial PRIMARY KEY);");
                    String st = "CREATE TABLE test(id_test serial PRIMARY KEY);";
                    ResultSet rs = stmnt.executeQuery(st);
                }catch (PSQLException e){
                    System.out.println("Not possible to create table as user gestor_tienda");
                }


                break;
                default:
                    System.out.println("There was some problem");

        }
    }
}
