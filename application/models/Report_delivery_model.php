<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Report_delivery_model extends CI_Model
{
    public function get_data($table)
    {
        return $this->db->get($table);
    }

    public function get_data_by_id($id) {
        $this->db->where('id', $id);
        $query = $this->db->get('report_delivery');
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
