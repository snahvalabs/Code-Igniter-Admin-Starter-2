<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Transfer extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('saldo_model');
        $this->load->model('transaction_model');
        $this->load->model('voucher_model');
        $this->load->model('contacts_model');
        $this->isLoggedIn();   
    }
    
    public function index()
    {
        $uid = $this->global['uid'];
        $data["saldoInfo"] = $this->saldo_model->getSaldoInfo($uid);
        $data["userId"] = $uid;
        $data["recordContact"] = $this->contacts_model->getAllContactsbyID($uid);
        $data["recordUser"] = $this->user_model->getAllUserByRole(3);
            
        $this->global['pageTitle'] = 'Kartu Hore : Top Up';    
        $this->loadViews("transfer_page", $this->global, $data, NULL);
    }
    
   function doTransfer()
    {
            $this->load->library('form_validation');
            $userId = $this->input->post('userId');
            $receiverId = $this->input->post('receiver');
            $rname = $this->user_model->getUserInfoById($receiverId)->name;

            $this->form_validation->set_rules('nominal','Nominal Voucher','required|max_length[8]');
            
            if($this->form_validation->run() == FALSE)
            {
                redirect('transfer');
            }
            else
            {
                $nominal = $this->security->xss_clean($this->input->post('nominal'));
                //check if nominal voucher is less than user balance
                $uid = $this->global['uid'];
                $mysaldo = $this->saldo_model->getSaldo($uid);

                if($mysaldo < $nominal)
                {
                    $this->session->set_flashdata('error', 'Your Balance is NOT Enough. Please Topup..');
                }
                else
                {
                    //update balance of user 
                    $totalSaldoUser = $mysaldo - $nominal;
                    $saldoInfoUser = array();
                    $saldoInfoUser = array('userId'=>$uid, 'saldo'=>$totalSaldoUser,
                                        'updateDate'=>date('Y-m-d H:i:s'));
                    $result = $this->saldo_model->updateSaldo($saldoInfoUser, $userId);

                    if($result == true)
                    {
                        //update balance of receiver
                        $recSaldo = $this->saldo_model->getSaldo($receiverId);
                        $totalSaldoRec = $recSaldo + $nominal;
                        $saldoInfoRec = array('userId'=>$receiverId,'saldo'=>$totalSaldoRec,
                                            'updateDate'=>date('Y-m-d H:i:s'));
                        $resultRec = $this->saldo_model->updateSaldo($saldoInfoRec, $receiverId);

                        if($resultRec == true){
                            //Add transaction Info
                            $transInfo = array('userId'=>$uid, 'sellerId'=>$receiverId, 'jenisId'=>'transfer',
                                                'note'=>'Normal','nominal'=>$nominal ,'updateDate'=>date('Y-m-d H:i:s'));
                            $tResult = $this->transaction_model->addNew($transInfo);
                            if($tResult == true){
                                $this->session->set_flashdata('success', 'Transfer Voucher to <b>'.$rname.'</b> with price <b>Rp. '.number_format($nominal,2,',','.').'</b> is Success');
                            }else{
                                $this->session->set_flashdata('error', 'Transaction Update is Failed');
                            }

                        }else{
                            $this->session->set_flashdata('error', 'Receiver Balance Update is Failed');
                        }
                    }
                    else
                    {
                        $this->session->set_flashdata('error', 'User Balance Update is Failed');
                    }

                }
                
                redirect('transfer');
            }
    }


     function saldoTest()
    {
        $uid = $this->global['uid'];
        $data["saldoInfo"] = $this->saldo_model->getSaldoInfo($uid);

        $mysaldo = $this->saldo_model->getSaldo($uid);
        $data['mysaldo'] = $mysaldo;
        $data["userId"] = $uid;

        $receiverId = $this->input->post('receiver');
        $data['rid'] = $receiverId;
            
        $this->global['pageTitle'] = 'Kartu Hore : Top Up';    
        $this->loadViews("transfer_page", $this->global, $data, NULL);      
    }
}

?>