<?php

    class Cliente extends DBConnection {
        public function __construct() {
            parent::__construct('comerciante');
        }

        public function validLogin($email, $senha) {
            $informacoesDoCliente = [
                'cliente_email' => $email,
                'cliente_senha' => $senha
            ];

            $colunas = ['id_cliente', 'cliente_nome', 'cliente_cpf', 'cliente_foto_de_usuario'];
            $cliente = $this->selectBy($informacoesDoCliente, $colunas);
            if ($cliente) {
                print_r($cliente);
            }
        }
    }