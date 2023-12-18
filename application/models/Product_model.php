<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Product_model extends CI_Model
{
    public function get_data($table, $conditions = array())
    {
        // return $this->db->get($table);
        $this->db->select('*');
        $this->db->from($table);

        // Add conditions to the query
        if (!empty($conditions)) {
            $this->db->where($conditions);
        }

        $query = $this->db->get();

        // Return the result of the query
        return $query;

    }

    public function insert_data($data, $table)
    {
        $this->db->insert($table, $data);
    }

    public function update_data($data, $table)
    {
        $this->db->where('id', $data['id']);
        $this->db->update($table, $data);
    }

    public function delete($where, $table)
    {
        $this->db->where($where);
        $this->db->delete($table);
    }
}