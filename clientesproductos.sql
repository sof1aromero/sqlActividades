drop database if exists clientesproductos;
create database clientesproductos;
use clientesproductos;


create table departamento (
    id_depto int primary key, 
    nombre varchar(50) not null
);

create table municipio (
    id_mun int primary key, 
    nombre varchar(50) not null,
    id_depto int,
    constraint fk_depto_mun
        foreign key (id_depto) references departamento(id_depto)
);

create table cliente (
    tipodoc varchar(50),
    id bigint primary key,
    nombre varchar(50),
    apellido varchar(50),
    correo varchar(50) unique,
    contacto varchar(50),
    genero varchar(50),
    id_depto int, 
    id_mun int,
    fecha datetime,
    constraint fk_mun_cliente
        foreign key (id_mun) references municipio(id_mun)
);


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
(290, 'Puerto Carreño', 99), (291, 'La Primavera', 99), (292, 'Santa Rosalía', 99), (293, 'Cumaribo', 99);


insert into cliente (tipodoc, id, nombre, apellido, correo, contacto, genero, id_depto, id_mun, fecha) values
('CC', 1010203040, 'Carlos', 'Restrepo', 'carlos.res@mail.com', '3105556677', 'Masculino', 5, 1, '1985-03-15'),
('CC', 1020304050, 'Diana', 'Arenas', 'diana.a@mail.com', '3201112233', 'Femenino', 5, 5, '1992-07-22'),
('CC', 1030405060, 'Juan', 'Montoya', 'juan.mon@mail.com', '3159998877', 'Masculino', 8, 11, '1988-11-02'),
('CE', 2030405060, 'Elena', 'Schmidt', 'elena.s@mail.com', '3004445566', 'Femenino', 11, 21, '1995-01-30'),
('TI', 1050607080, 'Mateo', 'García', 'mateo.g@mail.com', '3112223344', 'Masculino', 13, 22, '2008-05-14'),
('CC', 1060708090, 'Sofía', 'López', 'sofia.l@mail.com', '3187778899', 'Femenino', 15, 32, '1990-09-10'),
('CC', 1070809001, 'Andrés', 'Pardo', 'andres.p@mail.com', '3171234567', 'Masculino', 15, 34, '1982-12-25'),
('CC', 1080901020, 'Valeria', 'Ríos', 'valeria.r@mail.com', '3123334455', 'Femenino', 17, 42, '1993-04-18'),
('CC', 1090102030, 'Ricardo', 'Díaz', 'ricardo.d@mail.com', '3146667788', 'Masculino', 19, 62, '1987-08-05'),
('CC', 1100102030, 'Camila', 'Suárez', 'camila.s@mail.com', '3019990011', 'Femenino', 23, 82, '1996-02-12'),
('CC', 1110203040, 'Luis', 'Henao', 'luis.h@mail.com', '3168889900', 'Masculino', 25, 94, '1980-06-28'),
('CC', 1120304050, 'Isabella', 'Torres', 'isa.t@mail.com', '3217776655', 'Femenino', 41, 112, '1991-10-03'),
('CC', 1130405060, 'Felipe', 'Mendoza', 'felipe.m@mail.com', '3135554433', 'Masculino', 44, 122, '1989-11-20'),
('CC', 1140506070, 'Gabriela', 'Ortiz', 'gabi.o@mail.com', '3001239876', 'Femenino', 52, 152, '1994-03-08'),
('CC', 1150607080, 'Jorge', 'Castro', 'jorge.c@mail.com', '3190001122', 'Masculino', 68, 192, '1984-07-15'),
('CC', 1160708090, 'Lucía', 'Vargas', 'lucia.v@mail.com', '3104443322', 'Femenino', 76, 222, '1998-12-01'),
('CC', 1170809000, 'Santiago', 'Peña', 'santi.p@mail.com', '3206665544', 'Masculino', 81, 232, '1983-09-22'),
('CC', 1180901010, 'Paola', 'Rojas', 'paola.r@mail.com', '3157778811', 'Femenino', 88, 259, '1990-05-30'),
('CC', 1190102020, 'Óscar', 'Ruiz', 'oscar.r@mail.com', '3182223344', 'Masculino', 91, 261, '1986-10-14'),
('CC', 1200203040, 'Valentina', 'Cruz', 'vale.c@mail.com', '3114445566', 'Femenino', 99, 290, '1997-04-25');