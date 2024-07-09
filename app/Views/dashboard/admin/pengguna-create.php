<?= $this->extend("template/dashboard-tmp"); ?>

<?= $this->section("content"); ?>

<h1><?= $title; ?></h1>

<?php if (session()->has('system')) : ?>
  <div class="alert alert-success" role="alert">
    <?= session()->get('system') ?>
  </div>

<?php endif; ?>

<div class="card card-body rounded-0" style="max-width: 30rem;">
  <form method="POST" action="<?= base_url('dashboard/admin/pengguna/save'); ?>">
    <?= csrf_field(); ?>
    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <input type="text" class="form-control <?= ($validation->hasError('username')) ? 'is-invalid' : '' ?>" id="username" name="username" value="<?= old("username"); ?>">
      <div class="invalid-feedback">
        <?= $validation->getError('username'); ?>
      </div>
    </div>
    <div class="mb-3">
      <label for="fullname" class="form-label">Full Name</label>
      <input type="text" class="form-control <?= ($validation->hasError('fullname')) ? 'is-invalid' : '' ?>" id="fullname" name="fullname" value="<?= old("fullname"); ?>">
      <div class="invalid-feedback">
        <?= $validation->getError('fullname'); ?>
      </div>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control <?= ($validation->hasError('password')) ? 'is-invalid' : '' ?>" id="password" name="password" value="<?= old("password"); ?>">
      <div class="invalid-feedback">
        <?= $validation->getError('password'); ?>
      </div>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control <?= ($validation->hasError('email')) ? 'is-invalid' : '' ?>" id="email" name="email" value="<?= old("email"); ?>">
      <div class="invalid-feedback">
        <?= $validation->getError('email'); ?>
      </div>
    </div>
    <div class="mb-3">
      <select class="form-select <?= ($validation->hasError('role')) ? 'is-invalid' : '' ?>" aria-label="Default select example" name="role">
        <option selected disabled>Select Role</option>
        <option <?= (old("role") == 'anggota') ? 'selected' : '' ?> value="anggota">Anggota</option>
        <option <?= (old("role") == 'admin') ? 'selected' : '' ?> value="admin">Admin</option>
      </select>
      <div class="invalid-feedback">
        <?= $validation->getError('role'); ?>
      </div>
    </div>
    <button type="submit" class="btn btn-primary rounded-0">Add User</button>
  </form>
</div>

<?= $this->endSection(); ?>