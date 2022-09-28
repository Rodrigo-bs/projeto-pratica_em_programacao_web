<?php
    session_start();
    
    include './vendor/autoload.php';
    require './config.php';

    spl_autoload_register(function($class) {
        if (file_exists('app/controllers/' . $class . '.php')) {
            include './app/controllers/' . $class . '.php';
        } else if (file_exists('app/models/' . $class . '.php')) {
            include './app/models/' . $class . '.php';
        } else if (file_exists('app/core/' . $class . '.php')) {
            include './app/core/' . $class . '.php';
        }
    });



    $core = new Core();
    $core->start();