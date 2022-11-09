<?php

    class comercianteController extends Comerciante {
        public function mostrarTodos() {
            print_r($this->getAll());
        }
    }