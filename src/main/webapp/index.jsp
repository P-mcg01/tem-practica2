<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index</title>
    <link rel="stylesheet" href="./css/index.css">
  </head>
  <body>
    <% request.setAttribute("res", response); %>
    <jsp:include page="/ServletBienvenida" flush="false"/>
    <div>
      <a href="listaTareas.jsp">Lista de tareas</a>
    </div>
  </body>
</html>
