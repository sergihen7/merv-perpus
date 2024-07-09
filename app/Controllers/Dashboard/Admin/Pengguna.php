<?php

namespace App\Controllers\Dashboard\Admin;

class Pengguna extends \App\Controllers\BaseController
{
  protected $userM;
  public function __construct()
  {
    $this->userM       = new \App\Models\UserModel();
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
}
