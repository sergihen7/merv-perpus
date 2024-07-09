<?= $this->extend("template/dashboard-tmp"); ?>

<?= $this->section("content"); ?>

<h1><?= $title; ?></h1>

<?php if (session()->has('system')) : ?>
  <div class="alert alert-success" role="alert">
    <?= session()->get('system') ?>
  </div>

<?php endif; ?>

<div class="card card-body rounded-0" style="max-width: 30rem;">
  <form method="POST" action="<?= base_url('dashboard/admin/laporan/save'); ?>">
    <?= csrf_field(); ?>

    <div class="mb-3">
      <label for="id_user" class="form-label">Nama Anggota</label>
      <select type="text" id="id_user" name="id_user" placeholder="Pilih Anggota">
        <option value=""></option>
        <?php foreach ($user as $u) : ?>
          <option value="<?= $u['id']; ?>"><?= $u['fullname']; ?>
          </option>
        <?php endforeach; ?>
      </select>
    </div>

    <div class="mb-3">
      <label for="id_book" class="form-label">Judul Buku</label>
      <select type="text" id="id_book" name="id_buku" placeholder="Pilih Buku">
        <option value=""></option>
        <?php foreach ($buku as $b) : ?>
          <option value="<?= $b['id']; ?>"><?= $b['judul']; ?>
          </option>
        <?php endforeach; ?>
      </select>
    </div>
    <div class="mb-3">
      <label for="duration" class="form-label">Durasi Peminjaman</label>
      <select name="durasi" id="duration">
        <option value="1">1 Minggu</option>
        <option value="2">2 Minggu</option>
        <option value="3">3 Minggu</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="condition" class="form-label">Kondisi Buku</label>
      <select name="kondisi" id="condition">
        <option value="1">Baik</option>
        <option value="0">Rusak</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary rounded-0">Tambah</button>
  </form>
</div>

<script>
  $(document).ready(function() {
    $('select').selectize({
      sortField: 'text'
    });
  });
</script>


<?= $this->endSection(); ?>