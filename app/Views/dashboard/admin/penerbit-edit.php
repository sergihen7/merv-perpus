<?= $this->extend("template/dashboard-tmp"); ?>

<?= $this->section("content"); ?>

<h1><?= $title; ?></h1>

<div class="card card-body rounded-0" style="max-width: 30rem;">
  <form method="POST" action="<?= base_url('dashboard/admin/masterdata/penerbit/'); ?>">
    <?= csrf_field(); ?>
    <div class="mb-3">
      <input type="hidden" name="id" value="<?= $penerbit['id']; ?>">
      <label for="penerbit" class="form-label">Nama Penerbit</label>
      <input type="text" class="form-control" id="penerbit" name="penerbit" value="<?= $penerbit["penerbit"] ?>">
    </div>
    <div class="mb-3">
      <label for="kode_penerbit" class="form-label">Kode Penerbit</label>
      <input type="text" class="form-control" id="kode_penerbit" name="kode_penerbit" value="<?= $penerbit["kode_penerbit"] ?>">
    </div>
    <button type="submit" class="btn btn-primary rounded-0">Edit Penerbit</button>
  </form>
</div>

<?= $this->endSection(); ?>