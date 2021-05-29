@extends('Layout.base_template')

@section('content')

<div id="DataTable">

    <table class="table table-bordered table-hover" style="background-color:#f5f2ed;">
        <thead>
            <tr>
                <th>NO</th>
                <th>Date</th>
                <th>Time</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($All_Data as $key=> $Data)
                <tr>
                    <th>{{++$key}}</th>
                    <td>{{$Data->_date}}</td>
                    <td>{{$Data->_time}}</td>
                    <td><a href="{{asset('image_data')}}\{{$Data->image_path}}" target="_blank"><img style="width: 400px; height:250px;" src='{{asset('image_data')}}\{{$Data->image_path}}'></a></td>

                    <td><a onclick="return confirm('Do you want to delete this account?. Are you sure?')" href="delete_data/{{$Data->auto_id}}/{{$Data->image_path}}" class="btn btn-danger">Delete</a>

                </tr>
            @endforeach

        </tbody>
    </table>
</div>

<div style="text-align: center;">

    {{$All_Data->links()}}

</div>

@endsection