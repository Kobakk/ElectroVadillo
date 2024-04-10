<?php ob_start() ?>
<?php
if(!empty($_SESSION)) var_dump($_SESSION);
if(!empty($_GET)) var_dump($_GET);
?>
<h2 class="titulo2">Bienvenido a la tienda</h2>
<main>
    <?php if (isset($categorias)):
    $cant = count($categorias); ?>
    <table style="width: 80%; margin:auto;">
      <tr>
      <?php for($i=0; $i<$cant; $i++): ?>
        <?php if (!($i % 3) ): ?>
          </tr>
          <tr>
        <?php endif; ?>
        <td>
          <figure>
            <a href="index.php?ctl=artByCat&id=<?= $categorias[$i]['id'] ?>">
              <img src="<?= 'web/imagenes/'.$categorias[$i]['imagen']?>"
                   alt="<?= $categorias[$i]['nombre'] ?>" style="width: 100px"
                   title="<?= $categorias[$i]['descripcion'] ?>">
            </a>
            <figcaption>
              <a href="index.php?ctl=artByCat&id=<?= $categorias[$i]['id'] ?>&nombre=<?= $categorias[$i]['nombre']?>">
              <?= $categorias[$i]['nombre'] ?>
              </a>
          </figcaption>
          </figure>
        </td>
      <?php endfor; ?>
      </tr>
    </table>
  <?php endif; ?>
</main>

 <?php $contenido = ob_get_clean() ?>

 <?php include 'base.inc' ?>
