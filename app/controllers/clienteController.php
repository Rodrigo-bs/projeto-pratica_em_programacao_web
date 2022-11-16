<?php

    class clienteController extends Controller {
        public $cliente;

        public function __construct() {
            $this->cliente = new Cliente();
        }

        public function index() {
            if (isset($_SESSION['token'])) {
                $params['informacoes_de_usuario'] = [
                    'nome_do_usuario' => 'nome',
                ];
            }

            $this->loadView('page-home_cliente', $params);
        }

        public function login() {
            if (isset($_POST['usuario']) && isset($_POST['senha']) && $_POST['usuario'] && $_POST['senha']) {
                $this->cliente->validLogin($_POST['usuario'], $_POST['senha']);
            }

            $params = [
                'informacoes_da_pagina' => 'Página de Login'
            ];

            $this->loadView('page-login_cliente', $params);
        }
    }