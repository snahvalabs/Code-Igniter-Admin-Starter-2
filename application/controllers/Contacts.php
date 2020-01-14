<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Contacts extends BaseController
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('contacts_model');
        $this->isLoggedIn();   
    }

    function addNew()
    {           
        $this->global['pageTitle'] = 'Kartu Hore : Add New Contact';
        $this->loadViews("addNewContacts", $this->global, NULL, NULL);
    }

    
    function doAddNew()
    {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
            $this->form_validation->set_rules('note','Notes','trim|max_length[200]');

            if($this->form_validation->run() == FALSE)
            {
                $this->addNew();
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('fname'))));
                $email = strtolower($this->security->xss_clean($this->input->post('email')));
                $note = strtolower($this->security->xss_clean($this->input->post('note')));
                $mobile = $this->security->xss_clean($this->input->post('mobile'));
                $userId= $this->input->post('userId');

                $contactInfo = array('email'=>$email,  'name'=> $name,
                                    'mobile'=>$mobile, 'note'=>$note, 'userId'=>$userId);
                
                $result = $this->contacts_model->addNewContact($contactInfo);
                
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'New Contact created successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Contact creation failed');
                }
                
                redirect('contacts/addNew');
            }
    }



    public function index()
    {
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            $uid = $this->global['uid'];
            
            $this->load->library('pagination');
            
            $count = $this->contacts_model->contactTotalCount($searchText,$uid);
            $returns = $this->paginationCompress ( "contacts", $count, 10 );
            $data['userRecords'] = $this->contacts_model->getAllContacts($searchText, $returns["page"], $returns["segment"],$uid); 

            // $data['userRecords'] = $this->contacts_model->getAllContactsbyID($uid);
            
            $this->global['pageTitle'] = 'CIAS2 : Contacts Listing';
            
            $this->loadViews("contacts_page", $this->global, $data, NULL);
    }
    

    function updateContacts($userId = NULL)
    {
            if($userId == null)
            {
                redirect('contacts');
            }
            
            $data['contactInfo'] = $this->contacts_model->getContactInfo($userId);
            $this->global['pageTitle'] = 'CIAS2 : Edit Contact';  
            $this->loadViews("updateContact", $this->global, $data, NULL);

    }
    
    
    function doUpdateContacts()
    {

            $this->load->library('form_validation');
            
            $contactId = $this->input->post('contactId');
            
            $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
            $this->form_validation->set_rules('note','Notes','required|max_length[200]');

            if($this->form_validation->run() == FALSE)
            {
                $this->updateContacts($contactId);
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('fname'))));
                $email = strtolower($this->security->xss_clean($this->input->post('email')));
                $mobile = $this->security->xss_clean($this->input->post('mobile'));
                $note = $this->security->xss_clean($this->input->post('note'));

                $contactInfo = array();
                
                $contactInfo = array('email'=>$email, 'name'=>ucwords($name), 
                                    'mobile'=>$mobile, 'note'=>$note);

                
                $result = $this->contacts_model->updateContact($contactInfo, $contactId);
                
                if($result == true)
                {
                    $this->session->set_flashdata('success', 'Contact updated successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Contact updation failed');
                }
                
                redirect('contacts');
            }
    }


    function deleteContact($contactId)
    {           
        $result = $this->contacts_model->deleteContact($contactId);
        redirect('contacts');
    }


    function contactListing()
    {
        if($this->isAdmin() == FALSE)
        {
            $this->loadThis();
        }
        else
        {        
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            
            $this->load->library('pagination');
            
            $count = $this->contact_model->contactListingCount($searchText);

            $returns = $this->paginationCompress ( "contact/contactListing/", $count, 10 );
            $data['totalContact'] = $count;
            $data['userRecords'] = $this->contact_model->contactListing($searchText, $returns["page"], $returns["segment"]);
            
            $this->global['pageTitle'] = 'CIAS2 : Contact Listing';
            
            $this->loadViews("contact_page", $this->global, $data, NULL);
        }
    }

    
    
 

    /**
     * This function is used to check whether email already exist or not
     * @param {string} $email : This is users email
     */
    function emailExists($email)
    {
        $userId = $this->vendorId;
        $return = false;

        if(empty($userId)){
            $result = $this->user_model->checkEmailExists($email);
        } else {
            $result = $this->user_model->checkEmailExists($email, $userId);
        }

        if(empty($result)){ $return = true; }
        else {
            $this->form_validation->set_message('emailExists', 'The {field} already taken');
            $return = false;
        }

        return $return;
    }
}

?>