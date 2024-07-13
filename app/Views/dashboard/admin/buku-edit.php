<?= $this->extend("template/dashboard-tmp"); ?>

<?= $this->section("content"); ?>

<h1><?= $title; ?></h1>

<?php if (session()->has('system')) : ?>
  <div class="alert alert-success" role="alert">
    <?= session()->get('system') ?>
  </div>

<?php endif; ?>

<form class="row row-cols-1 row-cols-md-2 g-4" method="POST" action="<?= base_url('dashboard/admin/buku/save'); ?>" enctype="multipart/form-data">

  <div class="col">
    <div class="card card-body rounded-0">
      <input type="hidden" name="id" value="<?= $buku['id']; ?>">
      <div class="mb-3">
        <label for="title" class="form-label">Judul</label>
        <input type="text" class="form-control" id="title" name="judul" value="<?= $buku['judul']; ?>">
      </div>

      <div class="mb-3">
        <label for="title" class="form-label">ISBN</label>
        <input type="text" class="form-control" id="title" name="isbn" value="<?= $buku['isbn']; ?>">
      </div>

      <div class="mb-3">
        <label class="form-label">Kategori</label>
        <select name="kategori" id="" placeholder="Pilih Kategori">
          <option value=""></option>
          <?php foreach ($kategori as $k) : ?>
            <option <?= ($k['id'] == $buku['kategori']) ? 'selected' : ''; ?> value="<?= $k['id']; ?>"><?= $k['kategori']; ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="row">
        <div class="col-12 col-md-6">
          <div class="mb-3">
            <label for="year" class="form-label">Tahun Terbit</label>
            <input type="text" class="form-control" id="title" name="tahun" value="<?= $buku['tahun_terbit']; ?>">

          </div>
        </div>
        <div class="col-12 col-md-6">
          <div class="mb-3">
            <label for="total" class="form-label">Jumlah Buku</label>
            <input type="text" class="form-control" id="title" name="stock" value="<?= $buku['stock']; ?>">
          </div>
        </div>
      </div>

      <button type="submit" class="btn btn-primary rounded-0">Simpan Buku</button>
    </div>
  </div>

  <div class="col">
    <div class="card card-body rounded-0">
      <div class="mb-3">
        <label class="form-label">Pengarang</label>
        <select name="pengarang" id="" placeholder="Pilih Pengarang">
          <option value=""></option>
          <?php foreach ($pengarang as $p) : ?>
            <option <?= ($p['id'] == $buku['pengarang']) ? 'selected' : ''; ?> value="<?= $p['id']; ?>"><?= $p['pengarang']; ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label">Penerbit</label>
        <select name="penerbit" id="" placeholder="Pilih Penerbit">
          <option value=""></option>
          <?php foreach ($penerbit as $p) : ?>
            <option <?= ($p['id'] == $buku['penerbit']) ? 'selected' : ''; ?> value="<?= $p['id']; ?>"><?= $p['penerbit']; ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label">Rak Buku</label>
        <select name="rak" id="" placeholder="Pilih Anggota">
          <option value=""></option>
          <?php foreach ($rak as $k) : ?>
            <option <?= ($k['id'] == $buku['rak']) ? 'selected' : ''; ?> value="<?= $k['id']; ?>"><?= $k['rak']; ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label">Sampul Buku</label>
        <div class="card">
          <div class="card-body">
            <img src="<?= base_url('img/cover/' . $buku['sampul']); ?>" class="d-block mx-auto m-3" alt="<?= $buku["judul"] ?>" style="max-width: 140px;" id="fotobuku">
            <input class="form-control" type="file" name="sampul" onchange="onImage('#fotobuku', this)">
          </div>
          <div class="card-footer">
            If you won't change your pic, just leave it empty
          </div>
        </div>
      </div>
    </div>
  </div>

</form>

<script>
  $(document).ready(function() {
    $('select').selectize({
      sortField: 'text'
    });
  });

  function onImage(target, src) {
    const images = document.querySelector(target);
    console.log(images);
    const [imagesFile] = src.files;
    images.src = URL.createObjectURL(imagesFile);
  }
</script>

<?= $this->endSection(); ?>