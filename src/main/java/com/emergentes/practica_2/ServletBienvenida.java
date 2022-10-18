package com.emergentes.practica_2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Optional;
import java.util.stream.Stream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletBienvenida", urlPatterns = {"/ServletBienvenida"})
public class ServletBienvenida extends HttpServlet {

  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    Cookie[] cookies = request.getCookies();
    HttpServletResponse res = (HttpServletResponse) request.getAttribute("res");
    
    if(cookies != null) {
      Stream<Cookie> cookiesStream = Arrays.stream(cookies);
      Optional<Cookie> buscado = cookiesStream.filter(cookie -> {
        return cookie.getName().equals("nuevoVisitante") && 
               cookie.getValue().equals("false");
      }).findFirst();
      
      if(buscado.isPresent()) {
        // no es la primera visita
        out.println("<h1>Gracias por visitarnos nuevamente</h1>");
      } else {
        // primera visita
        Cookie cookieVisita = new Cookie("nuevoVisitante", "false");
        cookieVisita.setMaxAge(3600);
        res.addCookie(cookieVisita);
        res.setContentType("text/html");
        out.println("<h1>Bienvenido a nuestro sitio web</h1>");
      } 
    } else {
      // primera visita
      Cookie cookieVisita = new Cookie("nuevoVisitante", "false");
      cookieVisita.setMaxAge(3600);
      res.addCookie(cookieVisita);
      res.setContentType("text/html");
      out.println("<h1>Bienvenido a nuestro sitio web</h1>");
    }
  }
}
