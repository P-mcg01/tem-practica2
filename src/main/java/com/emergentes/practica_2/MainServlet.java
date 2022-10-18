package com.emergentes.practica_2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

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
    String op = request.getParameter("op");
    HttpSession sesion = request.getSession();
    ArrayList<Tarea> tareas = (ArrayList<Tarea>) sesion.getAttribute("tareas");

    switch (op) {
      case "vaciar":
        sesion.invalidate();
        response.sendRedirect("listaTareas.jsp");
        break;
      case "eliminar":
        final int id = Integer.parseInt(request.getParameter("id"));
        
        Optional<Tarea> buscado = tareas.stream()
                .filter(tarea -> tarea.getId() == id )
                .findFirst();
        if(buscado.isPresent()) {
          tareas.remove(buscado.get());
        }
        
        response.sendRedirect("listaTareas.jsp");
        break;
      case "check":
        final int idTarea = Integer.parseInt(request.getParameter("id"));
        
        Tarea tareaBuscada = tareas.stream()
                .filter(tarea -> tarea.getId() == idTarea )
                .findFirst()
                .get();
        
        if (tareaBuscada.isCompletado()) {
          tareaBuscada.setCompletado(false);
        } else {
          tareaBuscada.setCompletado(true);
        }
        response.sendRedirect("listaTareas.jsp");
        break;
    }
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    String tarea = request.getParameter("tarea");

    Tarea nuevaTarea = new Tarea();
    nuevaTarea.setId(id);
    nuevaTarea.setTarea(tarea);

    HttpSession sesion = request.getSession();
    ArrayList<Tarea> tareas = (ArrayList<Tarea>) sesion.getAttribute("tareas");
    tareas.add(nuevaTarea);

    response.sendRedirect("listaTareas.jsp");
  }
}
