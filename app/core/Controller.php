<?php 

    class Controller {
        public function loadView($viewName, $params = []) {
            require 'app/views/' . $viewName . '.php';
        }

        public function loadViewTemplate($viewName, $params = []) {
            $this->loadView($viewName, $params);
        }

        public function loadTemplate($viewName, $data = []) {
            require 'app/views/template_admin.php';
        }
    }