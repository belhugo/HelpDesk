<?php
    require_once("../config/conexion.php");
    require_once("../models/Subcategoria.php");
    $subcategoria = new Subcategoria();

    switch($_GET["op"]){

        case "guardaryeditar":
            if(empty($_POST["subcat_id"])){
                $subcategoria->insert_subcategoria($_POST["cat_id"],$_POST["subcat_nom"]);     
            }else {
                $subcategoria->update_subcategoria($_POST["subcat_id"],$_POST["cat_id"],$_POST["subcat_nom"]);
            }
            break;

        case "listar":
            $datos=$subcategoria->get_subcategoria_all();
            $data= Array();
            foreach($datos as $row){
                $sub_array = array();
                $sub_array[] = $row["cat_nom"];
                $sub_array[] = $row["subcat_nom"];
                $sub_array[] = '<button type="button" onClick="editar('.$row["subcat_id"].');"  id="'.$row["subcat_id"].'" class="btn btn-inline btn-warning btn-sm ladda-button"><i class="fa fa-edit"></i></button>';
                $sub_array[] = '<button type="button" onClick="eliminar('.$row["subcat_id"].');"  id="'.$row["subcat_id"].'" class="btn btn-inline btn-danger btn-sm ladda-button"><i class="fa fa-trash"></i></button>';
                $data[] = $sub_array;
            }

            $results = array(
                "sEcho"=>1,
                "iTotalRecords"=>count($data),
                "iTotalDisplayRecords"=>count($data),
                "aaData"=>$data);
            echo json_encode($results);
            break;

        case "eliminar":
            $subcategoria->delete_subcategoria($_POST["subcat_id"]);
            break;

        case "mostrar";
            $datos=$subcategoria->get_subcategoria_x_id($_POST["subcat_id"]);  
            if(is_array($datos)==true and count($datos)>0){
                foreach($datos as $row)
                {
                    $output["subcat_id"] = $row["subcat_id"];
                    $output["cat_id"] = $row["cat_id"];
                    $output["subcat_nom"] = $row["subcat_nom"];
                }
                echo json_encode($output);
            }
            break;

        case "combo":
            $datos = $subcategoria->get_subcategoria($_POST["cat_id"]);
            $html="";
            $html.="<option label='Seleccionar'></option>";
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