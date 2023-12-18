<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Supplier_product_model extends CI_Model
{
    public function get_data($table)
    {
        // return $this->db->get($table);
        $this->db->select('supplier_product.*, supplier.name AS supplier_name');
        $this->db->from($table);
        $this->db->join('supplier', 'supplier_product.supplier_id = supplier.id');

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
