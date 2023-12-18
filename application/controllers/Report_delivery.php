<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Report_delivery extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('report_delivery_model');
    }

    public function index()
    {
        $data['title'] = 'Report Delivery';
        $data['users'] = $this->UsersModel->getUserWhere(['email' => $this->session->userdata('email')])->row_array();
        $data['report_delivery'] = $this->report_delivery_model->get_data('report_delivery')->result();

        $this->template->load('index', $data);
    }

    public function tambah()
    {
        $data['title'] = 'Tambah Report Delivery';
        $data['users'] = $this->UsersModel->getUserWhere(['email' => $this->session->userdata('email')])->row_array();

        $this->template->load('tambah_report_delivery', $data);
    }

    public function tambah_aksi()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->tambah();
        } else {
            $data = array(
                'stock_product_id' => $this->input->post('stock_product_id'),
                'date_delivery' => $this->input->post('date_delivery'),
                'amount_delivery' => $this->input->post('amount_delivery'),
                'delivery_status' => $this->input->post('delivery_status'),
            );

            $this->report_delivery_model->insert_data($data, 'report_delivery');
            $this->session->set_flashdata('pesan', '<div class="alert alert-success alert-dismissible fade show" role="alert">
            Selamat... Data Berhasil Ditambahkan!!!<button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
          </div>');
            redirect('index');
        }
    }

    public function edit($id)
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->index();
        } else {
            $data = array(
                'id' => $id,
                'stock_product_id' => $this->input->post('stock_product_id'),
                'date_delivery' => $this->input->post('date_delivery'),
                'amount_delivery' => $this->input->post('amount_delivery'),
                'delivery_status' => $this->input->post('delivery_status'),
            );

            $this->report_delivery_model->update_data($data, 'report_delivery');
            $this->session->set_flashdata('pesan', '<div class="alert alert-warning alert-dismissible fade show" role="alert">
            Selamat... Data Berhasil Diubah!!!<button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
          </div>');
            redirect('index');
        }
    }

    public function print()
    {
        $data['report_delivery'] = $this->report_delivery_model->get_data('report_delivery')->result();
        $this->load->view('print_report_delivery', $data);
    }

    public function pdf()
    {
        $this->load->library('dompdf_gen');

        $data['report_delivery'] = $this->report_delivery_model->get_data('report_delivery')->result();
        $this->load->view('laporan_report_delivery', $data);

        $paper_size = 'A4';
        $orientation = 'potrait';
        $html = $this->output->get_output();
        $this->dompdf->set_paper($paper_size, $orientation);

        $this->dompdf->load_html($html);
        $this->dompdf->render();
        $this->dompdf->stream('laporan_report_delivery.pdf', array('Attachment' => 0));
    }

    public function _rules()
    {
        $this->form_validation->set_rules('stock_out_id', 'Stock Out ID', 'required', array(
            'required' => '%s harus diisi !!'
        ));
        $this->form_validation->set_rules('date_delivery', 'Date Delivery', 'required', array(
            'required' => '%s harus diisi !!'
        ));
        $this->form_validation->set_rules('amount_delivery', 'Amount Delivery', 'required', array(
            'required' => '%s harus diisi !!'
        ));
        $this->form_validation->set_rules('delivery_status', 'Delivery Status', 'required', array(
            'required' => '%s harus diisi !!'
        ));
    }

    public function delete($id)
    {
        $where = array('id' => $id);

        $this->report_delivery_model->delete($where, 'report_delivery');
        $this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
            Selamat... Data Berhasil Dihapus!!!<button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
          </div>');
        redirect('index');
    }

    public function update_status($id) {
        // Fetch the existing report data
        $id_report = $this->Report_delivery_model->get_data_by_id($id)->row();
        // var_dump($id_report->id); exit;

        $data = array(
            'id' => $id_report->id,
            'delivery_status' => $this->input->post('delivery_status')
        );
        // var_dump($data); exit;

        // If the report exists, update its delivery status
        if ($id_report) {
            $this->Report_delivery_model->update_data($data, 'report_delivery');

            // Redirect to the desired page or show a success message
            $this->session->set_flashdata('pesan', '<div class="alert alert-success alert-dismissible fade show" role="alert">
            Status Berhasil di Update!!!<button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
            </div>');
            redirect('dashboard');
        }
    }
}
