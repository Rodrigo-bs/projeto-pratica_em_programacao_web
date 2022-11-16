<?php

    class Cliente extends DBConnection {
        public function __construct() {
            parent::__construct('cliente');
        }

        public function validLogin($email, $senha) {
            $informacoesDoCliente = [
                'cliente_email' => $email,
                'cliente_senha' => md5($senha)
            ];

            $colunas = ['id_cliente', 'cliente_nome', 'cliente_cpf', 'cliente_foto_de_usuario'];
            $cliente = $this->selectBy($informacoesDoCliente, $colunas);
            if ($cliente) {
                $_SESSION['token'] = md5($cliente[0]['id_cliente'] + $cliente[0]['cliente_nome']);
                $_SESSION['cliente_id'] = $cliente[0]['cliente_id'];
                $_SESSION['cliente_nome'] = $cliente[0]['cliente_nome'];
                
                header('Location: ' . URL . '/cliente');
                exit;
            } else {
                $_SESSION['mensagems'] = 'Login Inválido';
                header('Location: ' . URL . '/cliente/login');
                exit;
            }
        }
    }