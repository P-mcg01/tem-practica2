<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formulario</title>
    <style>
      body {
        display: flex;
        flex-flow: column nowrap;
        justify-content: flex-start;
        align-items: center;        
        font-family: sans-serif;
        background: linear-gradient(225deg, 
          rgba(141,253,255,1) 0%, 
          rgba(74,165,195,1) 30%, 
          rgba(0,71,138,1) 100%);
        background-repeat: no-repeat;
        height: 100vh;
        overflow-y: hidden;
      }
      
      form {
        width: 40vw;
        margin: 10vh auto;
        padding: 2em;
        border-radius: 10px;
        background-color: rgba(0, 29, 56, 0.8);
        display: flex;
        color: #eee;
        box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.5);
        flex-flow: column nowrap;
        row-gap: 0.5em;
      }
      
      input[type="submit"] {
        color: #222;
        background-color: rgb(74,165,195);
        border: none;
        cursor: pointer;
        padding: 16px 20px;
        align-self: center;
        font-size: 1.1em;
        border-radius: 10px;
        transition: all 0.5s ease-in-out 0.2s;
      }
      
      input[type="submit"]:hover {
        border-radius: 30px;
        background-color: #3a7d93;
        color: #90e0ef;
      }
      
      input[type="text"] {
        outline: none;
        border: none;
        background-color: rgba(255, 255, 255, 0.1);
        color: #ddd;
        padding: 8px 10px;
        margin-bottom: 1em;
      }
    </style>
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
