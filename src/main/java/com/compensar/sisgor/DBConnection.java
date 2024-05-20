/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.compensar.sisgor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Daniel
 */
public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/restaurante";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    private static Connection connection;
    private static Statement statement;

    public static void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            statement = connection.createStatement();
            System.out.println("Conectado!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }

    public static void disconnect() {
        try {
            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static Statement getStatement() throws SQLException {
        statement = connection.createStatement();
        return statement;
    }

}
