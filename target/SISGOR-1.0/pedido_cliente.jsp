<%-- 
    Document   : pedido_cliente
    Created on : 19/05/2024, 4:38:31 p. m.
    Author     : Daniel
--%>

<%@page import="com.compensar.sisgor.classes.Ingrediente"%>
<%@page import="com.compensar.sisgor.classes.Plato"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.compensar.sisgor.classes.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
    System.out.println(usuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/general.css"/>
        <title>¡Bienvenido <%=usuario.getNombre()%>!</title>
    </head>
    <body>
        <section class="content content-clientes">

            <hr>
            <h2>¡Bienvenido <%=usuario.getNombre()%>!</h2>

            <%for (Plato plato : Plato.getPlatos()) {%>
            <div class="item-pedido">
                <img src="assets/servido.png" alt="alt"/>
                <div class="pedido-info">
                    <h2><%=plato.getNombre()%></h2>
                    <h5>¿Que es?</h5>
                    <p><%=plato.getDescripcion()%></p>
                    <h5>Ingredientes</h5>
                    <div class="ingredients-add">
                        <%
                            for (Ingrediente ingrediente : plato.getIngredientes()) {
                            System.out.println(ingrediente.getNombre());
                        %>
                        <span><%=ingrediente.getNombre()%></span>
                        <% }%>
                    </div>
                    <h5>Precio: $<%=plato.getPrecio()%></h5>
                </div>
                <!--                <div class="buttons-pedido">
                                    <button>-</button>
                                    <input readonly type="text" id="cantidad-1" value="0">
                                    <button>+</button>
                                </div>-->
            </div>
            <% }%>
        </section>
    </body>
</html>
