<%-- 
    Document   : restaurante
    Created on : 19/05/2024, 12:37:25 p. m.
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/general.css"/>
        <title>Restaurante</title>
    </head>
    <body>
        <section class="content">
            <a href="registrar_ingredientes.jsp" class="button-index">
                <img src="./assets/ingredientes.png" alt="alt"/>
                Registrar Ingredientes
            </a>
            <a href="registrar_plato.jsp" class="button-index">
                <img src="./assets/platos.png" alt="alt"/>
                Registrar Platos
            </a>
            <a href="pedidos_activos.jsp" class="button-index">
                <span>1</span>
                <img src="./assets/pedidos.png" alt="alt"/>
                Pedidos Activos
            </a>
        </section>
    </body>
</html>
