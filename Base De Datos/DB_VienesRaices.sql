Drop Database if exists DB_VienesRaices; 
Create Database DB_VienesRaices;
Use DB_VienesRaices;

create table Proveedores(
	codigoProveedor int auto_increment,
    nombreProveedor varchar(100),
    telefonoProveedor varchar(20),
    correoProveedor varchar(200),
    paisProveedor varchar(150),
    primary key PK_codigoProveedor (codigoProveedor)
);

create table Hogares(
	codigoHogar int auto_increment,
    tipoHogar varchar(150),
	ubicacion varchar(150),
    precio double(10,2),
    codigoProveedor int,
    primary key PK_codigoHogar (codigoHogar),
    constraint FK_codigoProveedor foreign key (codigoProveedor)
		references Proveedores (codigoProveedor)
);

-- --------------------------- Entidad Proveedor --------------------------- 
-- Agregar Proveedor
Delimiter //
	Create procedure sp_AgregarProveedor(
    in nombreProveedor varchar(100), 
    in telefonoProveedor varchar(20), 
    in correoProveedor varchar(200), 
    in paisProveedor varchar(150))
		Begin
			Insert into Proveedores(nombreProveedor, telefonoProveedor, correoProveedor, paisProveedor)
				Values(nombreProveedor, telefonoProveedor, correoProveedor, paisProveedor);
        End //
Delimiter ;
call sp_AgregarProveedor('Textiles Centro', '+502 2456-7890', 'textiles.centro@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Distribuidora El Faro', '+502 3345-1234', 'elfaro.proveedores@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Moda Global', '+502 5566-7788', 'modaglobal@gmail.com', 'México');
call sp_AgregarProveedor('Colores y Telas', '+502 4789-0012', 'coloresytelas@gmail.com', 'El Salvador');
call sp_AgregarProveedor('Fashion Import', '+502 5123-4567', 'fashionimport@gmail.com', 'Estados Unidos');
call sp_AgregarProveedor('Ropa Latina', '+502 6034-5678', 'ropalatina@gmail.com', 'Honduras');
call sp_AgregarProveedor('Tejidos Maya', '+502 7234-1122', 'tejidosmaya@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Estilo Urbano', '+502 3109-8765', 'estilourbano@gmail.com', 'Costa Rica');
call sp_AgregarProveedor('Boutique Express', '+502 4490-2233', 'boutique.express@gmail.com', 'Guatemala');
call sp_AgregarProveedor('Importadora del Sur', '+502 5678-3344', 'import.sur@gmail.com', 'Panamá');


-- Listar Proveedor
Delimiter //
	Create procedure sp_ListarProveedor()
		Begin
			Select codigoProveedor, nombreProveedor, telefonoProveedor, correoProveedor, paisProveedor from Proveedores;
        End //
Delimiter ;
call sp_ListarProveedor();

-- Eliminar Proveedor
Delimiter //
	Create procedure sp_EliminarProveedor(
    in _codigoProveedor int)
		Begin
			set foreign_key_checks = 0;
				Delete from Proveedores
					where codigoProveedor = _codigoProveedor;
				Select row_count() as filasEliminadas;
			set foreign_key_checks = 1;
        End//
Delimiter ;
-- call sp_EliminarProveedor();

-- Buscar Proveedor
Delimiter //
	Create procedure sp_BuscarProveedor(
    in _codigoProveedor int)
		Begin
			Select codigoProveedor, nombreProveedor, telefonoProveedor, correoProveedor, paisProveedor from Proveedores
				where codigoProveedor = _codigoProveedor;
        End //
Delimiter ;
call sp_BuscarProveedor(1);

-- Editar Proveedor
Delimiter //
	Create procedure sp_EditarProveedor(
    in _codigoProveedor int,
    in _nombreProveedor varchar(100), 
    in _telefonoProveedor varchar(20), 
    in _correoProveedor varchar(200), 
    in _paisProveedor varchar(150))
		Begin
			Update Proveedores
				set nombreProveedor = _nombreProveedor,
					telefonoProveedor = _telefonoProveedor,
                    correoProveedor = _correoProveedor,
                    paisProveedor = _paisProveedor
					where codigoProveedor = _codigoProveedor;
        End //
Delimiter ;
call sp_EditarProveedor(1, 'Tendencias del Sur', '+502 4567-8899', 'tendenciassur@gmail.com', 'Costa Rica');
call sp_EditarProveedor(2, 'La Moda Express', '+502 2122-4455', 'lamodaexpress@gmail.com', 'Honduras');
call sp_EditarProveedor(3, 'Distribuciones Continental', '+502 3678-5566', 'dist.continental@gmail.com', 'Colombia');
call sp_EditarProveedor(4, 'FashionMix Proveedores', '+502 4533-6788', 'proveedor.fashionmix@gmail.com', 'Guatemala');
call sp_EditarProveedor(5, 'Estilo Joven Plus', '+502 2346-7899', 'estilojovenplus@gmail.com', 'México');

-- --------------------------- Entidad Hogar --------------------------- 
-- Agregar Hogar
Delimiter //
	Create procedure sp_AgregarHogar(
		in tipoHogar varchar(150),
		in ubicacion varchar(150),
		in precio double(10,2),
		in codigoProveedor int)
		Begin
			Insert into Hogares(tipoHogar,ubicacion,precio,codigoProveedor)
				Values(tipoHogar,ubicacion,precio,codigoProveedor);
        End //
Delimiter ;
call sp_AgregarHogar('Apartamento', 'Zona #2', '500000.00', 10);
call sp_AgregarHogar('Casa', 'El gallito', '500000.00', 9);
call sp_AgregarHogar('Apartamento', 'Lo de Fuentes', '500000.00', 8);
call sp_AgregarHogar('Casa', 'Peten', '500000.00', 7);
call sp_AgregarHogar('Apartamento', 'Zacapa', '500000.00', 6);
call sp_AgregarHogar('Casa', 'Jutiapa', '500000.00', 5);
call sp_AgregarHogar('Apartamento', 'Santa Rosa de Lima', '500000.00', 4);
call sp_AgregarHogar('Casa', 'zona #11', '500000.00', 3);
call sp_AgregarHogar('Apartamento', 'Zona #1', '500000.00',2);
call sp_AgregarHogar('Casa', 'Zona #9', '500000.00', 1);


-- Listar Hogar
Delimiter //
	Create procedure sp_ListarHogar()
		Begin
			Select codigoHogar,tipoHogar,ubicacion,precio,codigoProveedor from Hogares;
        End //
Delimiter ;
call sp_ListarHogar();

-- Eliminar Hogar
Delimiter //
	Create procedure sp_EliminarHogar(
    in _codigoHogar int)
		Begin
			set foreign_key_checks = 0;
				Delete from Hogares
					where codigoHogar = _codigoHogar;
				Select row_count() as filasEliminadas;
			set foreign_key_checks = 1;
        End//
Delimiter ;
-- call sp_EliminarHogar();

-- Buscar Hogar
Delimiter //
	Create procedure sp_BuscarHogar(
    in _codigoHogar int)
		Begin
			Select codigoHogar,tipoHogar,ubicacion,precio,codigoProveedor from Hogares
				where codigoHogar= _codigoHogar;
        End //
Delimiter ;
call sp_BuscarHogar(1);

-- Editar Hogar
Delimiter //
	Create procedure sp_EditarHogar(
    in _codigoHogar int,
    in _tipoHogar varchar(150),
	in _ubicacion varchar(150),
	in _precio double(10,2),
	in _codigoProveedor int)
		Begin
			Update Hogares
				set tipoHogar = _tipoHogar,
					ubicacion = _ubicacion,
                    precio = _precio,
                    codigoProveedor = _codigoProveedor
					where codigoHogar = _codigoHogar;
        End //
Delimiter ;
call sp_EditarHogar(1, 'Casa', 'zona #8', '600000.00', 10);
call sp_EditarHogar(2, 'Apartamento', 'zona #7', '600000.00', 9);
call sp_EditarHogar(3, 'Casa', 'zona #6', '600000.00', 8);
call sp_EditarHogar(4, 'Apartamento', 'Zona #5', '600000.00', 7);
call sp_EditarHogar(5, 'Casa', 'Zona #4', '600000.00', 6 );

