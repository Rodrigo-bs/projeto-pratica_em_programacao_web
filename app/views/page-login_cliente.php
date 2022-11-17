<?php
    if (isset($_SESSION['token'])) {
        header('Location: ' . URL . '/');
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?=URL?>/assets/css/style-login.css">
    <link rel="shortcut icon" href="../../assets/img/grape.png" type="image/x-icon">
    <title><?=$params['informacoes_da_pagina']['titulo']?></title>
</head>
<body>
    <div class="container">
        <form action="<?=URL?>/cliente/login" method="POST">
            <h1>Login</h1>
            <div class="input-button">
                <input type="text" id="user" maxlength="50" name="usuario" required>
                <img src="<?=URL?>/assets/img/icon-email.svg" alt="" class="icon">
                <label for="user">E-mail</label>
            </div>

            <div class="input-button">
                <input type="password" id="password" maxlength="32" name="senha" required>
                <img src="<?=URL?>/assets/img/icon-password.svg" alt="" class="icon" id="icon-senha">
                <label for="senha">Senha</label>
            </div>

            <a href="<?=URL?>/cliente/cadastro" id="sem-cadastro">Não tem login? Cadastre-se já!</a>
            <button type="submit" id="enviar">Entrar</button>
        </form>

        <div class="grid-imagem">
            <img src="<?=URL?>/assets/img/images 1.svg" alt="#" id="img-fundo">
            <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra!</p>
        </div>
    </div>
</body>
</html>