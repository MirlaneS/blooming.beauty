<?php

$mesangem = "Estou com sede!";
$senha = "0123456789";

$titulo = 'Meu site - Contatos';
$idade_do_fesso = -17.99;

$idadeDoFesso = 17;
$CASA = 'Amarela';
$casa = 'azul';

$cnpj = '875908347095687340258';

$amarelo = true;

// Criand  constante em PHP;
define('casa', 'azul');

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $titulo ?></title>
</head>

<body>

    <?php echo "Olá terra!";
    echo "Olá planeta!" ?>

    <?php

    echo somar(10, 2);

    echo "Olá mundo!";

    echo '<p>Estou aqui!</p>';

    // echo `E você?`; Isso está errado.

    /*
Este comentário
tem várias linhas 
*/

    /* uma linha só */

    echo $mesangem;

    echo 18.99;

    echo $idade_do_fesso;

    ?>

</body>

</html>
<?php

echo 'Acabou!';

echo $idadeDoFesso;


echo '<br>' . $CASA . "<br>" . $casa . '<br>';

echo '<br>{$CASA}<br>{$casa}<br>';


if ($amarelo) {
    echo '<p>Amarelo</p>';
} else if (!$amarelo) {
    echo '<p>Sem cor</p>';
} else {
}



$idade_do_fesso = "vinte e cinco anos";

echo '<br>' . $idade_do_fesso;

// define('casa', 'amarela'); → Constate já foi criada antes...

echo '<h1>' . casa . '</h1>';



// Função que soma dois valores e exibe o resultado no navegador:
function somar($val1, $val2)
{
    $soma = $val1 + $val2;
    return $soma;
}



?>
Footer
© 2022 GitHub, Inc.