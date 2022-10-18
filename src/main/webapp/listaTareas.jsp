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
    <style>
      body {
        display: flex;
        flex-flow: column nowrap;
        justify-content: flex-start;
        align-items: center;
        gap: 1.5em;
        font-family: sans-serif;
        background: linear-gradient(225deg, 
          rgba(141,253,255,1) 0%, 
          rgba(74,165,195,1) 30%, 
          rgba(0,71,138,1) 100%);
        background-repeat: no-repeat;
        height: 100vh;
        overflow-y: hidden;
      }
      
      table {
        border: none;
        border-collapse: collapse;
        box-shadow: 8px 5px 10px rgba(0, 0, 0, 0.2);        
        width: 70vw;
        color: #cae9ff;
      }
      
      th {
        background-color: #023e8a;
        padding: 0.5em;
      }
      
      tr:nth-child(even) {
        background-color: #90e0ef;
      }
      
      tr:nth-child(odd) {
        background-color: #48cae4;
      }
      
      td {
        text-align: center;
        padding: 0.25em 0; 
        color: #2d1250;
      }
      
      .button {
        text-decoration: none;
        background-color: rgba(110, 106, 219, 0.8);
        padding: 0.5em 1em;
        border-radius: 10px;
        margin-right: 2em;
        box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
        color: #fff;
      }
      
      .button:hover {
        text-decoration: underline;
      }
      
      .check {
        color: #2700ff;
        font-weight: 500;
        text-decoration: none;
      }
      
      .check:hover {
        text-decoration: underline;
      }
      
      .delete {
        color: #ff1d1d;
        text-decoration: none;
        font-weight: 500;
        letter-spacing: 1px;
      }
      
      .delete:hover {
        text-decoration: underline;
      }
    </style>
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
