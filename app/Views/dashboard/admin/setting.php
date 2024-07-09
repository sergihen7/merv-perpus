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
        <div class="card">
          <div class="card-body">
            <img src="<?= base_url('img/web/' . $app['foto']); ?>" class="d-block mx-auto m-3" alt="Profile.Pic" style="max-width: 140px;" id="images">
            <input class="form-control" type="file" name="img" id="fileImage" onchange="onImage()">
          </div>
          <div class="card-footer">
            If you won't change your pic, just leave it empty
          </div>
        </div>
      </div>
      <div class="mb-3">
        <div class="card">
          <div class="card-body">
            <img src="<?= base_url('img/web/' . $app['logo']); ?>" class="d-block mx-auto m-3" alt="Profile.Pic" style="max-width: 140px;" id="images">
            <input class="form-control" type="file" name="img" id="fileImage" onchange="onImage()">
          </div>
          <div class="card-footer">
            If you won't change your pic, just leave it empty
          </div>
        </div>
      </div>
    </div>
  </div>
</form>

<?= $this->endSection(); ?>