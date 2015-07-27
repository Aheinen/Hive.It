var ready;
ready = function() {

  function statusChangeCallback(response) {
    // console.log('statusChangeCallback');
    // console.log(response);

    // if (response.status === 'connected') {
    //   testAPI();
    // } else if (response.status === 'not_authorized') {
    //   document.getElementById('status').innerHTML = 'Please log ' +
    //     'into this app.';
    // } else {
    //   document.getElementById('status').innerHTML = 'Please log ' +
    //     'into Facebook.';
    // }
  }

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '112568055755035',
    cookie     : true,
    xfbml      : true,
    version    : 'v2.2'
  });



  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  $('.fb-auth').click(function(event) {
    event.preventDefault();

    FB.login(function(response) {
      if (response.authResponse) {
        $.ajax({
          url: '/auth/facebook/callback',
          method: 'GET',
          data: response.authResponse
        })
        .done(function(response){
          document.location="/users/" + response.user_id + "/competencies"
        })
        .fail(function(response){
          console.log('login failed');
        });
      }
    }, { scope: 'email'})
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);