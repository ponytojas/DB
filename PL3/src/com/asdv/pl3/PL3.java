package com.asdv.pl3;

import org.postgresql.util.PSQLException;

import java.sql.*;
import java.util.concurrent.TimeUnit;
import java.io.*;

/**
 *
 * @author Antonio Serrano and Daniel Villalobos
 * @version 1.0.0
 */
public class PL3 {

    /**
     * @throws InterruptedException
     * @throws SQLException
     * @throws IOException
     * @throws IllegalAccessException
     * @throws ClassNotFoundException
     * @throws InstantiationException
     * @function This create the DB connection
     */
    private static void primeraParte() throws InterruptedException, SQLException, IOException, IllegalAccessException,
            ClassNotFoundException, InstantiationException {

        DBConnection conn = new DBConnection();

        if (conn.connect())
            System.out.println("Created connection");
        else {
            System.out.println("There was a problem connecting");
            System.exit(1);
        }

        allCallFromPL2(conn.getConnection());

        if (conn.disconnect())
            System.out.println("Closed connection");
        else {
            System.out.println("There was a problem closing the connection");
            System.exit(1);
        }

    }

    /**
     * @param conn This is a DBConnection object to handle all request to DB
     * @throws IOException
     * @throws InterruptedException
     * @throws SQLException
     * @function This method make all DB calls from PL2 reading from a .txt file
     */

    private static void allCallFromPL2(Connection conn) throws IOException, InterruptedException, SQLException {
        System.out.println("Starting to show all DB calls from PL2");
        DBCalls calls = new DBCalls();

        File file = new File("../llamadas-java.txt");

        BufferedReader br = new BufferedReader(new FileReader(file));

        String st;
        int selectedOption = 0;
        int amountResponsesPerRow;
        while ((st = br.readLine()) != null) {

            System.out.println(calls.getStringToShow(selectedOption));

            Statement stmnt = conn.createStatement();
            ResultSet rs = stmnt.executeQuery(st);

            while (rs.next()) {
                amountResponsesPerRow = 0;
                while (amountResponsesPerRow < calls.amountOfResults(selectedOption)) {

                    System.out.print("" + rs.getString(calls.getTableSelection(selectedOption, amountResponsesPerRow)) + " | ");

                    amountResponsesPerRow += 1;

                }
                System.out.print("\n");
                TimeUnit.MILLISECONDS.sleep(150);
            }

            TimeUnit.MILLISECONDS.sleep(650);
            selectedOption += 1;
            System.out.println("\n");
        }
    }

    /**
     * Just a clear terminal screen
     */

    private static void clearScreen() {
        try {
            final String os = System.getProperty("os.name");

            if (os.contains("Windows")) {
                Runtime.getRuntime().exec("cls");
            } else {
                Runtime.getRuntime().exec("clear");
            }
        } catch (final Exception e) {
            //  Handle any exceptions.
        }
    }

    private static void ejer5() throws SQLException {
        Connection connection = null;

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
            String st = "CREATE TABLE test(id_test serial PRIMARY KEY);";
            ResultSet rs = stmnt.executeQuery(st);
        }catch (PSQLException e){
            System.out.println("Not possible to create table as user gestor_tienda");
        }

    }


    /**
     * @param args the command line arguments
     * @function Main method to select what to do next
     */
    public static void main(String[] args) throws IllegalAccessException, ClassNotFoundException,
            InstantiationException, IOException, InterruptedException, SQLException {

        String selection = "";
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        assert false;
        while (!selection.toUpperCase().equals("S")) {
            System.out.println("Selecciona una opcion:");
            System.out.println("1) Mostrar las consultas referentes a la practica PL2");
            System.out.println("2) Ejercicio 2 de Java");
            System.out.println("S) Salir");

            try {
                selection = reader.readLine();
            } catch (IOException e) {
                e.printStackTrace();
            }

            switch (selection.toUpperCase()) {
                case "S":
                    System.out.println("Saliendo del programa");
                    System.exit(1);
                    break;

                case "1":
                    System.out.println("Comenzando ejecucion de las consultas de la PL2");
                    primeraParte();
                    selection = "Done";
                    break;

                case "2":
                    System.out.println("Comenzando parte 2 de la practica");
                    ejer5();
                    break;

                default:
                    clearScreen();
                    System.out.println("No es una opcion correcta, vuelve a intentarlo");
            }
        }
    }
}
