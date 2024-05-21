/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.compensar.sisgor.servlets;

import com.compensar.sisgor.classes.Ingrediente;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "svRegistrarIngrediente", urlPatterns = {"/svRegistrarIngrediente"})
public class svRegistrarIngrediente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ingrediente = request.getParameter("ingrediente");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String precio = request.getParameter("precio");
        String cantidad = request.getParameter("cantidad");

        try {
            if (ingrediente.equals("-1")) {
                Ingrediente.createIngrediente(
                        nombre,
                        descripcion,
                        Double.parseDouble(precio),
                        Double.parseDouble(cantidad)
                );
            } else if (!ingrediente.equals("0")) {
                Ingrediente db_ingrediente = Ingrediente.getIngrediente(Integer.parseInt(ingrediente));
                double db_cantidad = db_ingrediente.getCantidad();
                db_ingrediente.setCantidad(Double.parseDouble(cantidad) + db_cantidad);
            }
            response.sendRedirect("index.jsp");
        } catch (IOException | NumberFormatException | SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
