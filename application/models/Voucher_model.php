<?php if(!defined('BASEPATH')) exit('No direct script access allowed');


class Voucher_model extends CI_Model
{

    function addNewVoucher($voucherInfo)
    {
        $query = $this->db->insert('tbl_voucher', $voucherInfo);
        return $query;
    }


    function getAllVoucher($searchText='',$page, $segment)
    {
        $this->db->select('*');
        $this->db->from('tbl_voucher');

        if(!empty($searchText)) {
            $likeCriteria = "(email  LIKE '%".$searchText."%'
                            OR  name  LIKE '%".$searchText."%'
                            OR  mobile  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->order_by('voucherId', 'ASC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();

        $result = $query->result();   
        return $result;

    }

    function voucherTotalCount($searchText = '')
    {
        $this->db->select('*');
        $this->db->from('tbl_voucher');

        if(!empty($searchText)) {
            $likeCriteria = "(email  LIKE '%".$searchText."%'
                            OR  name  LIKE '%".$searchText."%'
                            OR  mobile  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $query = $this->db->get();
        
        return $query->num_rows();
    }
    

    function getVoucherInfo($voucherId)
    {
        $this->db->select('*');
        $this->db->from('tbl_voucher');
        $this->db->where('voucherId', $voucherId);
        $query = $this->db->get();
        
        return $query->row();
    }

    function getNominal($code)
    {
        $this->db->select('nominal');
        $this->db->from('tbl_voucher');
        $this->db->where('code', $code);
        $query = $this->db->get();
        
        return $query->row()->nominal;
    }


    function checkVoucher($code)
    {
        $this->db->select('isUsed');
        $this->db->from('tbl_voucher');
        $this->db->where('code', $code);
        $this->db->where('isUsed',0);
        $query = $this->db->get();
        
        return $query->num_rows();
    }

    function updateVoucher($voucherInfo, $voucherId)
    {
        $this->db->where('voucherId', $voucherId);
        $query = $this->db->update('tbl_voucher', $voucherInfo);
        
        return $query;
    }

    function updateVoucherByCode($voucherInfo, $code)
    {
        $this->db->where('code', $code);
        $query = $this->db->update('tbl_voucher', $voucherInfo);
        
        return $query;
    }

    function deleteVoucher($voucherId)
    {
        $this->db->where('voucherId', $voucherId);
        $query = $this->db->delete('tbl_voucher');

        return $query;
    }
    
}

  