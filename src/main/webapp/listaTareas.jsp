<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.practica_2.Tarea"%>

<%
    final JspWriter salida = pageContext.getOut();
    if(session.getAttribute("tareas") == null){
        ArrayList<Tarea> tareas = new ArrayList<>();
        session.setAttribute("tareas", tareas);
    }
    
    ArrayList<Tarea> tareas = (ArrayList<Tarea>)session.getAttribute("tareas");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista Tareas</title>
    <link rel="stylesheet" href="./css/listaStyle.css">
  </head>
  <body>
    <h1>TAREAS PENDIENTES</h1>
    <div>
      <a class="button" href="formTareas.jsp">Nuevo</a>
      <a class="button" href="MainServlet?op=vaciar">Vaciar lista</a>
    </div>

    <table>
      <tr>
        <th>Id</th>
        <th>Tarea</th>
        <th>Completado</th>
        <th></th>
      </tr>
      <%
        if (tareas == null || tareas.isEmpty()) {
          out.println("<tr><td colspan='4'>No hay tareas pendientes.</td></tr>");
        } else {
          tareas.forEach(tarea -> {
            StringBuilder registro = new StringBuilder();
            try {
              registro.append("<tr>");
              registro.append("<td>" + tarea.getId() + "</td>");
              registro.append("<td>" + tarea.getTarea() + "</td>");
              registro.append("<td><a class='check' href='MainServlet?op=check&id=" +
                tarea.getId() + 
                "'>realizado</a><input class='icon' type='checkbox'" + 
                (tarea.isCompletado() ? "checked" : "") + 
                "/></td>");
              registro.append("<td><a class='delete' href='MainServlet?op=eliminar&id=" + 
                tarea.getId() + "'>eliminar</a></td>");
              registro.append("</tr>");
              
              salida.println(registro.toString());
            } catch(IOException e) {
              e.printStackTrace();
            }
          });
        }
      %>
    </table>
    
    <a class="button" href="index.jsp">Regresar</a>
    <script type="text/javascript">
      let checkboxs = document.getElementsByClassName("icon");
      const boxArray = [...checkboxs];
      
      boxArray.forEach(boton => {
        boton.addEventListener('click', (e) => {
          e.preventDefault();
        });
      });
    </script>
  </body>
</html>
