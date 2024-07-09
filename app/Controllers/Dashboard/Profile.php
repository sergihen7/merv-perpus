<?php

namespace App\Controllers\Dashboard;

class Profile extends \App\Controllers\BaseController
{
  protected $userM;
  protected $kelasM;
  public function __construct()
  {
    $this->userM = new \App\Models\UserModel();
    $this->kelasM = new \App\Models\KelasModel();
  }

  public function index()
  {
    $form = $this->request->getPost();
    $data = [
      'title'      => 'Profile',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
      'kelas'      => $this->kelasM->find(),
    ];

    if (empty($form)) {
      return view('dashboard/profile', $data);
    }

    $img = $this->request->getFile('img');
    // dd($form, $img);

    $save = [
      'id'       => session()->get('id'),
      'username' => $form['username'],
      'email'    => $form['email'],
      'fullname' => $form['fullname'],
      'alamat'   => $form['alamat'],
    ];

    if (isset($form['nis'])) {
      $save['nis'] = $form['nis'];
    }
    if (isset($form['kelas'])) {
      $save['kelas'] = $form['kelas'];
    }

    if ($img->getError() !== 4) {
      $nameimg = $img->getRandomName();
      $img->move('img/profile', $nameimg);
      $save['foto'] = $nameimg;
    }

    $this->userM->save($save);

    session()->setFlashdata('success', 'Profile saved');
    return redirect()->to(base_url('dashboard/profile'));
  }
}
