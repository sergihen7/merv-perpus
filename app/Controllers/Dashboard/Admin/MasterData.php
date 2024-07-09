<?php

namespace App\Controllers\Dashboard\Admin;

class MasterData extends \App\Controllers\BaseController
{
  protected $bukuM;
  protected $kategoriM;
  public function __construct()
  {
    $this->bukuM  = new \App\Models\BukuModel();
    $this->kategoriM = new \App\Models\KategoriModel();
  }

  public function index()
  {
    $data = [
      'title'      => 'Home',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
    ];
    return redirect()->to(base_url('dashboard/admin'));
  }


  public function kategori($index = NULL, $id = NULL)
  {

    $data = [
      'title'      => 'Kategori',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
      'kategori'   => $this->kategoriM->find(),
    ];

    if ($index !== NULL) {
      switch ($index) {
        case 'create':
          return view('dashboard/admin/kategori-create', $data);
          break;
        case 'edit':
          $data['kategori'] = $this->kategoriM->find($id);
          return view('dashboard/admin/kategori-edit', $data);
          break;
        case 'delete':
          $form = $this->request->getPost();
          if (!empty($form)) {
            $this->kategoriM->delete($form['id']);
          }
          return redirect()->to('dashboard/admin/masterdata/kategori');
          break;
      }
    }

    $form = $this->request->getPost();

    if (empty($form)) {
      return view('dashboard/admin/kategori', $data);
    }

    $val = [
      'kategori' => $form['category'],
    ];

    if (isset($form['id'])) {
      $val['id'] = $form['id'];
    }

    $this->kategoriM->save($val);
    session()->setFlashdata('system', 'Kategori Tersimpan');
    return redirect()->to('dashboard/admin/masterdata/kategori/ ');
  }
}
