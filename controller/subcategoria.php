<?php
    require_once("../config/conexion.php");
    require_once("../models/Subcategoria.php");
    $subcategoria = new Subcategoria();

    switch($_GET["op"]){
        case "combo":
            $datos = $subcategoria->get_subcategoria($_POST["cat_id"]);
            $html="<option label='Seleccionar'></option>";
            if(is_array($datos)==true and count($datos)>0){
                foreach($datos as $row)
                {
                    $html.= "<option value='".$row['subcat_id']."'>".$row['subcat_nom']."</option>";
                }
                echo $html;
            }
        break;
    }
?>