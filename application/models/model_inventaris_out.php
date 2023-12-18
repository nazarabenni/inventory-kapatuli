<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Model_inventaris_out extends CI_Model
{
    public function get_data($table)
    {
        // return $this->db->get($table);

        $this->db->select("$table.*, products.name AS product_name, merchant.name AS merchant_name, users.name AS employee_name");
        $this->db->from($table);
        $this->db->join('products', "$table.product_id = products.id");
        $this->db->join('merchant', "$table.merchant_id = merchant.id");
        $this->db->join('users', "$table.user_id = users.id");

        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return array();
        }
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