<?= $this->extend('template/dashboard-tmp'); ?>

<?= $this->section('content'); ?>

<h2>Profile</h2>
<?php if (session()->has('success')) : ?>
  <div class="alert alert-success" role="alert">
    <?= session()->get('success'); ?>
  </div>
<?php endif; ?>
<?php if (session()->has('error')) : ?>
  <div class="alert alert-danger" role="alert">
    <?= session()->get('error'); ?>
  </div>
<?php endif; ?>
<div class="card border-0">
  <form action="" method="POST" enctype="multipart/form-data">
    <div class="row rows-col-2">
      <div class="col">
        <div class="mb-3">
          <label class="form-label">Username</label>
          <input type="text" class="form-control rounded-0 my-input" value="<?= $user_login['username']; ?>" name="username">
        </div>
        <div class="mb-3">
          <label class="form-label">Fullname</label>
          <input type="text" class="form-control rounded-0 my-input" value="<?= $user_login['fullname']; ?>" name="fullname">
        </div>
        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="text" class="form-control rounded-0 my-input" value="<?= $user_login['email']; ?>" name="email">
        </div>
      </div>
      <div class="col">
        <div class="mb-3">
          <div class="card">
            <div class="card-body">
              <img src="<?= base_url('img/profile/' . $user_login['foto']); ?>" class="img-profile d-block mx-auto m-3" alt="Profile.Pic" style="max-width: 140px;" id="images">
              <input class="form-control" type="file" name="img" id="fileImage" onchange="onImage()">
            </div>
            <div class="card-footer">
              If you won't change your pic, just leave it empty
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row rows-col-2">
      <div class="col">
        <div class="mb-3">
          <label class="form-label">Alamat</label>
          <input type="text" class="form-control rounded-0 my-input" value="<?= $user_login['alamat']; ?>" name="alamat">
        </div>
      </div>
      <div class="col">
        <div class="mb-3">
          <label class="form-label">Password</label>
          <input type="password" class="form-control rounded-0 my-input" placeholder="Password Not Change" name="password">
        </div>
      </div>
    </div>

    <button type="submit" class="btn btn-dark rounded-0">Save Changes</button>
  </form>
</div>


<script>
  function onImage() {
    const images = document.querySelector('#images');
    const [imagesFile] = document.querySelector('#fileImage').files;
    images.src = URL.createObjectURL(imagesFile);
  }
</script>

<?= $this->endSection(); ?>