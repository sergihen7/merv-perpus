<?= $this->extend('template/home-tmp'); ?>

<?= $this->section('content'); ?>


<div class="row">
  <div class="col-11 col-md-6 col-lg-4  mx-auto mt-5">
    <?php if ($validation->hasError('password2')) : ?>
      <div class="alert alert-danger" role="alert">
        Password Not Match
      </div>
    <?php endif; ?>
    <div class="card card-body rounded-0 border-0">
      <form action="<?= base_url('auth/register'); ?>" method="POST">
        <img src="<?= base_url('img/web/' . $app['foto']); ?>" class="mx-auto d-block mb-5 mt-5" style="width: 100%; max-width: 150px;" alt="Logo">
        <input type="text" class="form-control mb-1 rounded-0" value="<?= old('username'); ?>" placeholder="Username" name="username">
        <input type="text" class="form-control mb-1 rounded-0" value="<?= old('fullname'); ?>" placeholder="Full Name" name="fullname">
        <input type="text" class="form-control mb-1 rounded-0" value="<?= old('email'); ?>" placeholder="Email" name="email">
        <input type="password" class="form-control mb-3 rounded-0" placeholder="Password" name="password">
        <input type="password" class="form-control mb-3 rounded-0" placeholder="Retry Password" name="password2">
        <button type="submit" class="btn btn-success rounded-0 w-100"><i class="bi bi-person-fill-add"></i> Sign up as new Member</button>
        <h6 class="text-muted text-center m-3">-OR-</h6>
        <a href="<?= base_url('sign-in'); ?>" class="btn btn-primary rounded-0 w-100"><i class="bi bi-person-fill"></i> Sign in</a>
      </form>
    </div>
  </div>
</div>

<?= $this->endSection(); ?>