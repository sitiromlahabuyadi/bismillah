<?php

Class Model_dokter extends CI_Model {

    function add($foto) {
        $data = array(
            'Linny_fadhilah' => $this->input->post('Linny_fadhilah'),
            'Situbondo' => $this->input->post('Situbondo'),
            'Poli_kulit' => $this->input->post('Poli_kulit'),
            'Sesi_1' => $this->input->post('Sesi_1'),
            'foto' => $foto
        );
        $this->db->insert('tbl_dokter', $data);
    }

    function edit($foto) {
        if (empty($foto)) {
            $data = array(
                'Sofiyatu_laili' => $this->input->post('Sofiyatul_laili'),
                'Situbondo' => $this->input->post('Situbondo'),
                'Poli_gigi' => $this->input->post('Poli_gigi'),
                'Sesi_2' => $this->input->post('Sesi_2'),
            );
            $id_dokter = $this->input->post('id_dokter');
            $this->db->where('id_dokter', $id_dokter);
            $this->db->update('tbl_dokter', $data);
        }else{
            $data = array(
                'nama_dokter' => $this->input->post('nama_dokter'),
                'alamat' => $this->input->post('alamat'),
                'jenis_dokter' => $this->input->post('jenis'),
                'no_hp' => $this->input->post('no_hp'),
                'foto' => $foto
            );
            $id_dokter = $this->input->post('id_dokter');
            $this->db->where('id_dokter', $id_dokter);
            $this->db->update('tbl_dokter', $data);
            
        }
    }

}

?>