<?php

namespace App\Controllers;

use CodeIgniter\Controller;

class Home extends BaseController
{
    protected $db;

    public function index(): string
    {
        return view('welcome_message');
    } 

    public function actividad()
{
    $this->db = \Config\Database::connect();

    // Consulta 1: Listar todos los empleados y sus respectivos departamentos
    $query_listarDatos = $this->db->query(
        'SELECT e.nombre AS empleado, e.cargo, d.nombre AS departamento
        FROM empleados e
        INNER JOIN departamentos d ON e.id = d.responsable_id'
    );

    $listarDatos = $query_listarDatos->getResultArray();

    // Consulta 2: Calcular el promedio de salario por departamento:
    $query_promedioSalario = $this->db->query(
        'SELECT d.nombre AS departamento, AVG(e.salario) AS salario_promedio
        FROM empleados e
        INNER JOIN departamentos d ON e.id = d.responsable_id
        GROUP BY d.nombre'
    );

    $promedioSalario = $query_promedioSalario->getResultArray();

    // Consulta 3: Encontrar los empleados cuyo salario es mayor que el salario promedio:
    $query_mejorSalario = $this->db->query(
        'SELECT d.nombre AS departamento, AVG(e.salario) AS salario_promedio
        FROM empleados e
        INNER JOIN departamentos d ON e.id = d.responsable_id
        GROUP BY d.nombre'
    );

    $mejorSalario = $query_mejorSalario->getResultArray();

    return $this->response->setJSON($mejorSalario);
}
}
