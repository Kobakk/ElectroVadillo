<!DOCTYPE html>
<html>

<head>
  <title>Tienda Electronica | Electro Vadillo</title>
  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript">
    if (history.forward(1)) {
      location.replace(history.forward(1));
    }
  </script>
  <link rel="stylesheet" href="web/css/estilos.css">
</head>

<body>
  <header>
    <nav>
    <h1>Electro Vadillo</h1>
      <ul>
        <li>
          <a href="index.php?ctl=inicio">Inicio</a>
        </li>
        <?php if (isset($_SESSION['cliente'])) : ?>
          <li> <a href="index.php?ctl=logout">Cerrar Sesion</a></li>
        <?php if(isset($_SESSION['idPedido'])): ?>
          <li> <a href="index.php?ctl=finPedido">Terminar Pedido</a></li>
        <?php endif; endif; ?>
        <?php if (isset($_SESSION['registro'])) : ?>
          <li> <a href="index.php?ctl=finPedido">Registrarse</a></li> 
        <?php endif; ?>
        <?php if(true) :?>
          <li><a href="index.php?ctl=nuevaPagina&nuevosDatos=5&id=8">Nuevo dato</a></li>
        <?php endif;?>
        <?php if(isset($_SESSION['usuario2'])) : ?>
          <li><a href="index.php?ctl=limpiarDatos">Limpiar Datos</a></li>
        <?php endif;?>
        <?php if(!empty($_SESSION['usuario2']['id'])):?>
          <li><a href="index.php?ctl=nuevoID">LimpiarId</a></li>
          <li><a href="index.php?ctl=eliminarID">EliminarId</a></li>
        <?php endif;?>
        <?php if(true):?>
          <li><a href="index.php?ctl=limpiarFormulario">LimpiarFormulario</a></li>
        <?php endif;?>
        <?php if (isset($_SESSION['cliente'])):?>
          <li><a href="index.php?ctl=finPedido">Terminar Pedido</a></li>
        <?php endif;?>
      </ul>
    </nav>
  </header>
  <main>
  <?php if ( !isset($_SESSION['cliente'])/*!isset($_SESSION['cliente'])*/) :
  ?>
    <aside class="lateralIzda">
      <fieldset>
        <legend>Identificación</legend>
        <form class="" action="index.php?ctl=login" method="post">
          <span class="error"><?= isset($_SESSION['error']) ? $_SESSION['error'] . "<br>" : null; ?></span>
          <label for="usuario">ECorreo</label><br>
          <input type="text" name="eCorreo" value=""><br>
          <label for="pwd">Contraseña</label><br>
          <input type="password" name="pwd" value=""><br>
          <a href="index.php">No estoy registrado</a><br>
          <input type="submit" name="ok" value="Aceptar">
          <input type="reset" name="limpiar" value="Limpiar">
        </form>
      </fieldset>
    </aside>

  <?php endif; ?>

  <div id="contenido">
    <?= $contenido ?>
  </div>
  </main>
  <footer>
    <hr>
    <p class="footer_text">- Pie de página -</p>
  </footer>
</body>

</html>