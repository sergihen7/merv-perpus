<?php

namespace App\Controllers\Dashboard\Admin;

class Notif extends \App\Controllers\BaseController
{
  protected $notifM;
  public function __construct()
  {
    $this->notifM = new \App\Models\PemberitahuanModel();
  }

  public function index()
  {
    $data = [
      'title'      => 'Pemberitahuan',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
    ];

    $data['notif'] = $this->notifM
      ->whereIn('level_akses', ['0', '1', '2'])
      ->where('status', '1')
      ->find();

    return view('dashboard/admin/notif', $data);
  }
}
