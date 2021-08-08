-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema base_datos_notas_texto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema base_datos_notas_texto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `base_datos_notas_texto` DEFAULT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI ;
USE `base_datos_notas_texto` ;

-- -----------------------------------------------------
-- Table `base_datos_notas_texto`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_datos_notas_texto`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `base_datos_notas_texto`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_datos_notas_texto`.`notas` (
  `idnotas` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  `fecha_de_creacion` DATETIME NOT NULL,
  `fecha_de_modificacion` DATETIME NOT NULL,
  `estatus` VARCHAR(45) NOT NULL,
  `eliminacion_nota` TINYINT NOT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`idnotas`),
  INDEX `fk_notas_usuarios_idx` (`usuarios_id` ASC),
  CONSTRAINT `fk_notas_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `base_datos_notas_texto`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `base_datos_notas_texto`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_datos_notas_texto`.`categorias` (
  `idcategorias` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorias`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `base_datos_notas_texto`.`notas_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `base_datos_notas_texto`.`notas_categoria` (
  `categorias_id` INT NOT NULL,
  `notas_id` INT NOT NULL,
  INDEX `fk_notas_categoria_notas1_idx` (`notas_id` ASC),
  CONSTRAINT `fk_notas_categoria_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `base_datos_notas_texto`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_categoria_notas1`
    FOREIGN KEY (`notas_id`)
    REFERENCES `base_datos_notas_texto`.`notas` (`idnotas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = INNODB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Insercion en tabla de usuarios
-- -----------------------------------------------------


INSERT INTO usuarios VALUES (DEFAULT,'Mariana', 'Rubio', 'mariana.rubio@gmail.com');
INSERT INTO usuarios VALUES (DEFAULT,'Kermie', 'Tollit', 'ktollit0@amazonaws.com');
INSERT INTO usuarios VALUES (DEFAULT,'Stacee', 'Panons', 'spanons1@w3.org');
INSERT INTO usuarios VALUES (DEFAULT,'Gun', 'Lawlan', 'glawlan2@moonfruit.com');
INSERT INTO usuarios VALUES (DEFAULT,'Barbette', 'Whitebrook', 'bwhitebrook3@ask.com');
INSERT INTO usuarios VALUES (DEFAULT, 'Rae', 'Lemmer', 'rlemmer4@squarespace.com');
INSERT INTO usuarios VALUES (DEFAULT,'Bartholomeus', 'Innocent', 'binnocent5@cdc.gov');
INSERT INTO usuarios VALUES (DEFAULT,'Dominique', 'Artois', 'dartois6@biglobe.ne.jp');
INSERT INTO usuarios VALUES (DEFAULT,'Michel', 'Pendrill', 'mpendrill7@taobao.com');
INSERT INTO usuarios VALUES (DEFAULT,'Silvanus', 'Cuningham', 'scuningham8@sphinn.com');

-- -----------------------------------------------------
-- Inserción en tabla de categorias
-- -----------------------------------------------------

INSERT INTO categorias VALUES (DEFAULT, 'Proyectos');
INSERT INTO categorias VALUES (DEFAULT, 'Escuela');
INSERT INTO categorias VALUES (DEFAULT, 'Personal');
INSERT INTO categorias VALUES (DEFAULT, 'Viaje');
INSERT INTO categorias VALUES (DEFAULT, 'Trabajo');
INSERT INTO categorias VALUES (DEFAULT, 'Salud');
INSERT INTO categorias VALUES (DEFAULT, 'Tareas');
INSERT INTO categorias VALUES (DEFAULT, 'Ejercicio');
INSERT INTO categorias VALUES (DEFAULT, 'Recetas');
INSERT INTO categorias VALUES (DEFAULT, 'Entretenimiento');


-- -----------------------------------------------------
-- Inserción en tabla de notas
-- -----------------------------------------------------

INSERT INTO notas VALUES (DEFAULT,'Lista super', '1.Comprar salsa,2.Comprar spaguetti,3.Comprar queso',NOW(),NOW(),'creada',FALSE,(SELECT idusuarios FROM usuarios WHERE idusuarios=1));
INSERT INTO notas VALUES (DEFAULT,'Pendientes trabajo','Llamar a Stefania a su celular a las 10',NOW(),NOW(),'creada',TRUE,(SELECT idusuarios FROM usuarios WHERE idusuarios=10));
INSERT INTO notas VALUES (DEFAULT,'Paises a visitar','México,Colombia y Chile',NOW(),NOW(),'creada',FALSE,(SELECT idusuarios FROM usuarios WHERE idusuarios=5));
INSERT INTO notas VALUES (DEFAULT,'Pendientes de Escuela','Hacer tarea de programación ',NOW(),NOW(),'creada',FALSE,(SELECT idusuarios FROM usuarios WHERE idusuarios=7));
INSERT INTO notas VALUES (DEFAULT,'Visita al nutriólogo','Llamar al nutriólogo para hacer cita',NOW(),NOW(),'creada',TRUE,(SELECT idusuarios FROM usuarios WHERE idusuarios=8));
INSERT INTO notas VALUES (DEFAULT,'Ejercicio pierna','Zancadas, Salto de cuerda',NOW(),NOW(),'creada',TRUE,(SELECT idusuarios FROM usuarios WHERE idusuarios=6));
INSERT INTO notas VALUES (DEFAULT,'Recetas para preparar frijoles','1.Lavar frijoles,2.Cocer frijoles por 2 horas,3.Ponerle un puño de sal',NOW(),NOW(),'creada',FALSE,(SELECT idusuarios FROM usuarios WHERE idusuarios=4));
INSERT INTO notas VALUES (DEFAULT,'Peliculas Marvel','Iron Man, Spider Man, Avengers',NOW(),NOW(),'creada',TRUE,(SELECT idusuarios FROM usuarios WHERE idusuarios=2));
INSERT INTO notas VALUES (DEFAULT,'Canciones de Spotify','I will survive, Tie a Yellow Ribbon,Yellow submarine',NOW(),NOW(),'creada',FALSE,(SELECT idusuarios FROM usuarios WHERE idusuarios=2));
INSERT INTO notas VALUES (DEFAULT,'Reunión semanal con practicantes','Agendar reunión semanal con practicantes en el calendario de google',NOW(),NOW(),'creada',TRUE,(SELECT idusuarios FROM usuarios WHERE idusuarios=9));

-- -----------------------------------------------------
-- Inserción en tabla de categorias notas 
-- -----------------------------------------------------

INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Proyectos%'), (SELECT notas.idnotas FROM notas WHERE titulo LIKE 'Lista%') );
INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Trabajo%'), (SELECT notas.idnotas FROM notas WHERE titulo LIKE '%trabajo%') );
INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Viaje%'), (SELECT notas.idnotas FROM notas WHERE titulo LIKE '%visitar%') );
INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Escuela%'), (SELECT notas.idnotas FROM notas WHERE titulo LIKE '%escuela%') );
INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Salud%'), (SELECT notas.idnotas FROM notas WHERE titulo LIKE '%nutriologo%') );
INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Ejercicio%'), (SELECT notas.idnotas FROM notas WHERE titulo= 'Ejercicio pierna') );
INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Recetas%'), (SELECT notas.idnotas FROM notas WHERE titulo LIKE '%Receta%') );
INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Entretenimiento%'), (SELECT notas.idnotas FROM notas WHERE titulo LIKE '%Canciones%') );
INSERT INTO notas_categoria VALUES((SELECT categorias.idcategorias FROM categorias WHERE nombre LIKE '%Trabajo%'), (SELECT notas.idnotas FROM notas WHERE titulo LIKE '%semanal%') );


-- -----------------------------------------------------
-- SELECT de cada una de las notas 
-- -----------------------------------------------------
SELECT * FROM notas;
SELECT * FROM notas_categoria;
SELECT * FROM categorias;
SELECT * FROM usuarios;