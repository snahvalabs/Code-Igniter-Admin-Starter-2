<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

/**
 * Class : User (UserController)
 * User Class to control all user related operations.
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Topup extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('saldo_model');
        $this->load->model('transaction_model');
        $this->load->model('voucher_model');
        $this->isLoggedIn();   
    }
    
    public function index()
    {
        $uid = $this->global['uid'];
        $data["saldoInfo"] = $this->saldo_model->getSaldoInfo($uid);
        $data["userId"] = $uid;
            
        $this->global['pageTitle'] = 'Kartu Hore : Top Up';    
        $this->loadViews("topup_page", $this->global, $data, NULL);
    }
    
   function doTopup()
    {
            $this->load->library('form_validation');
            $userId = $this->input->post('userId');
            $this->form_validation->set_rules('code','Code Voucher','required|max_length[12]');
            
            if($this->form_validation->run() == FALSE)
            {
                redirect('topup');
            }
            else
            {
                $code = $this->security->xss_clean($this->input->post('code'));
                //check if voucher is available
                $check = $this->voucher_model->checkVoucher($code);
                if($check == 0)
                {
                    $this->session->set_flashdata('error', 'Voucher <b>'.$code.'</b> is NOT Available');
                }
                else
                {
                    //$this->session->set_flashdata('success', 'Voucher is Available');
                                    // //get Saldo info from User
                    $uid = $this->global['uid'];
                    $mysaldo = $this->saldo_model->getSaldo($uid);

                    //get nominal from Voucher Code
                    $nominal = $this->voucher_model->getNominal($code);
                    $totalSaldo = $mysaldo + $nominal;

                    //update saldo to user table
                    $saldonfo = array();
                    $saldoInfo = array('userId'=>$uid, 'saldo'=>$totalSaldo,
                                        'updateDate'=>date('Y-m-d H:i:s'));
                    $result = $this->saldo_model->updateSaldo($saldoInfo, $userId);
                    if($result == true)
                    {
                        // $this->session->set_flashdata('success', 'Saldo updated successfully');
                        //update voucher to be used
                        $voucherInfo = array();
                        $voucherInfo = array('isUsed'=>1);
                        $vResult = $this->voucher_model->updateVoucherByCode($voucherInfo, $code);
                        if($vResult == true){
                            //Add transaction Info
                            $transInfo = array();
                            $transInfo = array('userId'=>$uid, 'sellerId'=>1, 'jenisId'=>'topup',
                                                'note'=>'Normal','nominal'=>$nominal ,'updateDate'=>date('Y-m-d H:i:s'));
                            $tResult = $this->transaction_model->addNew($transInfo);
                            if($tResult == true){
                                $this->session->set_flashdata('success', 'Topup used Voucher '.$code.' with price Rp. '.number_format($nominal,2,',','.').' is Success');
                            }else{
                                $this->session->set_flashdata('error', 'Transaction Update is Failed');
                            }

                        }else{
                            $this->session->set_flashdata('error', 'Voucher Update is Failed');
                        }
                    }
                    else
                    {
                        $this->session->set_flashdata('error', 'Balance Topup is Failed');
                    }

                }
                
                redirect('topup');
            }
    }


     function saldoTest()
    {
        $uid = $this->global['uid'];
        $data["saldoInfo"] = $this->saldo_model->getSaldoInfo($uid);

        $mysaldo = $this->saldo_model->getSaldo($uid);
        $data['mysaldo'] = $mysaldo;
        $data["userId"] = $uid;
            
        $this->global['pageTitle'] = 'Kartu Hore : Top Up';    
        $this->loadViews("topup_page", $this->global, $data, NULL);      
    }
}

?>