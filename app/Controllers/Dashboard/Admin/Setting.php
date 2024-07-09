<?php

namespace App\Controllers\Dashboard\Admin;

class Setting extends \App\Controllers\BaseController
{

  public function __construct()
  {
  }

  public function index()
  {
    $data = [
      'title'   => 'Setelan Aplikasi',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
      'validation' => \Config\Services::validation()
    ];

    return view('dashboard/admin/setting', $data);
  }
}
