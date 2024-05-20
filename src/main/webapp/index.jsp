<%-- 
    Document   : index
    Created on : 19/05/2024, 2:08:32 a. m.
    Author     : Daniel
--%>
<%@page import="com.compensar.sisgor.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/general.css"/>
        <title>SISGOR</title>
    </head>
    <% DBConnection.connect(); %>
    <body>
        <section class="content">
            <a href="restaurante.jsp" class="button-index">
                <img src="./assets/cocinando.png" alt="alt"/>
                Restaurante
            </a>
            <a href="cliente.jsp" class="button-index">
                <img src="./assets/servido.png" alt="alt"/>
                Cliente
            </a>
        </section>
    </body>
</html>
