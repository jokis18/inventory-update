@extends('shopify-app::layouts.default')
@section('styles')
<meta name="csrf-token" content="{{ csrf_token() }}">
<link href="{{ asset('css/app.css') }}" rel="stylesheet">
<link href="{{ asset('css/custom.css') }}" rel="stylesheet">
<link
  rel="stylesheet"
  href="https://unpkg.com/@shopify/polaris@5.1.0/dist/styles.css"
/>
 <link
  rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
  crossorigin="anonymous"
/>

@endsection
@section('content')
    <!-- You are: (shop domain name) -->
    <div id="load"></div>
    <div id="app"></div>
@endsection

@section('scripts')
    @parent
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="{{ asset('js/app.js') }}"></script>
    <script type="text/javascript">
        var AppBridge = window['app-bridge'];
        var actions = AppBridge.actions;
        var TitleBar = actions.TitleBar;
        var Button = actions.Button;
        var Redirect = actions.Redirect;
        var titleBarOptions = {
            title: 'Welcome',
        };
        var myTitleBar = TitleBar.create(app, titleBarOptions);
    </script>
    <script type="text/javascript">
        document.onreadystatechange = function () {
          var state = document.readyState;
          if (state == 'interactive') {
               document.getElementById('app').style.visibility="hidden";
          } else if (state == 'complete') {
              setTimeout(function(){
                 document.getElementById('interactive');
                 document.getElementById('load').style.visibility="hidden";
                 document.getElementById('app').style.visibility="visible";
              },1000);
          }
        }
          // ShopifyApp.init({
          //     apiKey: '{{ config('shopify-app.api_key') }}',
          //     shopOrigin: 'https://{{ Auth::user()->name }}',
          //     debug: false,
          //     forceRedirect: true
          // });
        </script>
@endsection