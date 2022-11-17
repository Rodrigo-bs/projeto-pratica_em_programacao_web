<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?=URL?>/assets/CSS/style_cadastro.css">
    <link rel="shortcut icon" href="<?=URL?>/assets/img/grape.png" type="image/x-icon">
    <title>Cadastro</title>
</head>

<body>
    <div class="container">
        <form action="<?=URL?>/cliente/cadastro" method="POST">
            <h1>Cadastro</h1>
            <div class="input-button">
                <input type="text" name="user" maxlength="50" required>
                <img src="<?=URL?>/assets/img/icon-user.svg" alt="" class="icon">
                <label for="user">Nome</label>
            </div>

            <div class="input-button">
                <input type="text" name="email" maxlength="50" required>
                <img src="<?=URL?>/assets/img/icon-email.svg" alt="" class="icon">
                <label for="email">Email</label>
            </div>

            <div class="input-button">
                <input type="text" name="cpf" maxlength="32" required>
                <img src="<?=URL?>/assets/img/icon-password.svg" alt="" class="icon" class="icon-pass">
                <label for="cpf">CPF</label>
            </div>

            <div class="input-button">
                <input type="password" name="senha" maxlength="32" required>
                <img src="<?=URL?>/assets/img/icon-password.svg" alt="" class="icon" class="icon-pass">
                <label for="password">Senha</label>
            </div>

            <div class="input-button">
                <input type="password" maxlength="32" required>
                <img src="<?=URL?>/assets/img/icon-password.svg" alt="" class="icon" class="icon-pass">
                <label for="password" id="confirma-senha">Confirme sua senha</label>
            </div>

            <div class="input-checkbox">
                <label for="checkbox" id="termo">Aceito todos os termos de serviço.</label>
                <input type="checkbox" name="termo" id="checkbox" required>
            </div>

            <button type="submit" name="enviar" id="enviar">Cadastrar</button>
        </form>
    </div>
</body>

</html>