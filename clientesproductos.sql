drop database if exists clientesproductos;
create database clientesproductos;
use clientesproductos;


create table departamento (
    id_depto int primary key, 
    nombre varchar(50) not null
);

create table tipo_documento (
    id_tdoc int primary key auto_increment,
    sigla varchar(10) not null unique,
    nombreDoc varchar(50) not null
);

create table genero (
    id_genero int primary key auto_increment,
    nombreGen varchar(50) not null unique
);

create table producto (
    id_prod int primary key auto_increment,
    nombre varchar(100) not null,
    categoria varchar(50),
    precio decimal(12, 2) not null,
    stock int default 0
);


create table municipio (
    id_mun int primary key, 
    nombre varchar(50) not null,
    id_depto int,
    constraint fk_depto_mun
        foreign key (id_depto) references departamento(id_depto)
);


create table cliente (
    id_tdoc int,
    id int primary key,
    nombre varchar(50),
    apellido varchar(50),
    correo varchar(50) unique,
    contacto varchar(50),
    id_genero int,
    id_depto int, 
    id_mun int,
    fechaNac datetime,
    constraint fk_tdoc_cliente 
        foreign key (id_tdoc) references tipo_documento(id_tdoc),
    constraint fk_genero_cliente 
        foreign key (id_genero) references genero(id_genero),
    constraint fk_mun_cliente 
        foreign key (id_mun) references municipio(id_mun),
    constraint fk_depto_cliente
        foreign key (id_depto) references departamento(id_depto)
);


create table factura (
    id_factura int primary key auto_increment,
    fecha_factura datetime default current_timestamp,
    id_cliente int,
    metodo_pago varchar(50),
    constraint fk_cliente_factura 
        foreign key (id_cliente) references cliente(id)
);

create table compra (
    id_compra int primary key auto_increment,
    id_factura int,
    id_prod int,
    cantidad int not null,
    precio_unitario decimal(12,2),
    constraint fk_factura_compra 
        foreign key (id_factura) references factura(id_factura),
    constraint fk_producto_compra 
        foreign key (id_prod) references producto(id_prod)
);

insert into tipo_documento (sigla, nombreDoc) values
('cc', 'cédula de ciudadanía'),
('ce', 'cédula de extranjería'),
('ti', 'tarjeta de identidad');

insert into genero (nombreGen) values 
('masculino'), 
('femenino'), 
('no binario'), 
('otro');


insert into departamento (id_depto, nombre) values
(5, 'Antioquia'), (8, 'Atlántico'), (11, 'Bogotá D.C.'), (13, 'Bolívar'), (15, 'Boyacá'),
(17, 'Caldas'), (18, 'Caquetá'), (19, 'Cauca'), (20, 'Cesar'), (23, 'Córdoba'),
(25, 'Cundinamarca'), (27, 'Chocó'), (41, 'Huila'), (44, 'La Guajira'), (47, 'Magdalena'),
(50, 'Meta'), (52, 'Nariño'), (54, 'Norte de Santander'), (63, 'Quindío'), (66, 'Risaralda'),
(68, 'Santander'), (70, 'Sucre'), (73, 'Tolima'), (76, 'Valle del Cauca'), (81, 'Arauca'),
(85, 'Casanare'), (86, 'Putumayo'), (88, 'San Andrés'), (91, 'Amazonas'), (94, 'Guainía'),
(95, 'Guaviare'), (97, 'Vaupés'), (99, 'Vichada');


insert into municipio (id_mun, nombre, id_depto) values
(1, 'Medellín', 5), (2, 'Apartadó', 5), (3, 'Bello', 5), (4, 'Carmen de Viboral', 5), (5, 'Envigado', 5), (6, 'Itagüí', 5), (7, 'Rionegro', 5), (8, 'Sabaneta', 5), (9, 'Segovia', 5), (10, 'Turbo', 5),
(11, 'Barranquilla', 8), (12, 'Baranoa', 8), (13, 'Galapa', 8), (14, 'Malambo', 8), (15, 'Puerto Colombia', 8), (16, 'Soledad', 8), (17, 'Sabanagrande', 8), (18, 'Sabanalarga', 8), (19, 'Tubará', 8), (20, 'Usiacurí', 8),
(21, 'Bogotá D.C.', 11),
(22, 'Cartagena', 13), (23, 'Magangué', 13), (24, 'Mompós', 13), (25, 'Turbaco', 13), (26, 'Arjona', 13), (27, 'El Carmen de Bolívar', 13), (28, 'San Jacinto', 13), (29, 'Santa Catalina', 13), (30, 'Soplaviento', 13), (31, 'Turbaná', 13),
(32, 'Tunja', 15), (33, 'Duitama', 15), (34, 'Sogamoso', 15), (35, 'Paipa', 15), (36, 'Chiquinquirá', 15), (37, 'Guateque', 15), (38, 'Moniquirá', 15), (39, 'Villa de Leyva', 15), (40, 'Samacá', 15), (41, 'Santa Rosa de Viterbo', 15),
(42, 'Manizales', 17), (43, 'Anserma', 17), (44, 'Chinchiná', 17), (45, 'Filadelfia', 17), (46, 'La Dorada', 17), (47, 'Neira', 17), (48, 'Pácora', 17), (49, 'Riosucio', 17), (50, 'Risaralda', 17), (51, 'Salamina', 17),
(52, 'Florencia', 18), (53, 'Albania', 18), (54, 'Belén de los Andaquíes', 18), (55, 'Cartagena del Chairá', 18), (56, 'Curillo', 18), (57, 'El Doncello', 18), (58, 'El Paujil', 18), (59, 'La Montañita', 18), (60, 'Milán', 18), (61, 'Puerto Rico', 18),
(62, 'Popayán', 19), (63, 'Buenos Aires', 19), (64, 'Cajibío', 19), (65, 'Caldono', 19), (66, 'Corinto', 19), (67, 'El Tambo', 19), (68, 'Guapi', 19), (69, 'Miranda', 19), (70, 'Páez', 19), (71, 'Santander de Quilichao', 19),
(72, 'Valledupar', 20), (73, 'Aguachica', 20), (74, 'Agustín Codazzi', 20), (75, 'Astrea', 20), (76, 'Becerril', 20), (77, 'Bosconia', 20), (78, 'Chiriguaná', 20), (79, 'Curumaní', 20), (80, 'El Copey', 20), (81, 'El Paso', 20),
(82, 'Montería', 23), (83, 'Ayapel', 23), (84, 'Cereté', 23), (85, 'Lorica', 23), (86, 'Montelíbano', 23), (87, 'Planeta Rica', 23), (88, 'Pueblo Nuevo', 23), (89, 'Sahagún', 23), (90, 'San Andrés de Sotavento', 23), (91, 'Tierralta', 23),
(92, 'Fusagasugá', 25), (93, 'Girardot', 25), (94, 'Soacha', 25), (95, 'Zipaquirá', 25), (96, 'Facatativá', 25), (97, 'Chía', 25), (98, 'Madrid', 25), (99, 'Funza', 25), (100, 'Cajicá', 25), (101, 'Mosquera', 25),
(102, 'Quibdó', 27), (103, 'Acandí', 27), (104, 'Alto Baudó', 27), (105, 'Bagadó', 27), (106, 'Bahía Solano', 27), (107, 'Bajo Baudó', 27), (108, 'Cértegui', 27), (109, 'Condoto', 27), (110, 'Istmina', 27), (111, 'Nuquí', 27),
(112, 'Neiva', 41), (113, 'Acevedo', 41), (114, 'Agrado', 41), (115, 'Aipe', 41), (116, 'Algeciras', 41), (117, 'Altamira', 41), (118, 'Garzón', 41), (119, 'Isnos', 41), (120, 'La Plata', 41), (121, 'Pitalito', 41),
(122, 'Riohacha', 44), (123, 'Albania', 44), (124, 'Barrancas', 44), (125, 'Dibulla', 44), (126, 'Distracción', 44), (127, 'El Molino', 44), (128, 'Fonseca', 44), (129, 'Hatonuevo', 44), (130, 'Maicao', 44), (131, 'Manaure', 44),
(132, 'Santa Marta', 47), (133, 'Algarrobo', 47), (134, 'Aracataca', 47), (135, 'Ariguaní', 47), (136, 'Cerro de San Antonio', 47), (137, 'Chibolo', 47), (138, 'Ciénaga', 47), (139, 'El Banco', 47), (140, 'El Piñón', 47), (141, 'Fundación', 47),
(142, 'Villavicencio', 50), (143, 'Acacías', 50), (144, 'Barranca de Upía', 50), (145, 'Cabuyaro', 50), (146, 'Castilla la Nueva', 50), (147, 'Cubarral', 50), (148, 'Cumaral', 50), (149, 'El Calvario', 50), (150, 'El Castillo', 50), (151, 'El Dorado', 50),
(152, 'Pasto', 52), (153, 'Albán', 52), (154, 'Aldana', 52), (155, 'Ancuya', 52), (156, 'Arboleda', 52), (157, 'Barbacoas', 52), (158, 'Contadero', 52), (159, 'Chachagüí', 52), (160, 'Ipiales', 52), (161, 'Tumaco', 52),
(162, 'Cúcuta', 54), (163, 'Ábrego', 54), (164, 'Arboledas', 54), (165, 'Bochalema', 54), (166, 'Cachirá', 54), (167, 'Cácota', 54), (168, 'Chitagá', 54), (169, 'Convención', 54), (170, 'Ocaña', 54), (171, 'Pamplona', 54),
(172, 'Armenia', 63), (173, 'Buenavista', 63), (174, 'Calarcá', 63), (175, 'Circasia', 63), (176, 'Córdoba', 63), (177, 'Filandia', 63), (178, 'Génova', 63), (179, 'La Tebaida', 63), (180, 'Montenegro', 63), (181, 'Pijao', 63),
(182, 'Pereira', 66), (183, 'Apía', 66), (184, 'Balboa', 66), (185, 'Dosquebradas', 66), (186, 'Guática', 66), (187, 'La Celia', 66), (188, 'La Virginia', 66), (189, 'Marsella', 66), (190, 'Mistrató', 66), (191, 'Pueblo Rico', 66),
(192, 'Bucaramanga', 68), (193, 'Barrancabermeja', 68), (194, 'Floridablanca', 68), (195, 'Girón', 68), (196, 'Piedecuesta', 68), (197, 'San Gil', 68), (198, 'Socorro', 68), (199, 'Barbosa', 68), (200, 'Cimitarra', 68), (201, 'Vélez', 68),
(202, 'Sincelejo', 70), (203, 'Buenavista', 70), (204, 'Caimito', 70), (205, 'Colosó', 70), (206, 'Corozal', 70), (207, 'Coveñas', 70), (208, 'Chalán', 70), (209, 'El Roble', 70), (210, 'Galeras', 70), (211, 'Guaranda', 70),
(212, 'Ibagué', 73), (213, 'Alpujarra', 73), (214, 'Alvarado', 73), (215, 'Ambalema', 73), (216, 'Anzoátegui', 73), (217, 'Armero', 73), (218, 'Ataco', 73), (219, 'Cajamarca', 73), (220, 'Carmen de Apicalá', 73), (221, 'Espinal', 73),
(222, 'Cali', 76), (223, 'Buenaventura', 76), (224, 'Buga', 76), (225, 'Cartago', 76), (226, 'Jamundí', 76), (227, 'Palmira', 76), (228, 'Tuluá', 76), (229, 'Yumbo', 76), (230, 'El Cerrito', 76), (231, 'Florida', 76),
(232, 'Arauca', 81), (233, 'Arauquita', 81), (234, 'Cravo Norte', 81), (235, 'Fortul', 81), (236, 'Puerto Rondón', 81), (237, 'Saravena', 81), (238, 'Tame', 81),
(239, 'Yopal', 85), (240, 'Aguazul', 85), (241, 'Chámeza', 85), (242, 'Hato Corozal', 85), (243, 'La Salina', 85), (244, 'Maní', 85), (245, 'Monterrey', 85), (246, 'Nunchía', 85), (247, 'Orocué', 85), (248, 'Paz de Ariporo', 85),
(249, 'Mocoa', 86), (250, 'Colón', 86), (251, 'Orito', 86), (252, 'Puerto Asís', 86), (253, 'Puerto Caicedo', 86), (254, 'Puerto Guzmán', 86), (255, 'Puerto Leguízamo', 86), (256, 'Sibundoy', 86), (257, 'San Francisco', 86), (258, 'San Miguel', 86),
(259, 'San Andrés', 88), (260, 'Providencia', 88),
(261, 'Leticia', 91), (262, 'El Encanto', 91), (263, 'La Chorrera', 91), (264, 'La Pedrera', 91), (265, 'La Victoria', 91), (266, 'Puerto Alegría', 91), (267, 'Puerto Arica', 91), (268, 'Puerto Nariño', 91), (269, 'Puerto Santander', 91), (270, 'Tarapacá', 91),
(271, 'Inírida', 94), (272, 'Barrancominas', 94), (273, 'Mapiripana', 94), (274, 'San Felipe', 94), (275, 'Puerto Colombia', 94), (276, 'La Guadalupe', 94), (277, 'Cacahual', 94), (278, 'Pana Pana', 94), (279, 'Morichal', 94),
(280, 'San José del Guaviare', 95), (281, 'Calamar', 95), (282, 'El Retorno', 95), (283, 'Miraflores', 95),
(284, 'Mitú', 97), (285, 'Carurú', 97), (286, 'Pacoa', 97), (287, 'Taraira', 97), (288, 'Papunahua', 97), (289, 'Yavaraté', 97),
(290, 'Puerto Carreño', 99), (291, 'La Primavera', 99), (292, 'Santa Rosalía', 99), (293, 'Cumaribo', 99), (294, 'Fusagasugá', 25), (295, 'Girardot', 25), (296, 'Soacha', 25), (297, 'Zipaquirá', 25), (298, 'Facatativá', 25), (299, 'Chía', 25),
(300, 'Madrid', 25), (301, 'Funza', 25), (302, 'Cajicá', 25), (303, 'Mosquera', 25);


insert into cliente (id_tdoc, id, nombre, apellido, correo, contacto, id_genero, id_depto, id_mun, fechaNac) values

(1, 10101, 'carlos', 'restrepo', 'carlos.restrepo@gmail.com', '3105556677', 1, 5, 1, '1985-05-20'),
(1, 10102, 'carlos', 'restrepo', 'carlos.envigado@gmail.com', '3105556677', 1, 5, 5, '1985-05-20'),
(1, 10201, 'diana', 'arenas', 'diana.arenas@gmail.com', '3201112233', 2, 5, 5, '1992-08-12'),
(1, 10202, 'diana', 'arenas', 'diana.sabaneta@gmail.com', '3201112233', 2, 5, 8, '1992-08-12'),
(1, 10301, 'andres', 'gomez', 'andres.gomez@gmail.com', '3114445566', 1, 5, 3, '1990-01-30'),
(1, 10501, 'mariana', 'pajon', 'mariana.pajon@antioquia.com', '3109998877', 2, 5, 1, '1991-10-10'),
(1, 10502, 'carolina', 'alzate', 'caro.alzate@gmail.com', '3004445522', 2, 5, 1, '1994-02-28'),
(1, 10503, 'lina', 'moreno', 'lina.m@gmail.com', '3117774433', 2, 5, 5, '1988-12-05'),
(1, 10504, 'sandra', 'valencia', 'sandra.v@gmail.com', '3205551122', 2, 5, 1, '1982-07-14'),
(1, 10505, 'paula', 'betancur', 'paula.b@gmail.com', '3158889900', 2, 5, 1, '1996-04-03'),
(1, 10506, 'veronica', 'ossa', 'vero.ossa@gmail.com', '3182223311', 2, 5, 8, '1990-11-22'),
(1, 10507, 'isabel', 'gallego', 'isa.gallego@gmail.com', '3176665544', 2, 5, 1, '1993-01-19'),

(2, 11001, 'elena', 'schmidt', 'elena.schmidt@gmail.com', '3004445566', 2, 11, 21, '1995-12-05'),
(1, 11002, 'mauricio', 'rojas', 'mauro.rojas@gmail.com', '3157778899', 1, 11, 21, '1988-03-14'),
(1, 11003, 'claudia', 'mendez', 'claudia.mendez@gmail.com', '3182223344', 2, 11, 21, '1993-07-22'),

(1, 15001, 'sofia', 'lopez', 'sofia.lopez@gmail.com', '3187778899', 2, 15, 32, '1990-09-10'),
(1, 15002, 'valeria', 'rios', 'valeria.rios@gmail.com', '3123334455', 2, 15, 32, '1993-04-18'),
(1, 15003, 'fernando', 'pardo', 'fer.pardo@gmail.com', '3171234567', 1, 15, 34, '1982-11-25'),
(1, 15004, 'angela', 'castro', 'angela.castro@gmail.com', '3190001122', 2, 15, 32, '1994-06-02'),

(1, 76001, 'lucia', 'vargas', 'lucia.vargas@gmail.com', '3104443322', 2, 76, 222, '1998-10-31'),
(1, 76002, 'ricardo', 'calero', 'ricardo.calero@gmail.com', '3146667788', 1, 76, 222, '1987-02-15'),
(1, 76003, 'beatriz', 'pinzon', 'betty.pinzon@gmail.com', '3001239876', 2, 76, 227, '1991-12-24'),

(1, 08001, 'juan', 'montoya', 'juan.montoya@gmail.com', '3159998877', 1, 8, 11, '1989-04-04'),
(1, 08002, 'pedro', 'herrera', 'pedro.herrera@gmail.com', '3168889900', 1, 8, 16, '1984-09-19'),
(1, 08003, 'marta', 'solano', 'marta.solano@gmail.com', '3125554433', 2, 8, 11, '1992-01-11'),

(1, 68001, 'jorge', 'castro', 'jorge.castro@gmail.com', '3190001122', 1, 68, 192, '1983-07-15'),
(1, 68002, 'silvia', 'duarte', 'silvia.duarte@gmail.com', '3101112222', 2, 68, 192, '1996-05-28'),
(1, 68003, 'jorge', 'castro', 'jorge.florida@gmail.com', '3190001122', 1, 68, 194, '1983-07-15'),

(1, 41001, 'isabella', 'torres', 'isa.torres@gmail.com', '3217776655', 2, 41, 112, '1994-10-03'),
(3, 13001, 'mateo', 'garcia', 'mateo.garcia@gmail.com', '3112223344', 1, 13, 22, '2008-05-14'),
(1, 44001, 'felipe', 'mendoza', 'felipe.mendoza@gmail.com', '3135554433', 1, 44, 122, '1989-11-20'),
(1, 52001, 'gabriela', 'ortiz', 'gabi.ortiz@gmail.com', '3001239876', 2, 52, 152, '1994-03-08'),
(1, 81001, 'santiago', 'peña', 'santi.pena@gmail.com', '3206665544', 1, 81, 232, '1983-09-22'),
(1, 88001, 'paola', 'rojas', 'paola.rojas@gmail.com', '3157778811', 2, 88, 259, '1990-05-30'),
(1, 91001, 'oscar', 'ruiz', 'oscar.ruiz@gmail.com', '3182223344', 1, 91, 261, '1986-10-14'),
(1, 99001, 'valentina', 'cruz', 'vale.cruz@gmail.com', '3114445566', 2, 99, 290, '1997-04-25'),
(1, 23001, 'camila', 'suarez', 'camila.suarez@gmail.com', '3019990011', 2, 23, 82, '1996-02-12'),

(1, 25001, 'andres', 'perez', 'andres.perez@gmail.com', '3102223344', 1, 25, 94, '1990-03-15'),
(1, 25002, 'lorena', 'duque', 'lore.duque@gmail.com', '3114445566', 2, 25, 97, '1994-11-20'),
(1, 25003, 'cristian', 'rojas', 'cris.rojas@gmail.com', '3157778899', 1, 25, 95, '1987-06-05'),
(1, 25004, 'tatiana', 'mejia', 'tati.mejia@gmail.com', '3208889900', 2, 25, 96, '1992-01-30'),

(1, 11004, 'nicolas', 'garzon', 'nico.garzon@gmail.com', '3104445566', 1, 11, 21, '1998-11-12'),
(1, 11005, 'alejandra', 'torres', 'aleja.t@gmail.com', '3125556677', 2, 11, 21, '1990-04-05'),
(1, 11006, 'roberto', 'gomez', 'roberto.g@gmail.com', '3001112233', 1, 11, 21, '1975-08-22'),


(1, 13002, 'paula', 'herrera', 'paula.cartagena@gmail.com', '3158889900', 2, 13, 22, '1993-12-01'),
(1, 13003, 'andres', 'villamizar', 'andres.v@gmail.com', '3117774455', 1, 13, 22, '1987-05-18'),


(1, 41002, 'mario', 'ortiz', 'mario.neiva@gmail.com', '3189990011', 1, 41, 112, '1982-03-30'),
(1, 41003, 'clara', 'luna', 'clara.luna@gmail.com', '3142223344', 2, 41, 112, '1996-07-14'),


(1, 19001, 'esteban', 'rios', 'esteban.popayan@gmail.com', '3218887766', 1, 19, 62, '1991-09-20'),
(1, 19002, 'monica', 'valencia', 'monica.v@gmail.com', '3134445566', 2, 19, 71, '1984-01-10'),


(1, 10701, 'gabriel', 'zapata', 'gabo.z@gmail.com', '3109998877', 1, 5, 2, '1980-02-14'),
(1, 10702, 'liliana', 'suarez', 'lili.s@gmail.com', '3007776655', 2, 5, 7, '1995-11-25'),


(1, 68004, 'fabio', 'duarte', 'fabio.d@gmail.com', '3195554433', 1, 68, 192, '1988-06-08'),
(1, 68005, 'juliana', 'mendez', 'juli.mendez@gmail.com', '3174443322', 2, 68, 192, '1992-10-15'),

(1, 76004, 'oscar', 'munoz', 'oscar.cali@gmail.com', '3126665544', 1, 76, 222, '1979-04-12'),
(1, 76005, 'daniela', 'vargas', 'dani.v@gmail.com', '3103332211', 2, 76, 222, '1997-02-28'),


(1, 25005, 'sergio', 'penagos', 'sergio.p@gmail.com', '3112229988', 1, 25, 94, '1986-07-07'),
(1, 25006, 'adriana', 'rozo', 'adri.rozo@gmail.com', '3145558877', 2, 25, 94, '1991-03-19'),

(2, 20001, 'hans', 'muller', 'hans.extranjero@gmail.com', '3009998877', 1, 11, 21, '1983-11-30'), 
(3, 30001, 'kevin', 'niño', 'kevin.ti@gmail.com', '3201112233', 1, 5, 1, '2009-10-05'), 
(1, 40001, 'patricia', 'lopez', 'paty.lopez@gmail.com', '3187776655', 2, 8, 11, '1968-12-24'); 

insert into producto (id_prod, nombre, categoria, precio, stock) values
(1, 'Laptop Gamer Nitro', 'Tecnología', 3500000.00, 15),
(2, 'Smartphone Galaxy S23', 'Tecnología', 2800000.00, 20),
(3, 'Monitor 27 Pulgadas 4K', 'Tecnología', 1200000.00, 10),
(4, 'Silla Ergonómica Pro', 'Hogar', 850000.00, 12),
(5, 'Teclado Mecánico RGB', 'Tecnología', 250000.00, 30),
(6, 'Mouse Inalámbrico', 'Tecnología', 120000.00, 50),
(7, 'Audífonos Noise Cancelling', 'Tecnología', 600000.00, 15),
(8, 'Escritorio en L Madera', 'Hogar', 450000.00, 8),
(9, 'Impresora Multifuncional', 'Tecnología', 750000.00, 5),
(10, 'Cámara Web 1080p', 'Tecnología', 180000.00, 25);

insert into factura (id_factura, fecha_factura, id_cliente, metodo_pago) values
(1, '2024-01-01 10:00:00', 10101, 'efectivo'), (2, '2024-01-02 11:00:00', 11001, 'tarjeta'),
(3, '2024-01-03 12:00:00', 10201, 'transferencia'), (4, '2024-01-04 13:00:00', 15001, 'efectivo'),
(5, '2024-01-05 14:00:00', 76001, 'tarjeta'), (6, '2024-01-06 15:00:00', 10501, 'transferencia'),
(7, '2024-01-07 16:00:00', 11004, 'efectivo'), (8, '2024-01-08 17:00:00', 10301, 'tarjeta'),
(9, '2024-01-09 18:00:00', 10503, 'transferencia'), (10, '2024-01-10 10:00:00', 10504, 'efectivo'),
(11, '2024-01-11 11:00:00', 10505, 'tarjeta'), (12, '2024-01-12 12:00:00', 10506, 'transferencia'),
(13, '2024-01-13 13:00:00', 10507, 'efectivo'), (14, '2024-01-14 14:00:00', 11002, 'tarjeta'),
(15, '2024-01-15 15:00:00', 11003, 'transferencia'), (16, '2024-01-16 16:00:00', 15002, 'efectivo'),
(17, '2024-01-17 17:00:00', 15003, 'tarjeta'), (18, '2024-01-18 18:00:00', 15004, 'transferencia'),
(19, '2024-01-19 10:00:00', 76002, 'efectivo'), (20, '2024-01-20 11:00:00', 76003, 'tarjeta'),
(21, '2024-01-21 12:00:00', 08001, 'transferencia'), (22, '2024-01-22 13:00:00', 08002, 'efectivo'),
(23, '2024-01-23 14:00:00', 08003, 'tarjeta'), (24, '2024-01-24 15:00:00', 68001, 'transferencia'),
(25, '2024-01-25 16:00:00', 68002, 'efectivo'), (26, '2024-01-26 17:00:00', 68003, 'tarjeta'),
(27, '2024-01-27 18:00:00', 41001, 'transferencia'),
(28, '2024-04-05 09:15:00', 10101, 'tarjeta de crédito'), (29, '2024-04-06 14:20:00', 11001, 'efectivo'),
(30, '2024-04-08 10:30:00', 10201, 'transferencia'), (31, '2024-04-10 16:45:00', 15001, 'tarjeta de débito'),
(32, '2024-04-12 11:00:00', 76001, 'transferencia'), (33, '2024-04-15 14:30:00', 10501, 'tarjeta de crédito'),
(34, '2024-04-18 16:20:00', 11004, 'efectivo'), (35, '2024-04-20 09:10:00', 10301, 'transferencia'),
(36, '2024-04-22 13:40:00', 10503, 'tarjeta de crédito'), (37, '2024-04-25 15:00:00', 10504, 'efectivo'),
(38, '2024-04-28 08:30:00', 10505, 'tarjeta de débito'), (39, '2024-04-30 11:00:00', 10506, 'transferencia'),
(40, '2024-05-02 17:15:00', 10507, 'efectivo'), (41, '2024-05-05 12:00:00', 11002, 'tarjeta de crédito'),
(42, '2024-05-08 14:00:00', 11003, 'transferencia'), (43, '2024-05-10 09:30:00', 15002, 'efectivo'),
(44, '2024-05-12 16:00:00', 15003, 'tarjeta de débito'), (45, '2024-05-15 10:45:00', 15004, 'efectivo'),
(46, '2024-05-18 13:20:00', 76002, 'transferencia'), (47, '2024-05-20 15:50:00', 76003, 'tarjeta de crédito'),
(48, '2024-05-22 08:00:00', 08001, 'efectivo'), (49, '2024-05-25 11:30:00', 08002, 'tarjeta de débito'),
(50, '2024-05-28 14:20:00', 08003, 'transferencia'), (51, '2024-05-30 10:10:00', 68001, 'tarjeta de crédito'),
(52, '2024-06-01 13:40:00', 68002, 'efectivo'), (53, '2024-06-02 15:00:00', 68003, 'transferencia'),
(54, '2024-06-05 12:00:00', 41001, 'tarjeta de crédito'), (55, '2024-06-08 15:30:00', 13001, 'efectivo'),
(56, '2024-06-10 09:00:00', 44001, 'transferencia'), (57, '2024-06-12 14:30:00', 52001, 'tarjeta de crédito'),
(58, '2024-06-15 11:15:00', 81001, 'efectivo'), (59, '2024-06-18 16:45:00', 88001, 'transferencia'),
(60, '2024-06-20 10:20:00', 91001, 'tarjeta de débito'), (61, '2024-06-22 13:00:00', 99001, 'efectivo'),
(62, '2024-06-25 08:30:00', 23001, 'tarjeta de crédito'), (63, '2024-06-28 17:00:00', 25001, 'transferencia'),
(64, '2024-06-30 12:00:00', 25002, 'efectivo'), (65, '2024-07-02 15:30:00', 25003, 'tarjeta de débito'),
(66, '2024-07-05 10:00:00', 25004, 'efectivo'), (67, '2024-07-08 14:30:00', 11005, 'transferencia'),
(68, '2024-07-10 11:20:00', 13002, 'tarjeta de crédito'), (69, '2024-07-12 15:45:00', 13003, 'efectivo'),
(70, '2024-07-15 09:15:00', 41002, 'transferencia'), (71, '2024-07-18 10:30:00', 19001, 'tarjeta de débito'),
(72, '2024-07-20 16:20:00', 19002, 'efectivo'), (73, '2024-07-22 14:00:00', 10701, 'transferencia'),
(74, '2024-07-25 11:10:00', 68004, 'tarjeta de crédito'), (75, '2024-07-28 13:40:00', 68005, 'efectivo'),
(76, '2024-07-30 15:50:00', 76004, 'transferencia'), (77, '2024-08-01 08:00:00', 25005, 'tarjeta de débito'),
(78, '2024-08-02 11:30:00', 25006, 'efectivo'), (79, '2024-08-05 14:20:00', 20001, 'tarjeta de crédito'),
(80, '2024-08-08 10:10:00', 30001, 'efectivo'), (81, '2024-08-10 13:40:00', 40001, 'transferencia'),
(82, '2024-08-12 15:00:00', 10101, 'tarjeta de débito'), (83, '2024-08-15 12:00:00', 11001, 'efectivo'),
(84, '2024-08-18 15:30:00', 10501, 'transferencia'), (85, '2024-08-20 09:00:00', 11004, 'tarjeta de crédito'),
(86, '2024-08-22 14:30:00', 76001, 'efectivo'), (87, '2024-08-25 11:15:00', 10502, 'transferencia'),
(88, '2024-09-01 10:00:00', 10101, 'efectivo'), (89, '2024-09-02 11:30:00', 11001, 'tarjeta de crédito'),
(90, '2024-09-03 15:45:00', 76001, 'transferencia'), (91, '2024-09-04 09:00:00', 10501, 'efectivo'),
(92, '2024-09-05 14:20:00', 68001, 'tarjeta de débito'), (93, '2024-09-06 10:10:00', 41001, 'transferencia'),
(94, '2024-09-07 13:40:00', 13001, 'efectivo'), (95, '2024-09-08 15:00:00', 19001, 'tarjeta de crédito'),
(96, '2024-09-09 12:00:00', 11005, 'transferencia');

insert into compra (id_factura, id_prod, cantidad, precio_unitario) values
(1, 1, 1, 3500000.00), (1, 6, 1, 120000.00), (2, 2, 1, 2800000.00), 
(3, 4, 2, 850000.00), (4, 7, 1, 600000.00), (5, 3, 1, 1200000.00), 
(6, 10, 1, 180000.00), (7, 5, 2, 250000.00), (8, 2, 1, 2800000.00), 
(9, 3, 1, 1200000.00), (10, 5, 1, 250000.00), (11, 7, 1, 600000.00), 
(12, 1, 1, 3500000.00), (13, 10, 2, 180000.00), (14, 4, 1, 850000.00), 
(15, 8, 1, 450000.00), (16, 9, 1, 750000.00), (17, 2, 1, 2800000.00), 
(18, 6, 2, 120000.00), (19, 7, 1, 600000.00), (20, 3, 1, 1200000.00), 
(21, 5, 2, 250000.00), (22, 1, 1, 3500000.00), (23, 10, 1, 180000.00), 
(24, 4, 1, 850000.00), (25, 2, 1, 2800000.00), (26, 9, 1, 750000.00), 
(27, 6, 1, 120000.00), (28, 1, 1, 3500000.00), (29, 2, 1, 2800000.00), 
(30, 3, 1, 1200000.00), (31, 4, 1, 850000.00), (32, 5, 1, 250000.00), 
(33, 6, 1, 120000.00), (34, 7, 1, 600000.00), (35, 8, 1, 450000.00), 
(36, 9, 1, 750000.00), (37, 10, 1, 180000.00), (38, 1, 1, 3500000.00), 
(39, 2, 1, 2800000.00), (40, 3, 1, 1200000.00), (41, 4, 1, 850000.00), 
(42, 5, 1, 250000.00), (43, 6, 1, 120000.00), (44, 7, 1, 600000.00), 
(45, 8, 1, 450000.00), (46, 9, 1, 750000.00), (47, 10, 1, 180000.00), 
(48, 1, 1, 3500000.00), (49, 2, 1, 2800000.00), (50, 3, 1, 1200000.00), 
(51, 4, 1, 850000.00), (52, 5, 1, 250000.00), (53, 6, 1, 120000.00), 
(54, 7, 1, 600000.00), (55, 8, 1, 450000.00), (56, 9, 1, 750000.00), 
(57, 10, 1, 180000.00), (58, 1, 1, 3500000.00), (59, 2, 1, 2800000.00), 
(60, 3, 1, 1200000.00), (61, 4, 1, 850000.00), (62, 5, 1, 250000.00), 
(63, 6, 1, 120000.00), (64, 7, 1, 600000.00), (65, 8, 1, 450000.00), 
(66, 9, 1, 750000.00), (67, 10, 1, 180000.00), (68, 1, 1, 3500000.00), 
(69, 2, 1, 2800000.00), (70, 3, 1, 1200000.00), (71, 4, 1, 850000.00), 
(72, 5, 1, 250000.00), (73, 6, 1, 120000.00), (74, 7, 1, 600000.00), 
(75, 8, 1, 450000.00), (76, 9, 1, 750000.00), (77, 10, 1, 180000.00), 
(78, 1, 1, 3500000.00), (79, 2, 1, 2800000.00), (80, 3, 1, 1200000.00), 
(81, 4, 1, 850000.00), (82, 5, 1, 250000.00), (83, 6, 1, 120000.00), 
(84, 7, 1, 600000.00), (85, 8, 1, 450000.00), (86, 9, 1, 750000.00), 
(87, 10, 1, 180000.00), (88, 5, 2, 250000.00), (89, 1, 1, 3500000.00), 
(90, 7, 1, 600000.00), (91, 2, 1, 2800000.00), (92, 3, 1, 1200000.00), 
(93, 10, 3, 180000.00), (94, 6, 1, 120000.00), (95, 4, 1, 850000.00), 
(96, 8, 1, 450000.00);
