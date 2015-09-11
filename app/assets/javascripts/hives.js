var ready;
ready = function() {
  var pusher = new Pusher('cf25b0bc9947e040c849');
  var chatWidget = new PusherChatWidget(pusher, {
    // chatEndPoint: 'pusher-realtime-chat-widget/src/php/chat.php'
  });

  $(document).on('click', '.bee-img', function(event) {
    event.preventDefault();
    var message = $(this).parent().attr('class');
    // Change this when pushing to heroku
    var route = document.location.href.slice(21) + '/favorite'
    console.log($(this).parent().attr('class'));
    $.ajax({
      method: 'PATCH',
      url: route,
      data: { message: message }
    }).done(function(response) {
      console.log(response)
      var hivedMessage = $(
      '<div class="hived-container">' +
        '<div class="hived-img">' +
          '<img src="' + response.user.image_url + '" width="32" height="32" />' +
        '</div>' +
        '<div>' +
          '<div class="hived-text">' + response.message.body.replace(/\\('|&quot;)/g, '$1').linkify() + '</div>' +
        '</div>' +
      '</div>')
    $('#favorites').append(hivedMessage);
    }).fail(function() {
      alert('failed');
    })
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);

