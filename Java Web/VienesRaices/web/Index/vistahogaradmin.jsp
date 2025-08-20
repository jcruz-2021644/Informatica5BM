<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta https-equiv=" X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CRUD_Hogar</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/Images/logo.jpg">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/vistahogaradmin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>

    <body>
        <nav class="navbar">
            <div class="nav-content">
                <div class="logo">K<span>.CA</span></div>
                <ul class="menu">
                    <li><a href="Controlador?menu=VistaAdmin">Menu Administracion</a></li>
                </ul>
            </div>
        </nav>

        <section>
            <div class="container">
                <h1>Bienvenido al CRUD completo de la entidad <b>Hogar</b></h1>

                <!--apartado y actualizar para crear el hogar-->
                <div class="section">
                    <h2>Agregar o actualizar hogar</h2>
                    <form action="Controlador?menu=Hogar" method="POST">
                        <input type="hidden" name="txtCodigoHogar" value="${hogar.getCodigoHogar()}">
                        <div class="form-row">
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtTipoHogar" value="${hogar.getTipoHogar()}" required>
                                <label class="label-input">Tipo Hogar</label>
                            </div>
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtUbicacion" value="${hogar.getUbicacion()}" required>
                                <label class="label-input">Ubicación</label>
                            </div>
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtPrecio" value="${hogar.getPrecio()}" required>
                                <label class="label-input">Precio en Quetzales</label>
                            </div>
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtCodigoProveedor" value="${hogar.getCodigoProveedor()}" required>
                                <label class="label-input">Codigo del Proveedor</label>
                            </div>
                        </div>
                        <div class="form-row">
                            <button type="submit" class="btn_actualizar" value="Agregar" name="accion">
                                <span class="bnt_texto">Crear Hogar</span>
                                <span class="btn_icono">
                                    <i class="fa-solid fa-plus"></i>
                                </span>
                            </button>

                            <button type="submit" class="btn_actualizar" name="accion" value="Actualizar">
                                <span class="bnt_texto">Actualizar</span>
                                <span class="btn_icono">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </span>
                            </button>
                        </div>
                    </form>
                </div>

                <div class="section">
                    <h2>Lista y Buscar</h2>
                    <form action="Controlador?menu=Hogar" method="POST" class="search-section">
                        <div class="form-group search-group">
                            <input type="text" class="entrada_texto search-input" name="txtBuscarId" placeholder="">
                            <label class="label-input">Buscar Hogar.</label>
                            <div class="search-icon">
                                <i class="fa-solid fa-search"></i>
                            </div>
                        </div>

                        <button type="submit" name="accion" value="Buscar" style="display:none;"></button>

                        <button type="button" class="btn_eliminar" 
                                onclick="window.location.href = 'Controlador?menu=Hogar&accion=Listar'">
                            <span class="bnt_texto">Cancelar</span>
                            <span class="btn_icono">
                                <i class="fa fa-solid fa-x"></i>
                            </span>
                        </button>
                    </form>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th scope="col">Codigo del Hogar</th>
                                    <th scope="col">Tipo de Hogar</th>
                                    <th scope="col">Ubicacion del Hogar</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Codigo Proveedor</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="hogares" items="${hogares}"><tr> 
                                        <td>${hogares.getCodigoHogar()}</td>
                                        <td>${hogares.getTipoHogar()}</td>
                                        <td>${hogares.getUbicacion()}</td>
                                        <td>${hogares.getPrecio()}</td>
                                        <td>${hogares.getCodigoProveedor()}</td>
                                        <td>
                                            <button 
                                                type="button" 
                                                class="btn_editar" 
                                                onclick="window.location.href = 'Controlador?menu=Hogar&accion=Editar&id=${hogares.getCodigoHogar()}'">
                                                <span class="bnt_texto">Editar</span>
                                                <span class="btn_icono">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </span>
                                            </button>

                                            <button 
                                                type="button" 
                                                class="btn_eliminar" 
                                                onclick="window.location.href = 'Controlador?menu=Hogar&accion=Eliminar&id=${hogares.getCodigoHogar()}'">
                                                <span class="bnt_texto">Eliminar</span>
                                                <span class="btn_icono">
                                                    <i class="fa fa-trash"></i>
                                                </span>
                                            </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <form class="mensaje_eliminar">
                        <input type="hidden">
                        <div class="message warning">
                            <i class="fa fa-exclamation-triangle"></i>
                            <strong>¡Atención!</strong> Recuerda que vas a eliminar un registro si lo haces se
                            borrara de
                            forma permanente lo que quiere decir que ya nunca lo recuperaras
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>

</html>