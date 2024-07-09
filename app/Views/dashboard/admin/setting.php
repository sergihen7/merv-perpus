<?= $this->extend("template/dashboard-tmp"); ?>

<?= $this->section("content"); ?>

<h1><?= $title; ?></h1>



<form method="POST" action="<?= base_url('dashboard/admin/setting/save'); ?>" class="row row-cols-1 row-cols-md-2 g-4">
  <div class="col">
    <div class="card card-body rounded-0">
      <div class="mb-3">
        <label for="nama_app" class="form-label">Nama Aplikasi</label>
        <input type="text" class="form-control" id="nama_app" name="nama_app" value="<?= old('nama_app') ?? $app['nama_app']; ?>">
      </div>
      <div class="mb-3">
        <label for="alamat_app" class="form-label">Alamat</label>
        <input type="text" class="form-control" id="alamat_app" name="alamat_app" value="<?= old('alamat_app') ?? $app['alamat_app']; ?>">
      </div>
      <div class="mb-3">
        <label for="email_app" class="form-label">Email</label>
        <input type="text" class="form-control" id="email_app" name="email_app" value="<?= old('email_app') ?? $app['email_app']; ?>">
      </div>
      <div class="mb-3">
        <label for="nomor_hp" class="form-label">Telepon</label>
        <input type="text" class="form-control" id="nomor_hp" name="nomor_hp" value="<?= old('nomor_hp') ?? $app['nomor_hp']; ?>">
      </div>
      <button type="submit" class="btn btn-primary rounded-0">Save</button>
    </div>
  </div>
  <div class="col">
    <div class="card card-body rounded-0">

      <div class="mb-3">
        <label for="nama_app" class="form-label">Foto</label>
        <input type="text" class="form-control" id="nama_app" name="nama_app" value="<?= old('nama_app') ?? $app['nama_app']; ?>">
      </div>
      <div class="mb-3">
        <label for="nama_app" class="form-label">Logo</label>
        <input type="text" class="form-control" id="nama_app" name="nama_app" value="<?= old('nama_app') ?? $app['nama_app']; ?>">
      </div>
    </div>
  </div>
</form>

<?= $this->endSection(); ?>