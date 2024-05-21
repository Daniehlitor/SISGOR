/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.compensar.sisgor.classes;

import com.compensar.sisgor.DBConnection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author daniel
 */
public class Usuario {

    private final int id;
    private final String nombre;
    private final String numero_identificacion;

    public Usuario(int id, String nombre, String numero_identificacion) {
        this.id = id;
        this.nombre = nombre;
        this.numero_identificacion = numero_identificacion;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNumeroIdentificacion() {
        return numero_identificacion;
    }

    public static Usuario getUsuario(String id_number) throws SQLException {
        ResultSet result = DBConnection.getStatement().executeQuery("SELECT * FROM users WHERE users_id_number=" + id_number);
        if (result.next()) {
            return new Usuario(
                    result.getInt(1),
                    result.getString(2),
                    result.getString(3)
            );
        } else {
            return null;
        }
    }

    public static Usuario createUsuario(String nombre, String identificacion) throws SQLException {
        String query = "INSERT INTO users (users_name, users_id_number) VALUES ('" + nombre + "','" + identificacion + "')";
        int result_insert = DBConnection.getStatement().executeUpdate(query);
        System.out.println(result_insert);
        ResultSet result = DBConnection.getStatement().executeQuery("SELECT * FROM users ORDER BY users_id DESC LIMIT 1");
        result.next();
        return new Usuario(
                result.getInt(1),
                result.getString(2),
                result.getString(3)
        );
    }

}
