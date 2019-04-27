package com.asdv.pl3;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.TimeUnit;
import java.io.*;

/**
 *
 * @author Antonio Serrano and Daniel Villalobos
 * @version 1.0.0
 */
public class PL3 {


    private static void allCallFromPL2(Connection conn) throws IOException, InterruptedException {
        System.out.println("Starting to show all DB calls from PL2");

        File file = new File("../pl2.txt");

        BufferedReader br = new BufferedReader(new FileReader(file));

        String st;
        while ((st = br.readLine()) != null) {
            System.out.println(st);
            TimeUnit.MILLISECONDS.sleep(400);
        }
    }


    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IllegalAccessException, ClassNotFoundException,
            InstantiationException, IOException, InterruptedException {

        BBDDConnection conn = new BBDDConnection();

        if (conn.connect())
            System.out.println("Created connection");
        else
            System.out.println("There was a problem connecting");

        allCallFromPL2(conn.getConnection());

        if (conn.disconnect())
            System.out.println("Closed connection");
        else
            System.out.println("There was a problem closing the connection");
    }
    
}
