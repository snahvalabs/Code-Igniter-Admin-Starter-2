<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Voucher extends BaseController
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('voucher_model');
        $this->isLoggedIn();   
    }

    function addNew()
    {           
        $this->global['pageTitle'] = 'Kartu Hore : Add New Voucher';
        $this->loadViews("addNewVoucher", $this->global, NULL, NULL);
    }

    
    function doAddNew()
    {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('code','Voucher Code','trim|required|min_length[12]');
            $this->form_validation->set_rules('nominal','Nominal','required|max_length[8]');
            $this->form_validation->set_rules('note','Notes','trim|max_length[200]');

            if($this->form_validation->run() == FALSE)
            {
                $this->addNew();
            }
            else
            {
                $code = $this->security->xss_clean($this->input->post('code'));
                $note = strtolower($this->security->xss_clean($this->input->post('note')));
                $nominal = $this->security->xss_clean($this->input->post('nominal'));

                $voucherInfo = array('code'=>$code,  'nominal'=> $nominal,
                                    'note'=>$note);
                
                $result = $this->voucher_model->addNewVoucher($voucherInfo);
                
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'New Voucher created successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Voucher creation failed');
                }
                
                redirect('voucher/addNew');
            }
    }



    public function index()
    {
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            
            $this->load->library('pagination');
            
            $count = $this->voucher_model->voucherTotalCount($searchText);
            $returns = $this->paginationCompress ( "voucher", $count, 10 );
            $data['voucherRecords'] = $this->voucher_model->getAllVoucher($searchText, $returns["page"], $returns["segment"]); 
            $this->global['pageTitle'] = 'Kartu Hore : Voucher Listing';
            
            $this->loadViews("voucher_page", $this->global, $data, NULL);
    }
    

    function updateVoucher($voucherId = NULL)
    {
            if($userId == null)
            {
                redirect('voucher');
            }
            
            $data['voucherInfo'] = $this->voucher_model->getVoucherInfo($voucherId);
            $this->global['pageTitle'] = 'Kartu Hore : Edit Voucher';  
            $this->loadViews("updateVoucher", $this->global, $data, NULL);

    }
    

    function doUpdateVoucher()
    {

            $this->load->library('form_validation');
            
            $voucherId = $this->input->post('voucherId');
            
            $this->form_validation->set_rules('code','Voucher Code','trim|required|min_length[12]');
            $this->form_validation->set_rules('nominal','Nominal','required|max_length[8]');
            $this->form_validation->set_rules('note','Notes','trim|max_length[200]');

            if($this->form_validation->run() == FALSE)
            {
                $this->updateVoucher($voucherId);
            }
            else
            {
                $code = $this->security->xss_clean($this->input->post('code'));
                $note = strtolower($this->security->xss_clean($this->input->post('note')));
                $nominal = $this->security->xss_clean($this->input->post('nominal'));

                $voucherInfo = array('code'=>$code,  'nominal'=> $nominal,
                                    'note'=>$note);
                
                $result = $this->voucher_model->updateVoucher($voucherInfo, $voucherId);
                
                if($result == true)
                {
                    $this->session->set_flashdata('success', 'Voucher updated successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Voucher updation failed');
                }
                
                redirect('voucher');
            }
    }


    function deleteVoucher($voucherId)
    {           
        $result = $this->voucher_model->deleteVoucher($voucherId);
        redirect('voucher');
    }

}

?>