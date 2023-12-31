<?php
  require_once("../../config/conexion.php"); 
  if(isset($_SESSION["usu_id"])){ 
	//Comprueba si el usuario está logueado
	//En caso de estarlo, le muestra el home
?>

<!DOCTYPE html>
<html>
    <?php require_once("../MainHead/head.php");?>
	<title>Home</title>
</head>
<body class="with-side-menu">

    <?php require_once("../MainHeader/header.php");?>

    <div class="mobile-menu-left-overlay"></div>
    
    <?php require_once("../MainNav/nav.php");?>

	<!-- Contenido -->
	<div class="page-content">
		<div class="container-fluid">			
			Blank page.
		</div>
	</div>
	<!-- Contenido -->

	<?php require_once("../MainJs/js.php");?>

	<script type="text/javascript" src="home.js"></script>

</body>
</html>

<?php
	//Sino lo lleva al inicio para que acceda
  } else {
    header("Location:".Conectar::ruta()."index.php");
  }
?>