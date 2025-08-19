<%-- 
    Document   : vistaadmin
    Created on : 22 jul 2025, 13:07:15
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>KC Admin - Panel de Control</title>
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;600;700;900&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/vistaadmin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>

    <body>
        <nav class="navbar">
            <div class="nav-content">
                <div class="logo">K<span>CA</span></div>
                <ul class="menu">
                    <li><a href="#">Inicio</a></li>>
            </div>
        </nav>

        <div class="container">
            <div class="hero">
                <h1>Panel de Administración</h1>
                <p>Gestiona todos los aspectos de tu tienda desde este panel centralizado. Accede rápidamente a cada
                    sección.</p>
            </div>

            <div class="dashboard-grid">
               

                <div class="admin-card">
                    <span class="card-icon">
                        <i class="fa-solid fa-boxes-packing"></i> </span>
                    <h3 class="card-title">Proveedor</h3>
                    <p class="card-description">Gestiona la información de los Proveedores, como agregar, listar,
                        actualizar, eliminar.</p>
                    <a href="Controlador?menu=Proveedor&accion=Listar" class="btn_ver_gestion">Gestionar Proveedores</a>
                </div>

                <div class="admin-card">
                    <span class="card-icon">
                        <i class="fa-brands fa-product-hunt"></i>
                    </span>
                    <h3 class="card-title">Producto</h3>
                    <p class="card-description">
                        Gestiona la información de Productos, como agregar, listar, actualizar, eliminar.
                    </p>
                    <a href="Controlador?menu=Hogar&accion=Lista" class="btn_ver_gestion">Gestionar Productos</a>
                </div>
            </div>
        </div>

    </body>

</html>
