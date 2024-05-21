/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.compensar.sisgor.servlets;

import com.compensar.sisgor.classes.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author daniel
 */
@WebServlet(name = "svRegistrarUsuario", urlPatterns = {"/svRegistrarUsuario"})
public class svRegistrarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String numero_id = request.getParameter("identificacion");

        try {
            Usuario usuario = Usuario.getUsuario(numero_id);
            if (usuario == null) {
                usuario = Usuario.createUsuario(nombre, numero_id);
            }
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            response.sendRedirect("pedido_cliente.jsp");

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
