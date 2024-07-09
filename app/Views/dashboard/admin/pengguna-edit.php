<?= $this->extend("template/dashboard-tmp"); ?>

<?= $this->section("content"); ?>

<h1><?= $title; ?></h1>

<?php if (session()->has('system')) : ?>
  <div class="alert alert-success" role="alert">
    <?= session()->get('system') ?>
  </div>

<?php endif; ?>

<div class="card card-body rounded-0" style="max-width: 30rem;">
  <form method="POST" action="<?= base_url('dashboard/users/save'); ?>">
    <?= csrf_field(); ?>
    <input type="hidden" name="id" value="<?= $user_edit['id']; ?>">
    <div class="mb-3">
      <label for="username" class="form-label">Username</label>
      <input type="text" class="form-control <?= ($validation->hasError('username')) ? 'is-invalid' : '' ?>" id="username" name="username" value="<?= (old("username")) ? old("username") : $user_edit["username"] ?>">
      <div class="invalid-feedback">
        <?= $validation->getError('username'); ?>
      </div>
    </div>
    <div class="mb-3">
      <label for="fullname" class="form-label">Full Name</label>
      <input type="text" class="form-control <?= ($validation->hasError('fullname')) ? 'is-invalid' : '' ?>" id="fullname" name="fullname" value="<?= (old("fullname")) ? old("fullname") : $user_edit["fullname"] ?>">
      <div class="invalid-feedback">
        <?= $validation->getError('fullname'); ?>
      </div>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control <?= ($validation->hasError('email')) ? 'is-invalid' : '' ?>" id="email" name="email" value="<?= (old("email")) ? old("email") : $user_edit["email"] ?>">
      <div class="invalid-feedback">
        <?= $validation->getError('email'); ?>
      </div>
    </div>
    <div class="mb-3">
      <?php if ($user_edit['role'] == 'student') : ?>
        <select class="form-select" aria-label="Default select example" name="role">
          <option selected value="student">Student</option>
        </select>
      <?php else : ?>

        <select class="form-select <?= ($validation->hasError('role')) ? 'is-invalid' : '' ?>" aria-label="Default select example" name="role">
          <option selected disabled>Select Role</option>
          <option <?php if (old("role")) {
                    echo (old("role") == 'admin') ? 'selected' : 'none';
                  } else {
                    echo ($user_edit['role'] == 'admin') ? 'selected' : 'none';
                  } ?> value="admin">Admin</option>
          <option <?php if (old("role")) {
                    echo (old("role") == 'anggota') ? 'selected' : '';
                  } else {
                    echo ($user_edit['role'] == 'anggota') ? 'selected' : '';
                  } ?> value="anggota">anggota</option>
        </select>
        <div class="invalid-feedback">
          <?= $validation->getError('role'); ?>
        </div>
      <?php endif; ?>
    </div>
    <button type="submit" class="btn btn-primary rounded-0">Edit User</button>
  </form>
</div>

<?= $this->endSection(); ?>