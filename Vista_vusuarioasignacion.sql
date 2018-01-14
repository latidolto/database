CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vusuarioasignacion` AS
    SELECT 
        CAST(HEX(RANDOM_BYTES(32)) AS CHAR CHARSET UTF8) AS `id_random`,
        `usu`.`clave` AS `clave`,
        CONCAT(CONCAT(CONCAT(CONCAT(`usu`.`nombre`, ' '),
                                `usu`.`apellidoPaterno`),
                        ' '),
                `usu`.`apellidoMaterno`) AS `nombre_completo`,
        `rol`.`idRol` AS `idRol`,
        `rol`.`nombre` AS `rol_nombre`,
        `sis`.`idSistema` AS `idSistema`,
        `sis`.`nombre` AS `sis_nombre`,
        `tar`.`idTarea` AS `idTarea`,
        `tar`.`nombre` AS `tar_nombre`,
        `men`.`idMenu` AS `idMenu`,
        `men`.`etiqueta` AS `men_nombre`
    FROM
        ((((((`usuario` `usu`
        LEFT JOIN `usurol` `ur` ON ((`ur`.`idUsuario` = `usu`.`idUsuario`)))
        LEFT JOIN `rol` ON ((`rol`.`idRol` = `ur`.`idRol`)))
        LEFT JOIN `sistema` `sis` ON ((`sis`.`idSistema` = `rol`.`idSistema`)))
        LEFT JOIN `roltarea` `rt` ON (((`rt`.`idRol` = `rol`.`idRol`)
            AND (`rt`.`idSistema` = `rol`.`idSistema`))))
        LEFT JOIN `tarea` `tar` ON (((`tar`.`idTarea` = `rt`.`idTarea`)
            AND (`tar`.`idSistema` = `rol`.`idSistema`))))
        LEFT JOIN `menu` `men` ON (((`men`.`idMenu` = `rt`.`idMenu`)
            AND (`men`.`idSistema` = `rol`.`idSistema`))))