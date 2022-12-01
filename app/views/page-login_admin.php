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
    <div class="container admin">
        <form action="<?=URL?>/admin/login" method="POST">
            <h1>Login admin</h1>
            <div class="input-button">
                <input type="text" id="user" maxlength="50" name="usuario" required>
                <img src="<?=URL?>/assets/img/icon-email.svg" alt="email" class="icon">
                <label for="user">Usuário</label>
            </div>

            <div class="input-button">
                <input type="password" id="password" maxlength="32" name="senha" required>
                <img src="<?=URL?>/assets/img/icon-password.svg" alt="senha" class="icon" id="icon-senha">
                <label for="senha">Senha</label>
            </div>

            <a href="<?=URL?>/cliente/cadastro" id="sem-cadastro">Não tem login? Cadastre-se já!</a>
            <button type="submit" id="enviar">Entrar</button>
        </form>
    </div>
</body>
</html>