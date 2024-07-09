<?php

namespace App\Controllers\Dashboard\Admin;

class Setting extends \App\Controllers\BaseController
{
  public function index()
  {
    return redirect()->to(base_url('dashboard/admin'));
  }

  public function __construct()
  {
  }

  public function edit()
  {
    return view('dashboard/admin/setting');
  }
}
