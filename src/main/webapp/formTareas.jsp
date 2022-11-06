<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formulario</title>
    <link rel="stylesheet" href="./css/formStyle.css">
  </head>
  <body>
    <h1>Nueva Tarea</h1>
    <form action="MainServlet" method="POST">
      <label for="txtId">id:</label>
      <input type="text" name="id" id="txtId">
      <label for="txtTarea">Tarea: </label>
      <input type="text" name="tarea" id="txtTarea">
      
      <input type="submit" value="Procesar">
    </form>
  </body>
</html>
