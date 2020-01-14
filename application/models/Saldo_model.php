<?php if(!defined('BASEPATH')) exit('No direct script access allowed');


class Saldo_model extends CI_Model
{

    function getSaldoInfo($userId)
    {
        $this->db->select('BaseTbl.email, BaseTbl.name, BaseTbl.mobile, SaldoTbl.saldo, 
            SaldoTbl.updateDate');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->join('tbl_saldo as SaldoTbl', 'SaldoTbl.userId = BaseTbl.userId','left');

        $this->db->where('BaseTbl.userId', $userId);
        $query = $this->db->get();
        
        return $query->row();
    }
    
}

  