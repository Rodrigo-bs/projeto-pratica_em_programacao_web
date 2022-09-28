<?php

    class Core {
        public function start() {
            $url = isset($_GET['url']) ? $_GET['url'] : '/';
            $params = [];

            if ($url != '/') {
                $url = explode('/', $url);

                $controllerPage = $url[0] . 'Controller';
                array_shift($url);

                if (!empty($url[0]) && $url[0] != '/') {
                   $action = str_replace('-', '', $url[0]);
                   array_shift($url);
                } else {
                    $action = 'index';
                }

                if (!empty($url[0]) && $url[0] != '/') {
                    $params = $url;
                }
            } else {
                $controllerPage = 'loginController';
                $action = 'index';
            }

            if (!class_exists($controllerPage) or !method_exists($controllerPage, $action)) {
                $controllerPage = 'erroController';
                $action = 'e404';
            }

            $controller = new $controllerPage();
            call_user_func_array([$controller, $action], $params);
        }
    }