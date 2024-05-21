/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.compensar.sisgor.servlets;

import com.compensar.sisgor.classes.Plato;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "svRegistrarPlato", urlPatterns = {"/svRegistrarPlato"})
public class svRegistrarPlato extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String precio = request.getParameter("precio");
        String[] ingredientes_params = request.getParameter("ingredientes").split(",");
        System.out.println(precio);

        try {
            Plato plato = Plato.createPlato(
                    nombre,
                    descripcion,
                    Double.parseDouble(precio)
            );
            
            System.out.println(plato.getNombre());
            
            plato.setIngredientes(ingredientes_params);
            
            response.sendRedirect("index.jsp");

        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
