package Controlador;

import com.vienesraices.modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author informatica
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        ProveedoresDAO proveedoresDAO = new ProveedoresDAO();
        Proveedores proveedores = new Proveedores();
        HogaresDAO hogaresDAO = new HogaresDAO();
        Hogares hogares = new Hogares();

        if (menu.equals("Hogar")) {
            switch (accion) {
                case "Listar":
                    List<Hogares> listaHogares = hogaresDAO.listar();
                    request.setAttribute("hogares", listaHogares);
                    break;
                case "Buscar":
                    String codigoHog = request.getParameter("txtBuscarId");
                    List<Hogares> listaHogaresB = new ArrayList<>();
                    if (codigoHog != null && !codigoHog.trim().isEmpty()) {
                        try {
                            int codigoH = Integer.parseInt(codigoHog);
                            Hogares hogarEncontrado = hogaresDAO.buscar(codigoH);

                            if (hogarEncontrado != null) {
                                listaHogaresB.add(hogarEncontrado);
                            } else {
                                request.setAttribute("error", "Hogar no encontrado");
                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID de Hogar inválido");
                        }
                    } else {
                        listaHogaresB = hogaresDAO.listar();
                    }

                    request.setAttribute("hogares", listaHogaresB);
                    request.getRequestDispatcher("/Index/vistahogaradmin.jsp").forward(request, response);

                    break;
                case "Agregar":
                    String tipoHogar = request.getParameter("txtTipoHogar");
                    String ubicacion = request.getParameter("txtUbicacion");
                    double precioC = Double.parseDouble(request.getParameter("txtPrecio"));
                    int CodProv = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    hogares.setTipoHogar(tipoHogar);
                    hogares.setUbicacion(ubicacion);
                    hogares.setPrecio(precioC);
                    hogares.setCodigoProveedor(CodProv);
                    hogaresDAO.agregar(hogares);
                    if (proveedores != null) {
                        request.getRequestDispatcher("Controlador?menu=Hogar&accion=Listar").forward(request, response);
                    } else {
                        System.out.println("No sale");
                    }
                    break;

                case "Editar":
                    int idEditar = Integer.parseInt(request.getParameter("id"));
                    Hogares hogaresEditar = hogaresDAO.buscar(idEditar);
                    request.setAttribute("hogares", hogaresEditar);
                    request.setAttribute("hogares", hogaresDAO.listar());
                    request.getRequestDispatcher("/Index/vistahogaradmin.jsp").forward(request, response);
                    break;
                case "Actualizar":
                    int codigoHogar = Integer.parseInt(request.getParameter("txtCodigoHogar"));
                    String nuevoTipoHogar = request.getParameter("txtTipoHogar");
                    String nuevaUbicacion = request.getParameter("txtUbicacion");
                    double nuevoPrecioC = Double.parseDouble(request.getParameter("txtPrecio"));
                    int nuevoCodProv = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    hogares.setCodigoHogar(codigoHogar);
                    hogares.setTipoHogar(nuevoTipoHogar);
                    hogares.setUbicacion(nuevaUbicacion);
                    hogares.setPrecio(nuevoPrecioC);
                    hogares.setCodigoProveedor(nuevoCodProv);
                    int filas = hogaresDAO.actualizar(hogares);

                    System.out.println("Filas actualizadas: " + filas);

                    request.setAttribute("proveedores", proveedoresDAO.listar());
                    request.getRequestDispatcher("/Index/vistaproveedoradmin.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    String idEliminar = request.getParameter("id");
                    if (idEliminar != null && !idEliminar.trim().isEmpty()) {
                        try {
                            int codigo = Integer.parseInt(idEliminar);

                            int resultado = hogaresDAO.eliminar(codigo);

                            if (resultado > 0) {
                                request.setAttribute("mensaje", "Proveedor eliminado exitosamente");
                            } else {
                                request.setAttribute("error", "Error al eliminar el Proveedor");
                            }

                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID de Proveedor inválido");
                        }

                        response.sendRedirect("Controlador?menu=Proveedor&accion=Listar");
                        return;
                    }
                    break;
                default:
                    System.out.println("No se encontro");
            }
            request.getRequestDispatcher("/Index/vistahogaradmin.jsp").forward(request, response);
        } else if (menu.equals(
                "Proveedor")) {
            switch (accion) {
                case "Listar":
                    List<Proveedores> listaProveedores = proveedoresDAO.listar();
                    request.setAttribute("proveedores", listaProveedores);
                    break;
                case "Buscar":
                    String codigoProv = request.getParameter("txtBuscarId");
                    List<Proveedores> listaProveedoresB = new ArrayList<>();
                    if (codigoProv != null && !codigoProv.trim().isEmpty()) {
                        try {
                            int codigoP = Integer.parseInt(codigoProv);
                            Proveedores proveedorEncontrado = proveedoresDAO.buscar(codigoP);

                            if (proveedorEncontrado != null) {
                                listaProveedoresB.add(proveedorEncontrado);
                            } else {
                                request.setAttribute("error", "Proveedor no encontrado");
                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID de Proveedor inválido");
                        }
                    } else {
                        listaProveedoresB = proveedoresDAO.listar();
                    }

                    request.setAttribute("proveedores", listaProveedoresB);
                    request.getRequestDispatcher("/Index/vistaproveedoradmin.jsp").forward(request, response);

                    break;
                case "Agregar":
                    String nombreProveedor = request.getParameter("txtNombreProveedor");
                    String telefonoProveedor = request.getParameter("txtTelefonoProveedor");
                    String correoProveedor = request.getParameter("txtCorreoProveedor");
                    String paisProveedor = request.getParameter("txtPaisProveedor");
                    proveedores.setNombreProveedor(nombreProveedor);
                    proveedores.setTelefonoProveedor(telefonoProveedor);
                    proveedores.setCorreoProveedor(correoProveedor);
                    proveedores.setPaisProveedor(paisProveedor);
                    proveedoresDAO.agregar(proveedores);
                    if (proveedores != null) {
                        request.getRequestDispatcher("Controlador?menu=Proveedor&accion=Listar").forward(request, response);
                    } else {
                        System.out.println("No sale");
                    }
                    break;
                case "Editar":
                    int idEditar = Integer.parseInt(request.getParameter("id"));
                    Proveedores proveedorEditar = proveedoresDAO.buscar(idEditar);
                    request.setAttribute("proveedor", proveedorEditar);
                    request.setAttribute("proveedores", proveedoresDAO.listar());
                    request.getRequestDispatcher("/Index/vistaproveedoradmin.jsp").forward(request, response);
                    break;
                case "Actualizar":
                    int codigoProveedor = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    String nombreProveedorA = request.getParameter("txtNombreProveedor");
                    String telefonoProveedorA = request.getParameter("txtTelefonoProveedor");
                    String correoProveedorA = request.getParameter("txtCorreoProveedor");
                    String paisProveedorA = request.getParameter("txtPaisProveedor");
                    proveedores.setCodigoProveedor(codigoProveedor);
                    proveedores.setNombreProveedor(nombreProveedorA);
                    proveedores.setTelefonoProveedor(telefonoProveedorA);
                    proveedores.setCorreoProveedor(correoProveedorA);
                    proveedores.setPaisProveedor(paisProveedorA);
                    int filas = proveedoresDAO.actualizar(proveedores);

                    System.out.println("Filas actualizadas: " + filas);

                    request.setAttribute("proveedores", proveedoresDAO.listar());
                    request.getRequestDispatcher("/Index/vistaproveedoradmin.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    String idEliminar = request.getParameter("id");
                    if (idEliminar != null && !idEliminar.trim().isEmpty()) {
                        try {
                            int codigo = Integer.parseInt(idEliminar);

                            int resultado = proveedoresDAO.eliminar(codigo);

                            if (resultado > 0) {
                                request.setAttribute("mensaje", "Proveedor eliminado exitosamente");
                            } else {
                                request.setAttribute("error", "Error al eliminar el Proveedor");
                            }

                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID de Proveedor inválido");
                        }

                        response.sendRedirect("Controlador?menu=Proveedor&accion=Listar");
                        return;
                    }
                    break;
                default:
                    System.out.println("No se encontro");
            }
            request.getRequestDispatcher("/Index/vistaproveedoradmin.jsp").forward(request, response);
        } else if (menu.equals(
                "VistaAdmin")) {
            request.getRequestDispatcher("Index/vistaadmin.jsp").forward(request, response);
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
