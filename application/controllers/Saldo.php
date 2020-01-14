<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Saldo extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('saldo_model');
        $this->isLoggedIn();   
    }

    public function index()
    {
        $uid = $this->global['uid'];
        $data["saldoInfo"] = $this->saldo_model->getSaldoInfo($uid);
            
        $this->global['pageTitle'] = 'Kartu Hore : Info Saldo';    
        $this->loadViews("saldo_page", $this->global, $data, NULL);
    }

}

?>