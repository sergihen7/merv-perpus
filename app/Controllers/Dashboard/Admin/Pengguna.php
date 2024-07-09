<?php

namespace App\Controllers\Dashboard\Admin;

class Pengguna extends \App\Controllers\BaseController
{
  protected $userM;
  public function __construct()
  {
    $this->userM = new \App\Models\UserModel();
  }

  public function index()
  {
    return redirect()->to(base_url('dashboard/admin'));
  }

  public function anggota()
  {
    $data = [
      'title'      => 'Anggota',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
    ];

    $data['anggota'] = $this->userM
      ->select('user.*, kelas.nama_kelas')
      ->join('kelas', 'kelas.id = user.kelas', 'left')
      ->where('role', 'anggota')
      ->find();

    return view('dashboard/admin/pengguna', $data);
  }

  public function admin()
  {
    $data = [
      'title'      => 'Admin',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
    ];

    $data['admin'] = $this->userM
      ->where('role', 'admin')
      ->find();

    return view('dashboard/admin/pengguna', $data);
  }

  public function create()
  {
    $data = [
      'title'   => 'Tambah Pengguna',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
      'validation' => \Config\Services::validation()
    ];
    return view("dashboard/admin/pengguna-create", $data);
  }

  public function edit($id = NULL)
  {
    if ($id == NULL) {
      return redirect()->to(base_url('dashboard/admin/pengguna/create'));
    }

    $userEdit = $this->userM->find($id);

    $data = [
      'title'   => 'Edit Pengguna',
      'app'        => $this->app,
      'user_edit' => $userEdit,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
      'validation' => \Config\Services::validation()
    ];
    return view("dashboard/admin/pengguna-edit", $data);
  }

  public function save()
  {

    $data = $this->request->getVar();

    if (isset($data['id'])) {
      $user = $this->userM->where(['id' => $data['id']])->first();

      if ($user['username'] == $data['username']) {
        $valid = 'required';
      } else {
        $valid = 'required|is_unique[user.username]';
      }
      $valid = [
        'username' => $valid,
        'email'    => 'required',
        'role'     => 'required',
        'fullname' => 'required',
      ];

      $save = [
        'id'       => $data['id'],
        'username' => $data['username'],
        'email'    => $data['email'],
        'role'     => $data['role'],
      ];

      $redirect = "dashboard/users/edit/$data[id]";
    } else {
      $valid = [
        'username' => 'required|is_unique[user.username]',
        'email'    => 'required',
        'role'     => 'required',
        'fullname' => 'required',
      ];

      $save = [
        'username' => $data['username'],
        'password' => $data['password'],
        'email'    => $data['email'],
        'role'     => $data['role'],
      ];

      $redirect = "dashboard/users/create";
    }

    if (!$this->validate($valid)) {
      $validation = \Config\Services::validation();
      return redirect()->to(base_url($redirect))->withInput()->with('validation', $validation);
    }

    $this->userM->save($save);

    session()->setFlashdata('system', 'User Successfully Saved');
    return redirect()->to(base_url($redirect));
    // dd($data);
  }
}
