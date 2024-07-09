<?php

namespace App\Models;

use CodeIgniter\Model;

class KelasModel extends Model
{
  protected $table      = 'kelas';
  protected $primaryKey = 'id';
  protected $useAutoIncrement = true;
  protected $useSoftDeletes = true;
  protected $allowedFields = [];
  protected $useTimestamps = true;
}
