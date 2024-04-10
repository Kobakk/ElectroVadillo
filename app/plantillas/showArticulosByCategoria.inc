<?php ob_start() ?>
    <?php if (isset($articulos)):
    $cant = count($articulos); ?>
    <table style="width: 80%; margin:auto;">
     <caption><?= $_GET['nombre']?></caption> 
      <tr>
      <?php for($i=0; $i<$cant; $i++): ?>
        <?php if (!($i % 3) ): ?>
          </tr>
          <tr>
        <?php endif; ?>
        <td>
          <figure>
            <a href="index.php?ctl=infArt&codArt=<?= $articulos[$i]['codigo'] ?>">
              <img src="<?='web/imagenes/'.$articulos[$i]['codigo'].'.png'?>"  alt="" style="width: 50%">
            </a>
            <figcaption>
              <a href="index.php?ctl=infArt&codArt=<?= $articulos[$i]['codigo']?>
                &nombre=<?= $articulos[$i]['descripcion']?>">
                <?= $articulos[$i]['descripcion'] ?>
              </a>
            </figcaption>
          </figure>
        </td>
      <?php endfor; ?>
      </tr>
    </table>
  <?php endif; ?>

 <?php $contenido = ob_get_clean() ?>

 <?php include 'base.inc' ?>
