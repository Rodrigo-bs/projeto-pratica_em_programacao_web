<?php

    class Admin extends DBConnection {
        public function __construct() {
            parent::__construct('admin');
        }

        public function validLogin($usuario, $senha) {
            $informacoesDoCliente = [
                'admin_usuario' => $usuario,
                'admin_senha' => md5($senha)
            ];

            $colunas = ['id_admin', 'admin_nome', 'admin_usuario'];
            $cliente = $this->selectBy($informacoesDoCliente, $colunas);

            if ($cliente) {
                $_SESSION['token_admin'] = md5($cliente[0]['id_admin'] + $cliente[0]['admin_nome']);
                $_SESSION['admin_id'] = $cliente[0]['id_admin'];
                $_SESSION['admin_nome'] = $cliente[0]['admin_nome'];
                
                header('Location: ' . URL . '/admin');
                exit;
            } else {
                $_SESSION['mensagems'] = 'Login Inválido';
                header('Location: ' . URL . '/admin/login');
                exit;
            }
        }
    }