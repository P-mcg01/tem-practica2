package com.emergentes.practica_2;

public class Tarea {
  private int id;
  private String tarea;
  private boolean completado;

  public Tarea() {
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTarea() {
    return tarea;
  }

  public void setTarea(String tarea) {
    this.tarea = tarea;
  }

  public boolean isCompletado() {
    return completado;
  }

  public void setCompletado(boolean completado) {
    this.completado = completado;
  }
}
