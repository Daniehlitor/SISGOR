/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.compensar.sisgor.classes;

import com.compensar.sisgor.DBConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author daniel
 */
public class Plato {

    private final int id;
    private final String nombre;
    private final String descripcion;
    private final double precio;

    public Plato(int id, String nombre, String descripcion, double precio) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public ArrayList<Ingrediente> getIngredientes() throws SQLException {
        ResultSet result = DBConnection.getStatement().executeQuery("SELECT ingredientes_nombre, platos_ingredientes_cantiad FROM platos_ingredientes INNER JOIN ingredientes ON platos_ingredientes_ingredientes_id = ingredientes.ingredientes_id  WHERE platos_ingredientes_platos_id = " + this.id);
        ArrayList<Ingrediente> array_result = new ArrayList<>();
        while (result.next()) {
            array_result.add(
                    new Ingrediente(
                            result.getString(1),
                            result.getDouble(2)
                    )
            );
        }
        return array_result;
    }

    public void setIngredientes(String[] ingredientes_str) throws SQLException {
        for (String ingrediente_str : ingredientes_str) {
            String[] params = ingrediente_str.split("-");
            String query = "INSERT INTO platos_ingredientes (platos_ingredientes_platos_id, platos_ingredientes_ingredientes_id, platos_ingredientes_cantiad) VALUES (" + this.id + "," + params[0] + "," + params[1] + ")";
            int result_insert = DBConnection.getStatement().executeUpdate(query);
            System.out.println(result_insert);
//            ResultSet result = DBConnection.getStatement().executeQuery("SELECT * FROM ingredientes WHERE ingredientes_id=" + id);
//            result.next();
//            Ingrediente new_ingredient = new Ingrediente(
//                    result.getInt(1),
//                    result.getString(2),
//                    result.getString(3),
//                    result.getDouble(4),
//                    result.getDouble(5)
//            );
//            new_ingredient.setCantidad(new_ingredient.getCantidad() - Double.parseDouble(params[1]));
        }
    }

    public static Plato createPlato(String nombre, String descripcion, double precio) throws SQLException {
        String query = "INSERT INTO platos (platos_nombre, platos_descripcion, platos_precio) VALUES ('" + nombre + "','" + descripcion + "'," + precio + ")";
        int result_insert = DBConnection.getStatement().executeUpdate(query);
        System.out.println(result_insert);
        ResultSet result = DBConnection.getStatement().executeQuery("SELECT * FROM platos ORDER BY platos_id DESC LIMIT 1");
        result.next();
        return new Plato(
                result.getInt(1),
                result.getString(2),
                result.getString(3),
                result.getDouble(4)
        );
    }

    public static Plato getPlato(int id) throws SQLException {
        ResultSet result = DBConnection.getStatement().executeQuery("SELECT * FROM platos WHERE platos_id=" + id);
        result.next();
        return new Plato(
                result.getInt(1),
                result.getString(2),
                result.getString(3),
                result.getDouble(4)
        );
    }

    public static ArrayList<Plato> getPlatos() throws SQLException {
        ResultSet result = DBConnection.getStatement().executeQuery("SELECT * FROM platos");
        ArrayList<Plato> array_result = new ArrayList<>();
        while (result.next()) {
            array_result.add(
                    new Plato(
                            result.getInt(1),
                            result.getString(2),
                            result.getString(3),
                            result.getDouble(4)
                    )
            );
        }
        return array_result;
    }

}
