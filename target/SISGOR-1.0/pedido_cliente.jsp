<%-- 
    Document   : pedido_cliente
    Created on : 19/05/2024, 4:38:31 p. m.
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/general.css"/>
        <title>Pedidos Cliente</title>
    </head>
    <body>
        <section class="content content-clientes">

            <div class="item-pedido">
                <img src="assets/servido.png" alt="alt"/>
                <div class="pedido-info">
                    <h2>Pasta Carbonara</h2>
                    <h5>¿Que es?</h5>
                    <p>Este plato es una gonorrea re aspera, le va a gustar tanto que probablemente termine siendo asexual porque el mayor placer que vas a experimentar es este plato</p>
                    <h5>Ingredientes</h5>
                    <div class="ingredients-add">
                        <span>Tomate</span>
                    </div>
                    <h5>Precio: $10.000</h5>
                </div>
                <div class="buttons-pedido">
                    <button>-</button>
                    <input readonly type="text" id="cantidad-1" value="0">
                    <button>+</button>
                </div>
            </div>

        </section>
    </body>
</html>
