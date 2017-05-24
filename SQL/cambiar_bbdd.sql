-- Script de cambio de BBDD para adaptación a CakePHP

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: `tcomdes`
--

--
-- Cambio de la estructura de tabla para la tabla `bases`
--
ALTER TABLE `bases` CHANGE `ID` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `TERMINAL` `terminal_id` INT( 11 ) NOT NULL ,
CHANGE `FLOTA` `flota_id` INT( 11 ) NOT NULL ,
CHANGE `MUNICIPIO` `municipio_id` CHAR( 5 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ;

--
-- Cambio de la estructura de tabla para la tabla `contactos`
--
ALTER TABLE `contactos` CHANGE `ID` `id` INT(11) NOT NULL AUTO_INCREMENT,
CHANGE `NOMBRE` `nombre` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `NIF` `nif` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `CARGO` `cargo` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `TELEFONO` `telefono` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `TLFGVA` `tlfgva` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `MOVIL` `movil` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `MOVILGVA` `movilgva` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `FAX` `fax` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `MAIL` `mail` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `HORARIO` `horario` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL;

--
-- Cambio de la estructura de tabla para la tabla `contactos_flotas`
--
ALTER TABLE `contactos_flotas` CHANGE `ID` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `CONTACTO_ID` `contacto_id` INT( 11 ) NOT NULL ,
CHANGE `FLOTA_ID` `flota_id` INT( 11 ) NOT NULL ,
CHANGE `ROL` `rol` ENUM( 'RESPONSABLE', 'TECNICO', 'OPERATIVO', 'CONT24H' ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `ORDEN` `orden` INT( 11 ) NOT NULL DEFAULT '0';

--
-- Cambio de la estructura de tabla para la tabla `flotas`
--
ALTER TABLE `flotas` CHANGE `ID` `id` INT(11) NOT NULL AUTO_INCREMENT,
CHANGE `FLOTA` `flota` VARCHAR(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `ACRONIMO` `acronimo` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `ORGANIZACION` `organizacion_id` INT(11) NOT NULL,
CHANGE `INE` `municipio_id` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `DOMICILIO` `domicilio` VARCHAR(80) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `CP` `cp` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `FORMCONT` `formcont` ENUM('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'NO',
CHANGE `UPDCONT` `updcont` DATE NOT NULL, CHANGE `LOGIN` `login` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `PASSWORD` `password` VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `MAIL` `mail` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `ACTIVO` `activo` SET('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `ENCRIPTACION` `encriptacion` SET('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'NO',
CHANGE `RANGO` `rango` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL;

--
-- Cambio de la estructura de tabla para la tabla `grupos`
--
ALTER TABLE `grupos` CHANGE `GISSI` `gissi` INT( 11 ) NOT NULL ,
CHANGE `MNEMONICO` `mnemonico` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `TIPO` `tipo` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `DESCRIPCION` `descripcion` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ;

--
-- Cambio de la estructura de tabla para la tabla `grupos_flotas`
--
ALTER TABLE `grupos_flotas` CHANGE `ID` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `FLOTA` `flota_id` INT( 11 ) NOT NULL ,
CHANGE `GISSI` `gissi` INT( 11 ) NOT NULL ,
CHANGE `CARPETA` `carpeta` INT( 11 ) NOT NULL ,
CHANGE `NOMBRE` `nombre_id` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ;

--
-- Cambio de la estructura de tabla para la tabla `mensajes`
--
ALTER TABLE `mensajes` CHANGE `ID` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `FCREACION` `fcreacion` DATETIME NOT NULL ,
CHANGE `FMODIFICA` `fmodifica` DATETIME NOT NULL ,
CHANGE `TIPO` `tipo` ENUM( 'M', 'N' ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'M',
CHANGE `ASUNTO` `asunto` TINYTEXT CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `MENSAJE` `mensaje` LONGTEXT CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ;

--
-- Cambio de la estructura de tabla para la tabla `mensajes`
--
ALTER TABLE `municipios` CHANGE `INE` `id` VARCHAR( 5 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `PROVINCIA` `provincia` VARCHAR( 30 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `MUNICIPIO` `municipio` VARCHAR( 60 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ;

--
-- Cambio de la estructura de tabla para la tabla `organizaciones`
--
ALTER TABLE `organizaciones` CHANGE `ID` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `ORGANIZACION` `organizacion` VARCHAR( 40 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `FLOTA_ID` `flota_id` INT( 11 ) NOT NULL ,
CHANGE `ACRONIMO` `acronimo` VARCHAR( 15 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `INE` `ine` VARCHAR( 5 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `DOMICILIO` `domicilio` VARCHAR( 80 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `CP` `cp` VARCHAR( 5 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `RESPONSABLE` `responsable` INT( 11 ) NOT NULL ;

--
-- Cambio de la estructura de tabla para la tabla `permisos_flotas`
--
ALTER TABLE `permisos_flotas` CHANGE `ID` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE `FLOTA` `flota_id` INT( 11 ) NOT NULL ,
CHANGE `GISSI` `gissi` INT( 11 ) NOT NULL ,
CHANGE `CARPTERM` `carpterm` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ,
CHANGE `NOMBRE` `nombre` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL ;

--
-- Cambio de la estructura de tabla para la tabla `terminales`
--
ALTER TABLE `terminales` CHANGE `ID` `id` INT(11) NOT NULL AUTO_INCREMENT,
CHANGE `MARCA` `marca` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `MODELO` `modelo` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `TIPO` `tipo` SET('F','M','MB','MA','MG','P','PB','PA','PX','D') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `PROVEEDOR` `proveedor` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `CODIGOHW` `codigohw` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `AM` `am` ENUM('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `AUTENTICADO` `autenticado` ENUM('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'NO',
CHANGE `ENCRIPTADO` `encriptado` ENUM('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'NO',
CHANGE `ISSI` `issi` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `VERSION` `version` VARCHAR(5) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0.0',
CHANGE `TEI` `tei` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `NSERIE` `nserie` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `MNEMONICO` `mnemonico` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `CARPETA` `carpeta` VARCHAR(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `DUPLEX` `duplex` ENUM('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'NO',
CHANGE `SEMID` `semid` ENUM('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `OBSERVACIONES` `observaciones` LONGTEXT CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `FALTA` `falta` DATE NOT NULL,
CHANGE `DOTS` `dots` SET('SI','NO') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'NO',
CHANGE `NUMEROK` `numerok` VARCHAR(40) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `DIRIP` `dirip` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `FLOTA` `flota_id` INT(11) NOT NULL,
CHANGE `ESTADO` `estado` ENUM('A','B','R') CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
CHANGE `FBAJA` `fbaja` DATE NOT NULL;

--
-- Cambios de nombres de tabla:
--
RENAME TABLE `organizaciones` TO `organizacions`;
RENAME TABLE `permisos_flotas` TO `permisos`;
RENAME TABLE `terminales` TO `terminals`;
