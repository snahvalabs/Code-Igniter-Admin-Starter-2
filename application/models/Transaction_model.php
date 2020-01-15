<?php if(!defined('BASEPATH')) exit('No direct script access allowed');


class Transaction_model extends CI_Model
{

    function addNew($transInfo)
    {
        $query = $this->db->insert('tbl_transaksi', $transInfo);
        return $query;
    }

    function getAllTrans($searchText='',$page, $segment, $uid)
    {
        $this->db->select('*');
        $this->db->from('tbl_transaksi');
        $this->db->where('userId',$uid);

        if(!empty($searchText)) {
            $likeCriteria = "(email  LIKE '%".$searchText."%'
                            OR  name  LIKE '%".$searchText."%'
                            OR  mobile  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->order_by('transaksiId', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();

        $result = $query->result();   
        return $result;

    }

    function getAllTransFull($searchText='',$page, $segment, $uid)
    {
        $this->db->select('*');
        $this->db->from('tbl_transaksi as t');
        $this->db->join('tbl_users as c','t.sellerId = c.userId');
        $this->db->where('t.userId',$uid);

        if(!empty($searchText)) {
            $likeCriteria = "(email  LIKE '%".$searchText."%'
                            OR  name  LIKE '%".$searchText."%'
                            OR  mobile  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->order_by('transaksiId', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();

        $result = $query->result();   
        return $result;
    }

    function totalTrans($searchText = '',$uid)
    {
        $this->db->select('*');
        $this->db->from('tbl_transaksi');
        $this->db->where('userId',$uid);

        if(!empty($searchText)) {
            $likeCriteria = "(email  LIKE '%".$searchText."%'
                            OR  name  LIKE '%".$searchText."%'
                            OR  mobile  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $query = $this->db->get();
        
        return $query->num_rows();
    }

    function deleteTrans($transId)
    {
        $this->db->where('transaksiId', $transId);
        $query = $this->db->delete('tbl_transaksi');

        return $query;
    }
    
    
}

  