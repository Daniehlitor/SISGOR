<%-- 
    Document   : registrar_plato
    Created on : 19/05/2024, 1:00:44 p. m.
    Author     : Daniel
--%>

<%@page import="com.compensar.sisgor.classes.Ingrediente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="styles/general.css"/>
        <title>Registrar Platos</title>
    </head>
    <body>
        <% ArrayList<Ingrediente> ingredientes = Ingrediente.getIngredientes(); %>
        <section class="content">
            <h2>Registrar Platos</h2>
            <form action="svRegistrarPlato" method="POST">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" name="nombre" id="nombre">
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripcion</label>
                    <textarea id="descripcion" name="descripcion"></textarea>
                </div>
                <div class="form-group">
                    <label for="ingrediente">Ingrediente</label>
                    <select id="ingrediente" name="ingrediente" value="0">
                        <option value="0">Selecciona un Ingrediente...</option>
                        <% for (Ingrediente ingrediente : ingredientes) {%>
                        <option value="<%=ingrediente.getId()%>"><%=ingrediente.getNombre()%> - <%=ingrediente.getCantidad()%>gr Disponibles</option>
                        <% }%>
                    </select>
                </div>
                <div class="form-group form-group-button">
                    <label for="cantidad">Cantidad (gr)</label>
                    <input type="number" name="cantidad" id="cantidad">
                    <button type="button" id="add-ingredient">Agregar</button>
                </div>
                <div id="ingredients-add"></div>
                <div class="form-group">
                    <label for="precio">Precio.</label>
                    <input type="number" name="precio" id="precio">
                </div>
                <input type="hidden" name="ingredientes">
                <input type="button" onclick="onSubmit()" value="Aceptar"></input>
                <input hidden id="submit-button" type="submit" value="Aceptar" />
            </form>
        </section>
    </body>

    <script>
        $('#add-ingredient').on('click', () => {
            const id = $('#ingrediente').val();
            if (id === 0 || id === '0')
                return;
            const cantidad = $('#cantidad').val();
            const nombre = $('#ingrediente option:selected').text().split('-')[0];
            const ingredient_added = $('#ingredient-' + id).text();

            $('#ingrediente').val('0');
            $('#cantidad').val('');

            if (ingredient_added !== '') {
                const cantidad_act = ingredient_added.split(' ')[1].replace('gr', '');
                const cantidad_new = parseFloat(cantidad) + parseFloat(cantidad_act);
                console.log(cantidad_new);
                $('#ingredient-' + id).text(nombre + ' ' + cantidad_new + 'gr');
                return;
            }
            $('#ingredients-add').append('<span class="ingredient-added" id="ingredient-' + id + '">' + nombre + ' ' + cantidad + 'gr </span>');
        });

        onSubmit = () => {
            var result = [];
            $('.ingredient-added').each((i, el) => {
                const id = $(el).attr('id').split('-')[1];
                const cantidad = $(el).text().trim().replace(/\s+/g, ' ').split(' ');
                result.push(id + '-' + cantidad[cantidad.length - 1].replace('gr', ''));
            });
            $('input[name="ingredientes"]').val(result.join(','));
            $('#submit-button').click();
        };
    </script>
</html>
