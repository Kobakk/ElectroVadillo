<?php ob_start(); 
  $_SESSION['codArticulo'] = $articulo->getCodigo(); 
  $_SESSION['pv'] = $articulo->getPv(); 
  var_dump($_SESSION);
  var_dump($articulo);
  ?>
<main>
  <?php if (isset($articulo)) : ?>
    <table style="width: 80%; margin:auto;">
         <caption><?= $_GET['nombre']?></caption> 
      <tr>
        <td>
          <figure>
            <img src="web/imagenes/<?= $articulo->getCodigo() ?>.png" alt="" style="height: 40%">
          </figure>
        </td>
        <td style="color:navy;">
          Descripción: <span class="valor"><?= $articulo->getDescripcion() ?></span><br><br>
          Precio de venta: <span class="valor"><?= $articulo->getPv() ?>€</span><br><br>
          Cantidad disponible: <span class="valor"><?= $articulo->getStock() ? $articulo->getStock() : '<span class="error">No disponible en la actualidad</span>' ?></span>
          <br><br>
          <fieldset <?= isset($_SESSION['cliente']) ? '' : 'disabled' ?>>
            <legend <?= isset($_SESSION['cliente']) ? 'class="error"' : '' ?>>
              <?= isset($_SESSION['cliente']) ? 'Pedir' : 'Debe iniciar sesión' ?>
            </legend>

            <form class="" method="post" action="index.php?ctl=venta"> 
                <input type="number" name="cantidad" value="0" min="1" max="<?= $articulo->getStock() ?>" required>
              <br>
              <input type="submit" name="ok" value="Comprar">

            </form>
          </fieldset>
        </td>
      </tr>
    </table>
  <?php endif; ?>
</main>

<?php $contenido = ob_get_clean() ?>

<?php include 'base.inc' ?>