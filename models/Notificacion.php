<?php
    class Notificacion extends Conectar{

        /* TODO:Todos los registros */
        public function get_notificacion_x_usu($usu_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM tm_notificacion WHERE usu_id= ? AND est=2 Limit 1;";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $usu_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        /* TODO: Obtener registro segun el usuario */
        public function get_notificacion_x_usu2($usu_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM tm_notificacion WHERE usu_id= ? AND est=1";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $usu_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        /* TODO: Actualizar estado de la notificacion luego de ser mostrado */
        public function update_estado_no_leido($not_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="UPDATE tm_notificacion SET est=1 WHERE not_id = ?;";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $not_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        /* TODO: Actualizar notificacion luego de ser leido */
        public function update__estado_leido($not_id){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="UPDATE tm_notificacion SET est=0 WHERE not_id = ?;";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $not_id);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }

        public function ticket_asignado($usu_asig, $tick_id){
            /* TODO: Guardar Notificacion en la tabla */
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO tm_notificacion (not_id,usu_id,not_mensaje,tick_id,est) VALUES (null,?,'Se le ha asignado el ticket Nro : ',?,2)";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $usu_asig);
            $sql->bindValue(2, $tick_id);
            $sql->execute();
        }

        public function comentario_soporte($usu_crea, $tick_id){
            /* TODO: Guardar Notificacion en la tabla */
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO tm_notificacion (not_id,usu_id,not_mensaje,tick_id,est)
                    VALUES (null,?,'Tiene una nueva respuesta de soporte del ticket Nro : ',?,2)";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $usu_crea);
            $sql->bindValue(2, $tick_id);
            $sql->execute();
        }

        public function comentario_usuario($usu_asig, $tick_id){
            /* TODO: Guardar Notificacion en la tabla */
            $conectar= parent::conexion();
            parent::set_names();
            $sql="INSERT INTO tm_notificacion (not_id,usu_id,not_mensaje,tick_id,est) 
                    VALUES (null,?,'Tiene una nueva respuesta del usuario con nro de ticket : ',?,2)";
            $sql=$conectar->prepare($sql);
            $sql->bindValue(1, $usu_asig);
            $sql->bindValue(2, $tick_id);
            $sql->execute();
        }

    }
?>