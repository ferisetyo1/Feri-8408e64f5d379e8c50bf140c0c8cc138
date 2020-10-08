<?php
defined('BASEPATH') or exit('No direct script access allowed');

class C_user extends CI_Controller
{

    public function index()
    {
        echo "test";
    }
    public function login()
    {
        $data = json_decode($this->input->raw_input_stream, true);
        $db_data = $this->m_crud->selectBy('user', array('username' => $data['username']));
        if (count($db_data) > 0) {
            if (password_verify($data['password'], $db_data[0]->password)) {
                $this->m_crud->update('user', array('username' => $data['username']), array('login_state' => md5(uniqid(rand(), true))));
                $out_data=$db_data = $this->m_crud->selectBy('user', array('username' => $data['username']))[0];
                $this->response($out_data, 200, "user_ditemukan");
            }else{
                $this->response(null, 200, "password_salah");
            }
        } else {
            $this->response(null, 200, "user_tidak_ditemukan");
        }
    }

    public function register()
    {
        $data = json_decode($this->input->raw_input_stream, true);
        $in_data = array(
            'username' => $data['username'],
            'password' => password_hash($data['password'], PASSWORD_DEFAULT),
            'login_state' => md5(uniqid(rand(), true))
        );
        if ($this->m_crud->save('user', $in_data)) {
            $out_data = $this->m_crud->selectBy('user', array('username' => $data['username']))[0];
            $this->response($out_data, 200, "berhasil_register");
        } else {
            $this->response(null, 200, "gagal_register");
        }
    }

    public function myInfo()
    {
        $data = json_decode($this->input->raw_input_stream, true);
        $db_data = $this->m_crud->selectBy('user', array('username' => $data['username']));
        if (count($db_data) > 0) {
            $this->response($db_data[0], 200, "user_ditemukan");
        } else {
            $this->response(null, 200, "user_tidak_ditemukan");
        }
    }

    public function response($data, $status, $message)
    {
        $response = array(
            'status' => $status,
            'message' => $message,
            'data' => $data
        );

        $this->output
            ->set_status_header(201)
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES))
            ->_display();
        exit;
    }
}
