@extends('dashboard')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <h3>Create Users</h3>
                    <form action="{{ route('user.postUser') }}" method="POST">
                        @csrf
                        <div class="form-group mb-3">
                            <input type="text" placeholder="Name" id="name" class="form-control" name="name" required autofocus>
                        </div>
                        <div class="form-group mb-3">
                            <input type="email" placeholder="Email" id="email" class="form-control" name="email" required autofocus>
                        </div>
                        
                        <div class="form-group mb-3">
                            <input type="password" placeholder="Password" id="password" class="form-control" name="password" required
                                autofocus>
                        </div>
                        <div class=" mx-auto" style="text-align:center">
                           <button type="submit" class="btn btn-primary btn-block">Submit add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
