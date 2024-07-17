<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Facades\DB;

class JadwalExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function __construct(string $semester, string $tahun) 
    {
        $this->semester = $semester;
        $tahunTemp = explode('-', $tahun);
        $this->tahun = implode('/', $tahunTemp);
    }

    public function collection()
    {
        return DB::table('jadwal')->where('semester', $this->semester)->where('tahun_ajaran', $this->tahun)->get();
    }
}
