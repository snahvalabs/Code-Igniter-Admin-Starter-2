<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Main extends CI_Controller
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->load->view('main_page');
    }

}