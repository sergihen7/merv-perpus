<?php

namespace App\Controllers\Dashboard\Admin;

class MasterData extends \App\Controllers\BaseController
{
  protected $bukuM;
  protected $rakM;
  protected $kategoriM;

  public function __construct()
  {
    $this->bukuM  = new \App\Models\BukuModel();
    $this->kategoriM = new \App\Models\KategoriModel();
    $this->rakM = new \App\Models\RakModel();
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
    return redirect()->to('dashboard/admin/masterdata/kategori');
  }

  public function rak_buku($index = NULL, $id = NULL)
  {
    $data = [
      'title'      => 'Rak Buku',
      'app'        => $this->app,
      'user_login' => $this->user_login,
      'pesan_ttl'  => $this->pesan_total,
      'rak'   => $this->rakM->find(),
    ];

    if ($index !== NULL) {
      switch ($index) {
        case 'create':
          return view('dashboard/admin/rak-create', $data);
          break;
        case 'edit':
          $data['rak'] = $this->rakM->find($id);
          return view('dashboard/admin/rak-edit', $data);
          break;
        case 'delete':
          $form = $this->request->getPost();
          if (!empty($form)) {
            $this->rakM->delete($form['id']);
          }
          return redirect()->to('dashboard/admin/masterdata/rak_buku');
          break;
      }
    }

    $form = $this->request->getPost();

    if (empty($form)) {
      return view('dashboard/admin/rak', $data);
    }

    $val = [
      'rak' => $form['rak'],
    ];

    if (isset($form['id'])) {
      $val['id'] = $form['id'];
    }

    $this->rakM->save($val);
    session()->setFlashdata('system', 'Rak Buku Tersimpan');
    return redirect()->to('dashboard/admin/masterdata/rak_buku');
  }
}
