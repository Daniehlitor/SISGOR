<%-- 
    Document   : cliente
    Created on : 19/05/2024, 12:37:38 p. m.
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/general.css"/>
        <title>Cliente</title>
    </head>
    <body>
        <section class="content">
            <h2>¡Bienvenido!</h2>
            <form action="pedido_cliente.jsp">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input placeholder="Ingresa tu nombre" type="text" name="nombre" id="nombre">
                </div>
                <div class="form-group">
                    <label for="descripcion"># de Identificación</label>
                    <input placeholder="Ingresa tu numero de identificación" type="text" name="nombre" id="nombre">
                </div>
                <input type="submit" value='¡Comenzar a Pedir!' />
            </form>
        </section>
    </body>
</html>
