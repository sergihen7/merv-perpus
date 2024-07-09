<?php

namespace App\Models;

use CodeIgniter\Model;

class AplikasiModel extends Model
{
  protected $table      = 'aplikasi';
  protected $primaryKey = 'id';
  protected $useAutoIncrement = true;
  protected $useSoftDeletes = true;
  protected $allowedFields = [];
  protected $useTimestamps = true;
}
