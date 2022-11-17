<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?=URL?>/assets/CSS/style_home.css">
    <link rel="shortcut icon" href="<?=URL?>/assets/img/grape.png" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Grape</title>
</head>
<body>
    <header>
        <img src="<?=URL?>/assets/img/logo.svg" alt="Logo da página">

        <nav class="menu-nav">
            <ul>
                <li><a href="<?=URL?>/">Home</a></li>
                <li><a href="/">Lojas</a></li>
                <li><a href="/">Categorias</a></li>
                <li><a href="/">Ajuda</a></li>
                <?php if (!isset($_SESSION['token'])) {?>
                    <li id="login-botao"><a href="<?=URL?>/cliente/login">Login</a></li>
                    <li id="cadastro-botao"><a href="/">Cadastrar Loja</a></li>
                <?php } else {?>
                    <li id="perfil">
                        <a href="<?=URL?>/cliente/perfil">
                            <?=$_SESSION['cliente_nome']?><i class='bx bx-chevron-down'></i>
                        </a>

                        <ul>
                            <li><a href="<?=URL?>/cliente/logout">Logout</a></li>
                        </ul>
                    </li>
                <?php }?>
            </ul>
        </nav>
    </header>

    <section>
        <img src="<?=URL?>/assets/img/img-fundo-section.svg" alt="">
    </section>
</body>
</html>