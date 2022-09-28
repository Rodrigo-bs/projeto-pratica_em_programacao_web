<?php

    class DBConnection {
        private const DBNAME = 'grape';
        private const HOST = 'localhost';
        private const USER = 'root';
        private const PASSWORD = '';

        protected $conn;
        protected $table;
        
        public function __construct($table) {
            $this->table = $table;
            $this->makeConnection();
        }

        private function makeConnection() {
            try {
                $pdo = new PDO('mysql:host='. SELF::HOST . ';dbname='. SELF::DBNAME, SELF::USER, SELF::PASSWORD);
                $pdo->setAttribute(PDO::ERRMODE_EXCEPTION, PDO::ERRMODE_WARNING);
                $this->conn = $pdo;
            } catch(PDOException $e) {
                die('Erro na conexão com o banco de dados');
            }
        }

        protected function execute($sql, $values = []) {
            try {
                $mysql = $this->conn->prepare($sql);
                $mysql->execute($values);
                return $mysql;
            } catch(PDOException $e) {
                die('Erro na comunicação com o banco de dados, erro: ' . $e->getMessage());
            }
        }

        protected function selectAll($columns = ['*']) {
            $sql = "SELECT ".implode(',', $columns)." FROM $this->table";
            return $this->execute($sql)->fetchAll();
        }

        protected function selectBy($where, $columns = ['*']) {
            $whereColumn = array_keys($where);
            $values = array_values($where);

            $sql = "SELECT ".implode(',', $columns)." FROM $this->table WHERE " . implode('=? AND ', $whereColumn). '=?';
            return $this->execute($sql, $values)->fetchAll();
        }

        protected function insert($values) {
            $columns = array_keys($values);            
            $values = array_values($values);
            $placeholders = array_pad([], count($values), '?');

            $sql = "INSERT INTO $this->table (".implode(',', $columns).") VALUES (".implode(',', $placeholders).")";
            return $this->execute($sql, $values);
        }

        protected function update($values, $where) {
            $columns = array_keys($values);      
            $values = array_values($values);
            $placeholders = array_pad([], count($values), '?');

            $whereColumns = array_keys($where);
            $whereValues = array_values($where);
            
            foreach ($whereValues as $whereValue) {
                array_push($values, $whereValue);
            }

            $sql = "UPDATE $this->table SET ".implode('=?,', $columns)."=? WHERE ". implode('=? AND ', $whereColumns)."=?";
            return $this->execute($sql, $values);
        }

        protected function delete($where) {
            $whereColumn = array_keys($where);
            $values = array_values($where);

            $sql = "DELETE FROM $this->table WHERE " . implode('=? AND ', $whereColumn) .'=?';
            return  $this->execute($sql, $values);
        }
    }