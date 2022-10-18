<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index</title>
    <style>
      body {
        display: flex;
        flex-flow: column nowrap;
        justify-content: center;
        align-items: center;
        font-family: sans-serif;
        background: radial-gradient(circle, 
          rgba(61,203,255,1) 0%, 
          rgba(30,95,177,1) 100%);
        background-repeat: no-repeat;
        height: 100vh;
        overflow-y: hidden;
      }
      
      h1 {
        position: absolute;
        top: 25vh;
        color: #2d1250;
      }
      
      div {
        display: flex;
        flex-flow: column nowrap;
        align-items: stretch;
        justify-content: center;
        border: thin solid #0077b6;
        padding: 2rem;
        width: 20vw;
        height: 20vw;
        border-radius: 50%;
        transition: all 0.5s ease-in-out 0.2s;
      }
      
      a {
        text-align: center;
        text-decoration: none;
        background-color: #03045e;
        height: inherit;
        border-radius: 50%;
        display: flex;
        flex-flow: column nowrap;
        justify-content: center;
        align-items: center;
        font-size: 1.1em;
        color: #caf0f8;
      }
      
      div:hover {
        font-size: 1em;
        text-decoration: underline;
        padding: 0.2em;
        width: 15vw;
        height: 15vw;
        background-color: #1a1b7c87;
      }
    </style>
  </head>
  <body>
    <% request.setAttribute("res", response); %>
    <jsp:include page="/ServletBienvenida" flush="false"/>
    <div>
      <a href="listaTareas.jsp">Lista de tareas</a>
    </div>
  </body>
</html>
