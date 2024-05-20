<%-- 
    Document   : registrar_ingredientes
    Created on : 19/05/2024, 1:01:23 p. m.
    Author     : Daniel
--%>

<%@page import="com.compensar.sisgor.classes.Ingrediente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/general.css"/>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <title>Registrar Ingredientes</title>
    </head>
    <body>
        <% ArrayList<Ingrediente> ingredientes = Ingrediente.getIngredientes();%>
        <section class="content">
            <h2>Registrar Ingredientes</h2>
            <form action="svRegistrarIngrediente" method="POST">
                <div class="form-group">
                    <label for="ingrediente">Ingrediente</label>
                    <select id="ingrediente" name="ingrediente" value="0">
                        <option value="0">Selecciona un Ingrediente...</option>
                        <option value="-1">Agregar Nuevo Ingrediente</option>
                        <% for (Ingrediente ingrediente : ingredientes) {%>
                        <option value="<%=ingrediente.getId()%>"><%=ingrediente.getNombre()%></option>
                        <% }%>

                    </select>
                </div>
                <div hidden id="new-ingredient">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" name="nombre" id="nombre">
                    </div>
                    <div class="form-group">
                        <label for="descripcion">Descripcion</label>
                        <textarea id="descripcion" name="descripcion"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="precio">Precio / Kg.</label>
                        <input type="number" name="precio" id="precio">
                    </div>
                </div>
                <div class="form-group">
                    <label for="cantidad">Cantidad (gr)</label>
                    <input type="number" name="cantidad" id="cantidad">
                </div>
                <input type="submit" value="Aceptar" />
            </form>
        </section>
    </body>

    <script>
        $('select').on('change', function () {
            if (this.value == -1) {
                console.log(this.value);
                $("#new-ingredient").removeAttr('hidden');
            } else {
                $("#new-ingredient").attr('hidden', 'true');
            }

        });
    </script>
</html>
