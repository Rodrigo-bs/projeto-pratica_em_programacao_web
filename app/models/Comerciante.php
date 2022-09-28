<?php

    class Comerciante extends DBConnection {

        public function __construct() {
            parent::__construct('comerciante');
        }

        public function getAll() {
            return $this->selectAll();
        }
    }