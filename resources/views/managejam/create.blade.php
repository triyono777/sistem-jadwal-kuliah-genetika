@extends('layouts.app')

@section('title',' Tambah Jam | Sistem Penjadwalan Kuliah')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Tambah Jam</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/home/dashboard"><i class="fas fa-igloo mr-2"></i>Home</a></li>
              <li class="breadcrumb-item"><a href="/managejam"></i>Manage Jam</a></li>
              <li class="breadcrumb-item active">Tambah Jam</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <!-- /.row -->
        <div class="row">
            <div class="col-6">
                <div class="card text-choThem">
                    <div class="card-header bg-greenTheme">
                        <h3 class="card-title text-whiteTheme">Form Tambah Jam</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive">
                        <form method="post" action="/managewaktu/managejam">
                            @csrf
                            <div class="form-group">
                                <label for="kode_jam">Kode Jam</label>
                                <select name="kode_jam" class="form-control select2bs4 @error('kode_jam') is-invalid @enderror">
                                    @foreach ($availableCode as $code) :
                                        <option value="{{ $code }}">{{ $code }}</option>
                                    @endforeach
                                </select>
                                @error('kode_jam')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                                @enderror    
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="jam">Jam</label>
                                        <select name="jam" class="form-control select2bs4 @error('jam') is-invalid @enderror">
                                            @for ($i=0; $i < 3; $i++) :
                                                @for ($j=0; $j < 10; $j++) :
                                                    <option value="{{ $i.$j }}">{{ $i.$j }}</option>
                                                    @if($i == 2 && $j == 3):
                                                        <?php break 2; ?>
                                                    @endif
                                                @endfor
                                            @endfor
                                        </select>
                                        @error('jam')
                                        <div class="invalid-feedback">
                                            {{$message}}
                                        </div>
                                        @enderror
                                    </div>
                                    <div class="col-md-6">
                                        <label for="menit">Menit</label>
                                        <select name="menit" class="form-control select2bs4 @error('menit') is-invalid @enderror">
                                            @for ($i=0; $i < 6; $i++) :
                                                @for ($j=0; $j < 10; $j++) :
                                                    <option value="{{ $i.$j }}">{{ $i.$j }}</option>
                                                    @if($i == 5 && $j == 9):
                                                        <?php break 2; ?>
                                                    @endif
                                                @endfor
                                            @endfor
                                        </select>
                                        @error('menit')
                                        <div class="invalid-feedback">
                                            {{$message}}
                                        </div>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div class="card-footer">
                            <a href="/managewaktu/managejam" class="btn btn-outline-greenTheme">Kembali</a>
                            <button type="submit" class="btn btn-greenTheme float-right">Tambah Jam</button>
                        </div>
                    </form>
                    <!-- /.card -->
                </div>
            </div>

        <!-- Main row -->
        <div class="row">
          
  </div>
  <!-- /.content-wrapper -->
  @endsection