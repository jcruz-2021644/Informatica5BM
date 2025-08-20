
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>K.CA - Página Principal</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/Images/logo.jpg">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/menu.css">

        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css" rel="stylesheet">

        <style>

        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-custom fixed-top fade-in">
            <div class="container">
                <div class="logo">K<span>.CA</span></div>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" 
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="Controlador?menu=VistaAdmin">Menu Administracion</a>
                        </li>
                       
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="main-container" style="padding-top: 100px;">
            <!-- Carousel -->
            <div class="carousel-container fade-in">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="5000">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleControls" data-slide-to="1"></li>
                        <li data-target="#carouselExampleControls" data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/Images/hogar1.jpg" alt="Primera imagen">
                            <div class="carousel-caption d-none d-md-block">
                                <h5 style="text-shadow: 2px 2px 4px rgba(0,0,0,0.8);">Bienvenidos a K.CA</h5>
                                <p style="text-shadow: 1px 1px 2px rgba(0,0,0,0.8);">La mejor pagina para vender casas</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/Images/hogar2.jpg" alt="Primera imagen">
                            <div class="carousel-caption d-none d-md-block">
                                <h5 style="text-shadow: 2px 2px 4px rgba(0,0,0,0.8);">Nuestros Servicios</h5>
                                <p style="text-shadow: 1px 1px 2px rgba(0,0,0,0.8);">Vendemos o alquilamo casas y apartamentos</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/Images/hogar3.jpg" alt="Primera imagen">
                            <div class="carousel-caption d-none d-md-block">
                                <h5 style="text-shadow: 2px 2px 4px rgba(0,0,0,0.8);">Contactanos</h5>
                                <p style="text-shadow: 1px 1px 2px rgba(0,0,0,0.8);">+502 4153 1452</p>
                            </div>
                        </div>
                    </div>

                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Anterior</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Siguiente</span>
                    </a>
                </div>
            </div>

            <!-- Information Section -->
            <section class="caracteristicas">
                <div class="flashcard">
                    <img src="${pageContext.request.contextPath}/Images/hogar4.jpg" alt="Hotel">
                    <div class="flashcard__content">
                        <p class="flashcard__title">Caramel, A Grecotel Resort to Live</p>
                        <p class="flashcard__description">Disfruta de un servicio de primera clase en el Caramel, A Grecotel Resort to Live. El Caramel, A Grecotel Resort to Live, que dispone de piscina al aire libre, está situado en Adelianos Kampos, en Rétino. Alberga un restaurante y ofrece alojamientos decorados con buen gusto, algunos con vistas al mar de Creta. Hay conexión WiFi gratuita en todas las instalaciones. Todos los alojamientos del Caramel, A Grecotel Resort to Live, amplios y luminosos, disponen de balcón, TV de pantalla plana, minibar y caja fuerte.</p>
                        <a href="#" class="flashcard__link">Ver mas hogares</a>
                    </div>
                </div>

                <div class="flashcard">
                    <img src="${pageContext.request.contextPath}/Images/hogar5.jpg" alt="Hotel">
                    <div class="flashcard__content">
                        <p class="flashcard__title">Enorme Santanna Beach</p>
                        <p class="flashcard__description">Disfruta de un servicio de primera clase en el Caramel, A Grecotel. El hotel ofrece habitaciones con aire acondicionado, escritorio, cafetera, caja fuerte, TV de pantalla plana, balcón y baño privado con ducha. En Enorme Santanna Beach, las habitaciones tienen ropa de cama y toallas. El desayuno ofrece opciones buffet, a la carta o continentales.</p>
                        <a href="#" class="flashcard__link">Ver mas hogares</a>
                    </div>
                </div>

                <div class="flashcard">
                    <img src="${pageContext.request.contextPath}/Images/hogar6.jpg" alt="Hotel">
                    <div class="flashcard__content">
                        <p class="flashcard__title">Hotel-Villas JABEL TINAMIT</p>
                        <p class="flashcard__description">En el hotel, las habitaciones están equipadas con escritorio, TV de pantalla plana, baño privado, ropa de cama, toallas y una terraza con vistas a la ciudad. Las unidades disponen de armario. Puedes jugar al ping-pong en Hotel-Villas JABEL TINAMIT.</p>
                        <a href="#" class="flashcard__link">Ver mas hogares</a>
                    </div>
                </div>

                <div class="flashcard">
                    <img src="${pageContext.request.contextPath}/Images/hogar7.jpg" alt="Hotel">
                    <div class="flashcard__content">
                        <p class="flashcard__title">Mexhe Hotel El Cuyo</p>
                        <p class="flashcard__description">En el hotel, cada habitación incluye armario, ropa de cama y un balcón con vistas a la piscina. Las habitaciones del alojamiento tienen baño privado con ducha y artículos de aseo gratuitos, y algunas habitaciones también ofrecen vistas al mar. En Mexhe Hotel El Cuyo, todas las habitaciones cuentan con aire acondicionado y caja fuerte.</p>
                        <a href="#" class="flashcard__link">Ver mas hogares</a>
                    </div>
                </div>

                <div class="flashcard">
                    <img src="${pageContext.request.contextPath}/Images/hogar8.jpg" alt="Hotel">
                    <div class="flashcard__content">
                        <p class="flashcard__title">Casa Mia El Cuyo Eco Beach Boutique Hotel</p>
                        <p class="flashcard__description">Los descuentos Genius en este alojamiento dependen de las fechas de reserva, las fechas de estancia y otras ofertas disponibles. Casa Mia El Cuyo Eco Beach Boutique Hotel, que cuenta con zona de barbacoa, se encuentra en la región de Yucatán, El Cuyo, a pocos pasos de Playa de El Cuyo y a 2,4 km de Playa Cocal. Este hotel de 3 estrellas tiene wifi gratis, jardín y terraza.</p>
                        <a href="#" class="flashcard__link">Ver mas hogares</a>
                    </div>
                </div>

                <div class="flashcard">
                    <img src="${pageContext.request.contextPath}/Images/hogar9.jpg" alt="Hotel">
                    <div class="flashcard__content">
                        <p class="flashcard__title">Hotel Zaca Corcho</p>
                        <p class="flashcard__description">El establecimiento Hotel Zaca Corcho está situado junto al lago de var el corcho, es de estilo rústico y ofrece amplios jardines y vistas panorámicas a la tv para el fuchi. Hay una piscina al aire libre, bañera de hidromasaje y un jardín botánico. Las habitaciones son elegantes y están equipadas con muebles de hierro forjado, TV por cable, vistas a los jardines y al lago.</p>
                        <a href="#" class="flashcard__link">Ver mas hogares</a>
                    </div>
                </div>
            </section>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>