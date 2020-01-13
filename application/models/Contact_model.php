<?php if(!defined('BASEPATH')) exit('No direct script access allowed');


class Contact_model extends CI_Model
{

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

    function contactTotalCount()
    {
        $this->db->select('*');
        $this->db->from('tbl_contacts');
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
    
    
    function addNewContact($contactInfo)
    {
        $this->db->trans_start();
        $this->db->insert('tbl_contacts', $contactInfo);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }
    

    function getContactInfo($userId)
    {
        $this->db->select('id_contact, name, email, mobile, note');
        $this->db->from('tbl_contacts');
        $this->db->where('id_contact', $userId);
        $query = $this->db->get();
        
        return $query->row();
    }
    

    function editContact($contactInfo, $contactId)
    {
        $this->db->where('id_contact', $contactId);
        $this->db->update('tbl_contacts', $contactInfo);
        
        return TRUE;
    }
    

    function deleteContact($userId)
    {
        $this->db->where('id_contact', $userId);
        $this->db->delete('tbl_contacts');
    }



}

  