@extends('Layout.base_template')

@section('content')

    @if($errors->any())				
        @foreach ($errors->all() as $error)
            <div style="text-align:center;margin-top:20px;" class="alert alert-danger col-md-12 alert-dismissible fade show" role="alert">
                <strong>{!!$error!!}</strong> 
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endforeach
    @endif

    <div class="jumbotron">
        <h4 style="text-align:center;">Password Settings</h4>
        <hr class="my-4">

        {{ Form::open(array('action' => 'App\Http\Controllers\MainController@ChangePassword', 'method' => 'post', 'class' => 'login100-form validate-form')) }}
  				
            <div class="form-group row">
              <label for="current_password" class="col-sm-2 col-form-label">Current Password</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="current_password" name="current_password" placeholder="Current Password" required>
              </div>
            </div>

            <div class="form-group row">
                <label for="new_password" class="col-sm-2 col-form-label">New Password</label>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="new_password" name="new_password" placeholder="New Password" required>
                </div>
            </div>

            <div class="form-group row">
                <label for="con_password" class="col-sm-2 col-form-label">Confirm Password</label>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="con_password" name="con_password" placeholder="Confirm Password" required>
                </div>
            </div>


            <input type="submit" value="Change Password" class="btn btn-success btn-lg btn-block">

        {{ Form::close() }}
        
    </div>


    <div class="jumbotron">

        <h4 style="text-align:center;">Language Settings</h4>
        <hr class="my-4">

        {{ Form::open(array('action' => 'App\Http\Controllers\MainController@ChangeLanguage', 'method' => 'post', 'class' => 'login100-form validate-form')) }}
  				
            
            <div class="form-group row">
                <label for="con_password" class="col-sm-2 col-form-label">Select Language</label>
                <div class="col-sm-10">

                    <select class="form-control" name='language' id='languageSelect'>

                        <option id="1" value="Tamil">Tamil</option>
                        <option id="2" value="Sinhala">Sinhala</option>
                        <option id="3" value="English">English</option>

                    </select>

                </div>
            </div>

            <input type='text' value="{{$lang}}" style="display: none;" id="langID">

            <input type="submit" value="Change Language" class="btn btn-primary btn-lg btn-block">

        {{ Form::close() }}
        
    </div>

    <script>

        window.onload = function(){

            dataLang = document.getElementById("langID").value;
            
            if(dataLang == "tamil"){
                
                document.getElementById("1").selected=true;

            }else if(dataLang == 'sinhala'){

                document.getElementById("2").selected=true;
            
            }else if(dataLang == "english"){

                document.getElementById("3").selected=true;

            }

        }

    </script>

@endsection