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

            $params = [

            ];

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

        public function logout() {
            unset($_SESSION['token']);
            unset($_SESSION['cliente_nome']);
            unset($_SESSION['cliente_id']);

            header('Location: ' . URL . '/cliente/login');
            exit;
        }

        public function cadastro() {
            if (isset($_POST['enviar'])) {
                $nome = $_POST['user'];
                $email = $_POST['email'];
                $usuario = $_POST['usuario'];
                $senha = $_POST['senha'];
                $cpf = $_POST['cpf'];

                $this->cliente->insertNewUser([
                    'cliente_nome' => $nome,
                    'cliente_cpf' => $cpf,
                    'cliente_endereco' => '',
                    'cliente_email' => $email,
                    'cliente_usuario' => $usuario,
                    'cliente_senha' => md5($senha),
                    'cliente_foto_de_usuario' => ''
                ]);

                header('Location: ' . URL . '/cliente/login');
                exit;
            }

            $params = [];

            $this->loadView('page-cadastro_cliente', $params);
        }
    }

