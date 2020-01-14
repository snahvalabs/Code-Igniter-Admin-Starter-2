<?php if(!defined('BASEPATH')) exit('No direct script access allowed');


class Contacts_model extends CI_Model
{

    function addNewContact($contactInfo)
    {
        $query = $this->db->insert('tbl_contact', $contactInfo);
        return $query;
    }


    function getAllContacts($searchText='',$page, $segment, $uid)
    {
        $this->db->select('*');
        $this->db->from('tbl_contact');
        $this->db->where('userId',$uid);

        if(!empty($searchText)) {
            $likeCriteria = "(email  LIKE '%".$searchText."%'
                            OR  name  LIKE '%".$searchText."%'
                            OR  mobile  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->order_by('contactId', 'ASC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();

        $result = $query->result();   
        return $result;

    }

    function contactTotalCount($searchText = '',$uid)
    {
        $this->db->select('*');
        $this->db->from('tbl_contact');
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
    

    function getContactInfo($userId)
    {
        $this->db->select('*');
        $this->db->from('tbl_contact');
        $this->db->where('contactId', $userId);
        $query = $this->db->get();
        
        return $query->row();
    }

    function updateContact($contactInfo, $contactId)
    {
        $this->db->where('contactId', $contactId);
        $query = $this->db->update('tbl_contact', $contactInfo);
        
        return $query;
    }

    function deleteContact($userId)
    {
        $this->db->where('contactId', $userId);
        $query = $this->db->delete('tbl_contact');

        return $query;
    }

    function getAllContactsbyID($uid)
    {
        $this->db->select('*');
        $this->db->from('tbl_contact');
        $this->db->where('userId',$uid);

        $this->db->order_by('contactId', 'ASC');

        $query = $this->db->get();

        $result = $query->result();   
        return $result;

    }

    function contactListingCount($searchText = '')
    {
        $this->db->select('*');
        $this->db->from('tbl_contacts as BaseTbl');
        //$this->db->join('tbl_roles as Role', 'Role.roleId = BaseTbl.roleId','left');
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.email  LIKE '%".$searchText."%'
                            OR  BaseTbl.name  LIKE '%".$searchText."%'
                            OR  BaseTbl.mobile  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $query = $this->db->get();
        
        return $query->num_rows();
    }



    function contactListing($searchText = '', $page, $segment)
    {
        $this->db->select('BaseTbl.id_contact, BaseTbl.name, 
            BaseTbl.email, BaseTbl.mobile, BaseTbl.note');
        $this->db->from('tbl_contacts as BaseTbl');
        // $this->db->join('tbl_roles as Role', 'Role.roleId = BaseTbl.roleId','left');
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.email  LIKE '%".$searchText."%'
                            OR  BaseTbl.name  LIKE '%".$searchText."%'
                            OR  BaseTbl.mobile  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->order_by('BaseTbl.id_contact', 'ASC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
    
    
}

  