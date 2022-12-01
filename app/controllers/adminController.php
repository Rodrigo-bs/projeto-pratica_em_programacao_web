<?php

    class adminController extends Controller {
        public $admin;

        public function __construct() {
            $this->admin = new Admin();
        }

        public function index() {
            $params = [];
            if (!isset($_SESSION['token_admin'])) {
                header('Location: ' . URL . '/admin/login');
                exit;
            }

            $params['informacoes_de_usuario'] = [
                'nome_do_usuario' => $_SESSION['admin_nome'],
            ];
            
            $params['informacoes_da_pagina'] = [
                'titulo' => 'Controle ADMIN - ' . $_SESSION['admin_nome']
            ];

            $this->loadView('page-dashboard_admin', $params);
        }

        public function login() {
            if (isset($_POST['usuario']) && isset($_POST['senha']) && $_POST['usuario'] && $_POST['senha']) {
                $this->admin->validLogin($_POST['usuario'], $_POST['senha']);
            }

            $params = [
                'informacoes_da_pagina' => 'Página de Login'
            ];

            $this->loadView('page-login_admin', $params);
        }

        public function logout() {
            unset($_SESSION['token_admin']);
            unset($_SESSION['admin_nome']);
            unset($_SESSION['admin_id']);

            header('Location: ' . URL . '/admin/login');
            exit;
        }
    }

