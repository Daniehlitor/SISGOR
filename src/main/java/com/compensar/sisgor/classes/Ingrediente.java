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
 * @author Daniel
 */
public class Ingrediente {

    private int id;
    private String nombre;
    private String descripcion;
    private double cantidad;
    private double precio;

    public Ingrediente(int id, String nombre, String descripcion, double cantidad, double precio) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.cantidad = cantidad;
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

    public double getCantidad() {
        return cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setCantidad(double cantidad) throws SQLException {
        this.cantidad = cantidad;
        String query = "UPDATE ingredientes SET ingredientes_cantidad =" + this.cantidad + " WHERE ingredientes_id=" + this.id;
        int result = DBConnection.getStatement().executeUpdate(query);
        System.out.println(result);
    }

    public static void createIngrediente(String nombre, String descripcion, double cantidad, double precio) throws SQLException {
        String query = "INSERT INTO ingredientes (ingredientes_nombre, ingredientes_descripcion, ingredientes_cantidad, ingredientes_precio) VALUES ('" + nombre + "','" + descripcion + "'," + cantidad + "," + precio + ")";
        int result = DBConnection.getStatement().executeUpdate(query);
        System.out.println(result);
    }

    public static Ingrediente getIngrediente(int id) throws SQLException {
        ResultSet result = DBConnection.getStatement().executeQuery("SELECT * FROM ingredientes WHERE ingredientes_id=" + id);
        result.next();
        return new Ingrediente(
                result.getInt(1),
                result.getString(2),
                result.getString(3),
                result.getDouble(4),
                result.getDouble(5)
        );
    }

    public static ArrayList<Ingrediente> getIngredientes() throws SQLException {
        ResultSet result = DBConnection.getStatement().executeQuery("SELECT * FROM ingredientes");
        ArrayList<Ingrediente> array_result = new ArrayList<>();
        while (result.next()) {
            array_result.add(
                    new Ingrediente(
                            result.getInt(1),
                            result.getString(2),
                            result.getString(3),
                            result.getDouble(4),
                            result.getDouble(5)
                    )
            );
        }
        return array_result;
    }

}
