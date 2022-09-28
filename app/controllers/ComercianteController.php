<?php

    class ComercianteController extends Comerciante {
        public function mostrarTodos() {
            print_r($this->getAll());
        }
    }